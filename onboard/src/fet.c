/*
    This file is part of AutoQuad ESC32.

    AutoQuad ESC32 is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    AutoQuad ESC32 is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with AutoQuad ESC32.  If not, see <http://www.gnu.org/licenses/>.

    Copyright © 2011, 2012, 2013  Bill Nesbitt
*/

#include <math.h>
#include "stm32f10x_tim.h"
#include "stm32f10x_dbgmcu.h"
#include "stm32f10x_iwdg.h"
#include "config.h"
#include "main.h"
#include "fet.h"
#include "timer.h"
#include "run.h"
#include "misc.h"

#include "adc.h"

/*
               -----------------------------------------------
              | Step1 | Step2 | Step3 | Step4 | Step5 | Step6 |
    ----------------------------------------------------------
   | A_H      |   1   |   0   |   0   |   0   |   0   |   1   |
    ----------------------------------------------------------
   | A_L      |   0   |   0   |   1   |   1   |   0   |   0   |
    ----------------------------------------------------------
   | B_H      |   0   |   0   |   0   |   1   |   1   |   0   |
    ----------------------------------------------------------
   | B_L      |   1   |   1   |   0   |   0   |   0   |   0   |
    ----------------------------------------------------------
   | C_H      |   0   |   1   |   1   |   0   |   0   |   0   |
    ----------------------------------------------------------
   | C_L      |   0   |   0   |   0   |   0   |   1   |   1   |
    ----------------------------------------------------------
    
* Step1 AH & BL
* Step2 CH & BL
* Step3 CH & AL
* Step4 BH & AL
* Step5 BH & CL
* Step6 AH & CL
*/

// The following arrays are used only in the fetSetStep() function. Bitbanding utilized.
// AH BH CH are switching between gpio mode, timer 1 ch PWM or io mode
// AL BL CL are set as gpio output 
//                STEP0   STEP1   STEP2   STEP3   STEP4   STEP5   STEP6     
uint32_t AH[7] = {  0,      1,      0,      0,      0,      0,      1};
uint32_t AL[7] = {AL_OFF, AL_OFF, AL_OFF, AL_ON,  AL_ON,  AL_OFF, AL_OFF};
uint32_t BH[7] = {  0,      0,      0,      0,      1,      1,      0};
uint32_t BL[7] = {BL_ON,  BL_ON,  BL_ON,  BL_OFF, BL_OFF, BL_OFF, BL_OFF};	// note: step 0 has B_LO energized
uint32_t CH[7] = {  0,      0,      1,      1,      0,      0,      0};
uint32_t CL[7] = {CL_OFF, CL_OFF, CL_OFF, CL_OFF, CL_OFF, CL_ON,  CL_ON};


uint32_t fetStartDuty;        // startup duty calculated ?
uint16_t fetStartDetects;     // start. Need to detect greater than this value "good detects" to assume the motor is ok. Then switch to the running state
uint16_t fetDisarmDetects;
uint32_t fetPeriod;			  // FET PWM Period
uint32_t fetActualDutyCycle;
volatile uint32_t fetDutyCycle;  // set the duty cycle when this variable is greater than 0. On motor running, 0 on stop running
volatile uint8_t fetStep;       // In the adc interrupt function, the next pahase commutation is calculated
volatile int8_t fetNextStep;    // Motor running the next Step, function fetSetStep, will be assigned to their own next Step      
volatile uint32_t fetGoodDetects; // the number of correct tests
volatile uint32_t fetBadDetects;  // Total number of errors detected
volatile uint32_t fetTotalBadDetects;  // Total number of errors detected
volatile uint32_t fetCommutationMicros; // the time of the motor commutation (acquired in the commutation))
uint8_t fetBrakingEnabled;        // = 1 to turn on the brake mode, allows the brake to be set in the parameter table
int8_t fetBrakingStatus;
int16_t startSeqCnt;
int8_t fetStepDir;
float fetServoAngle;            // The target value of the motor to be operated (valid only in servo mode) PID
float fetServoMaxRate;

int16_t fetSineLUT[FET_SERVO_RESOLUTION];	// cached sine results LUT

// ===================== The following five functions are used in servo mode: =================================================================

void fetCreateSine(void)
{
	float a;
	uint32_t i;

	for (i = 0; i < FET_SERVO_RESOLUTION; i++) // 0..1023
	{
		a = (float)M_PI * 2.0f * i / FET_SERVO_RESOLUTION; // multiplied by 2 to expand 2 times and ...

		// third order harmonic injection. Fill Sine LUT:
		fetSineLUT[i] = (sinf(a) + sinf(a * 3.0f) / 6.0f) * (2.0f / sqrtf(3.0f)) * (float) fetPeriod / 2.0f;
	}
}

// Applies the duty to the HW timer registers
void fetApplyServoDuty(uint16_t duty[3])
{
	FET_H_TIMER->FET_A_H_CHANNEL = duty[0];
	FET_H_TIMER->FET_B_H_CHANNEL = duty[1];
	FET_H_TIMER->FET_C_H_CHANNEL = duty[2];

	FET_MASTER_TIMER->FET_A_L_CHANNEL = duty[0] + FET_DEADTIME;
	FET_MASTER_TIMER->FET_B_L_CHANNEL = duty[1] + FET_DEADTIME;
	FET_MASTER_TIMER->FET_C_L_CHANNEL = duty[2] + FET_DEADTIME;
}

// fet servo mode, pid calculation:
void fetUpdateServo(void)
{
    static float myAngle = 0.0f;
    static float servoDState = 0.0f;
    float a, e;

    uint16_t pwm[3];
    int index;

	if (ESC_state == ESC_STATE_RUNNING)
	{
		*AL_BITBAND = 1; // use BitBand to do faster peripheral config
		*BL_BITBAND = 1;
		*CL_BITBAND = 1;

		*AH_BITBAND = 1;
		*BH_BITBAND = 1;
		*CH_BITBAND = 1;

		e = (fetServoAngle - myAngle);
		a = e * parameters_asFloat32[fSERVO_P]; // Servo mode PID calculation - Proportional component application
		if (a > fetServoMaxRate)
			a = fetServoMaxRate;
		else if (a < -fetServoMaxRate)
			a = -fetServoMaxRate;

		myAngle += a;

	myAngle += (a - servoDState) * parameters_asFloat32[fSERVO_D];  // differential component application
	servoDState = a;

	index = ((float)FET_SERVO_RESOLUTION * myAngle / 360.0f); // Find the index number @ the fetSine array
	while (index < 0)
	    index += FET_SERVO_RESOLUTION;
	index = index % FET_SERVO_RESOLUTION;
  // Calculate the 3 outputs duty cycles
	pwm[0] = fetPeriod/2 + fetSineLUT[index] * parameters_asFloat32[fSERVO_DUTY] / 100;

	index = ((index + FET_SERVO_RESOLUTION / 3) % FET_SERVO_RESOLUTION);
	pwm[1] = fetPeriod/2 + fetSineLUT[index] * parameters_asFloat32[fSERVO_DUTY] / 100;

	index = ((index + FET_SERVO_RESOLUTION / 3) % FET_SERVO_RESOLUTION);
	pwm[2] = fetPeriod/2 + fetSineLUT[index] * parameters_asFloat32[fSERVO_DUTY] / 100;

	fetApplyServoDuty(pwm); // send calculated PWM values to the HW registers
    }
    else {
    
   // Stop running, set all pins to GPIO mode
	*AL_BITBAND = 0;
	*BL_BITBAND = 0;
	*CL_BITBAND = 0;

	*AH_BITBAND = 0;
	*BH_BITBAND = 0;
	*CH_BITBAND = 0;
    }
}
// the angle at which the motor is to be run, from the acquired PWM value setting (used only in servo mode))
void fetSetAngleFromPwm(int32_t pwm)
{
	fetServoAngle = pwm * parameters_asFloat32[fSERVO_SCALE] * parameters_asUint32[uMOTOR_POLES] * 0.5f / fetPeriod;
}

// In the cli.c file, the function cliFuncPos call, (only in servo mode), sets the motor to run to given angle
void fetSetAngle(float angle)
{
	fetServoAngle = angle * parameters_asUint32[uMOTOR_POLES] * 0.5f;
}


#define FET_TEST_DELAY	1000
fetSelfTestResults_t fetSelfTest(void)
{
    int32_t baseCurrent;
    int32_t cl1, cl2, cl3;
    int32_t ch1, ch2, ch3;

    // must be disarmed to run self test
    if (ESC_state != ESC_STATE_DISARMED)
	return FET_TEST_NOT_RUN;

    fetSetStep(0);

    // shut everything off
    FET_A_L_OFF;
    FET_B_L_OFF;
    FET_C_L_OFF;

    FET_A_H_OFF;
    FET_B_H_OFF;
    FET_C_H_OFF;

    // record base current
    timerDelay(FET_TEST_DELAY);
    baseCurrent = adcAvgAmps_ShuntVoltage;
    // Test#1: AH BH CH as PWM output, AL BL CL - all output high:
    
    // manually set HI output duty cycle (1/16th power)
    FET_H_TIMER->FET_A_H_CHANNEL = fetPeriod - (fetPeriod>>4);
    FET_H_TIMER->FET_B_H_CHANNEL = fetPeriod - (fetPeriod>>4);
    FET_H_TIMER->FET_C_H_CHANNEL = fetPeriod - (fetPeriod>>4);

    // all lows on
    FET_A_L_ON;
    FET_B_L_ON;
    FET_C_L_ON;

    timerDelay(FET_TEST_DELAY*10);

    // Phase A hi FET
    *AH_BITBAND = 1;
    timerDelay(FET_TEST_DELAY);
    ch1 = (adcAvgAmps_ShuntVoltage - baseCurrent)>>ADC_AMPS_PRECISION;
    *AH_BITBAND = 0;
    timerDelay(FET_TEST_DELAY*10);

    // Phase B hi FET
    *BH_BITBAND = 1;
    timerDelay(FET_TEST_DELAY);
    ch2 = (adcAvgAmps_ShuntVoltage - baseCurrent)>>ADC_AMPS_PRECISION;
    *BH_BITBAND = 0;
    timerDelay(FET_TEST_DELAY*10);

    // Phase C hi FET
    *CH_BITBAND = 1;
    timerDelay(FET_TEST_DELAY);
    ch3 = (adcAvgAmps_ShuntVoltage - baseCurrent)>>ADC_AMPS_PRECISION;
    *CH_BITBAND = 0;
    timerDelay(FET_TEST_DELAY*10);
    
    // test#2: AH BH CH all output high, AL BL CL PWM output
    // all lows off
    FET_A_L_OFF;
    FET_B_L_OFF;
    FET_C_L_OFF;

    // manually set LO output duty cycle (1/16th power)
    FET_MASTER_TIMER->FET_A_L_CHANNEL = (fetPeriod>>4);
    FET_MASTER_TIMER->FET_B_L_CHANNEL = (fetPeriod>>4);
    FET_MASTER_TIMER->FET_C_L_CHANNEL = (fetPeriod>>4);

    *AL_BITBAND = 0;
    *BL_BITBAND = 0;
    *CL_BITBAND = 0;

    timerDelay(FET_TEST_DELAY*10);

    // all highs on
    FET_A_H_ON;
    FET_B_H_ON;
    FET_C_H_ON;

    timerDelay(FET_TEST_DELAY*10);

    // Phase A lo FET
    *AL_BITBAND = 1;
    timerDelay(FET_TEST_DELAY);
    cl1 = (adcAvgAmps_ShuntVoltage - baseCurrent)>>ADC_AMPS_PRECISION;
    *AL_BITBAND = 0;
    timerDelay(FET_TEST_DELAY*10);

    // Phase B lo FET
    *BL_BITBAND = 1;
    timerDelay(FET_TEST_DELAY);
    cl2 = (adcAvgAmps_ShuntVoltage - baseCurrent)>>ADC_AMPS_PRECISION;
    *BL_BITBAND = 0;
    timerDelay(FET_TEST_DELAY*10);

    // Phase C lo FET
    *CL_BITBAND = 1;
    timerDelay(FET_TEST_DELAY);
    cl3 = (adcAvgAmps_ShuntVoltage - baseCurrent)>>ADC_AMPS_PRECISION;
    *CL_BITBAND = 0;
    timerDelay(FET_TEST_DELAY*10);

    // shut everything off
    FET_A_L_OFF;
    FET_B_L_OFF;
    FET_C_L_OFF;

    FET_A_H_OFF;
    FET_B_H_OFF;
    FET_C_H_OFF;

    *AL_BITBAND = 0;
    *BL_BITBAND = 0;
    *CL_BITBAND = 0;

    fetApplyDutyCycle(0);
    fetSetStep(0);

    if (cl1 < 50)
	return FET_TEST_A_LO_FAIL;
    if (cl2 < 50)
	return FET_TEST_B_LO_FAIL;
    if (cl3 < 50)
	return FET_TEST_C_LO_FAIL;
    if (ch1 < 50)
	return FET_TEST_A_HI_FAIL;
    if (ch2 < 50)
	return FET_TEST_B_HI_FAIL;
    if (ch3 < 50)
	return FET_TEST_C_HI_FAIL;

    return FET_TEST_PASSED;
}

// this assume that one low FET is conducting (s/b B)
void fetBeep(uint16_t freq, uint16_t duration) {
    uint16_t prevReloadVal;
    int i;

    fetSetStep(0);

    prevReloadVal = runIWDGInit(999);

    __disable_irq(); // standard C-code preferred. __asm volatile ("cpsid i");

    for (i = 0; i < duration; i++) {
	// reload the hardware watchdog
	runFeedIWDG();

	FET_A_H_ON;
	timerDelay(8);
	FET_A_H_OFF;

	timerDelay(freq); // actually not frequency but microseconds level delay

	// reload the hardware watchdog
	runFeedIWDG();

	FET_C_L_ON;
	timerDelay(8);
	FET_C_H_OFF;

	timerDelay(freq);
    }

    __enable_irq(); // in assembly:  __asm volatile ("cpsie i");

    runIWDGInit(prevReloadVal);
}
// value: = 1 Sets the braking mode
void  fetSetBraking(int8_t value)
{
	if (value)
	{
		// set low side for inverted PWM
//	*AL_BITBAND = AH[fetStep];
//	*BL_BITBAND = BH[fetStep];
//	*CL_BITBAND = CH[fetStep];
		// Set AL BL CL to (pwm output mode?):
		*AL_BITBAND = 1;
		*BL_BITBAND = 1;
		*CL_BITBAND = 1;
		fetBrakingStatus = 1;
	}
	else
	{
		// switch off PWM  - set AL BL CL to low (in gpio output mode ?)
		*AL_BITBAND = 0;
		*BL_BITBAND = 0;
		*CL_BITBAND = 0;
		fetBrakingStatus = 0;
	}
}

// Set the duty cycle to the CPU HW registers
void inline fetApplyDutyCycle(uint32_t dutyCycle)
{
	register uint32_t tmp; // >=0

	tmp = dutyCycle; // >=0

	if (ESC_state == ESC_STATE_DISARMED)
		tmp = 0;

	// change the duty cycle of TIMER4 HW registers after changing the duty.
	FET_H_TIMER->FET_A_H_CHANNEL = tmp;
	FET_H_TIMER->FET_B_H_CHANNEL = tmp;
	FET_H_TIMER->FET_C_H_CHANNEL = tmp;

	if (fetBrakingEnabled)
	{
		tmp = dutyCycle + fetPeriod / 8; // result>=0

		if (tmp > fetPeriod) 	// sane limiting
			tmp = fetPeriod;
		// change the duty cycle of TIMER3
		FET_MASTER_TIMER->FET_A_L_CHANNEL = tmp; // it's uint16 type
		FET_MASTER_TIMER->FET_B_L_CHANNEL = tmp;
		FET_MASTER_TIMER->FET_C_L_CHANNEL = tmp;
	}
}


// Set fet duty cycle variable with bound checking 
void inline fetSetDutyCycle(uint32_t requestedDutyCycle)
{
	if (requestedDutyCycle > fetPeriod)
		requestedDutyCycle = fetPeriod;
	// else if (requestedDutyCycle > 0xFFFF) requestedDutyCycle = 0;
	fetDutyCycle = requestedDutyCycle;
}

static inline uint8_t fetGetNextStep(uint8_t step)
{
	uint_least8_t nextStep;

	nextStep = step + fetStepDir;
	if (nextStep > 6)
		nextStep = 1; // step 0 is not valid working state
	else if (nextStep < 1)
		nextStep = 6;

	return nextStep;
}

// We set the next step (FET state) in the normal operation, by calling this function.
// Low side FET switching is done via direct GPIO manipulation
// High side FET switching is accomplished by enabling or disabling
// control of the output pin by the PWM timer.  When disabled, the
// GPIO output register state is imposed on the pin (FET off.)
void fetSetStep(unsigned int n)
{
	__disable_irq(); // __asm volatile ("cpsid i");
	fetCommutationMicros = timerGetMicros();
	__enable_irq(); // __asm volatile ("cpsie i");

	fetNextStep = fetGetNextStep(n); // next step [1..6]

	// set high side  - switch H side between GPIO (off) and PWM mode according to the step state:
	*AH_BITBAND = AH[n];
	*BH_BITBAND = BH[n];
	*CH_BITBAND = CH[n];

	if (fetBrakingEnabled) // feature enabled in config
		fetSetBraking(fetBrakingStatus); // Apply according actual status variable.

	// set low side   - L side in GPIO mode - set high or low levels:
	FET_A_L_PORT->BSRR = AL[n]; //GPIOA_7
	FET_B_L_PORT->BSRR = BL[n]; //GPIOB_0
	FET_C_L_PORT->BSRR = CL[n]; //GPIOB_1
}

static void fetSetBaseTime(int32_t period)
{
	TIM_TimeBaseInitTypeDef TIM_TimeBaseStructure;

	TIM_TimeBaseStructInit(&TIM_TimeBaseStructure);
	TIM_TimeBaseStructure.TIM_Prescaler = 1;                      // 72 MHz -> 36 MHz
	TIM_TimeBaseStructure.TIM_Period = period - 1;
	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_CenterAligned1;
	TIM_TimeBaseInit(FET_MASTER_TIMER, &TIM_TimeBaseStructure);

	TIM_TimeBaseStructInit(&TIM_TimeBaseStructure);
	TIM_TimeBaseStructure.TIM_Prescaler = 1;                      // 72 MHz -> 36 MHz
	TIM_TimeBaseStructure.TIM_Period = period - 1;
	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_CenterAligned1;
	TIM_TimeBaseInit(FET_H_TIMER, &TIM_TimeBaseStructure);

	// sync clocks
	FET_H_TIMER->CNT = 0;	   // TIM4
	FET_MASTER_TIMER->CNT = 0; // TIM3 @ STM32F103C
}

void fetInit(void)
{
    GPIO_InitTypeDef GPIO_InitStructure;
    TIM_OCInitTypeDef  TIM_OCInitStructure;

    fetSetConstants();	// load defaults from the config

    fetDutyCycle = fetPeriod; // 100 % Duty
    fetStep = 0;

    // setup low side gates
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;

    // A GPIOA_7
    GPIO_InitStructure.GPIO_Pin = FET_A_L_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(FET_A_L_PORT, &GPIO_InitStructure);

    // B GPIOB_0
    GPIO_InitStructure.GPIO_Pin = FET_B_L_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(FET_B_L_PORT, &GPIO_InitStructure);

    // C GPIOB_1
    GPIO_InitStructure.GPIO_Pin = FET_C_L_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(FET_C_L_PORT, &GPIO_InitStructure);

    // setup GPIO default output states for high side

    // A  GPIOB_6
    GPIO_InitStructure.GPIO_Pin = FET_A_H_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(FET_A_H_PORT, &GPIO_InitStructure);

    // B  GPIOB_7
    GPIO_InitStructure.GPIO_Pin = FET_B_H_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(FET_B_H_PORT, &GPIO_InitStructure);

    // C  GPIOB_8
    GPIO_InitStructure.GPIO_Pin = FET_C_H_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(FET_C_H_PORT, &GPIO_InitStructure);

    // high side N-FET is inactive low
    FET_A_H_PORT->BSRR = AH_OFF;
    FET_B_H_PORT->BSRR = BH_OFF;
    FET_C_H_PORT->BSRR = CH_OFF;

    // allow FET PWM (slave) to run during core halt - when the jtag is debugged
    DBGMCU_Config(FET_DBGMCU_STOP, ENABLE);

    // stop MASTER during core halt
    DBGMCU_Config(FET_MASTER_DBGMCU_STOP, ENABLE); //timer3

    // Configure timer3 @ center aligned mode, the TIMx_ARR register is loaded into the buffer,
    // CC2, CC3, CC4 @ output mode, the output compare preload is enabled, PWM mode 1
    // setup LO side inverted PWM for FET braking (if enabled)
    TIM_OCStructInit(&TIM_OCInitStructure);
    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM1;
    TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
    TIM_OCInitStructure.TIM_Pulse = fetDutyCycle;
    TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_Low;

    // Phase A
    TIM_OC2Init(FET_MASTER_TIMER, &TIM_OCInitStructure);
    TIM_OC2PreloadConfig(FET_MASTER_TIMER, TIM_OCPreload_Enable);

    // Phase B
    TIM_OC3Init(FET_MASTER_TIMER, &TIM_OCInitStructure);
    TIM_OC3PreloadConfig(FET_MASTER_TIMER, TIM_OCPreload_Enable);

    // Phase C
    TIM_OC4Init(FET_MASTER_TIMER, &TIM_OCInitStructure);
    TIM_OC4PreloadConfig(FET_MASTER_TIMER, TIM_OCPreload_Enable);

    TIM_ARRPreloadConfig(FET_MASTER_TIMER, ENABLE);

    // Configure timer4 in center aligned mode, the TIMx_ARR register is loaded into the buffer,
    // CC1, CC2, CC3 @ output mode, the output compare preload is enabled, PWM mode 1

    // now setup the FET driver PWM timer (slave)
    FET_H_TIMER_REMAP;

    TIM_OCStructInit(&TIM_OCInitStructure);
    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM1;
    TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
    TIM_OCInitStructure.TIM_Pulse = fetDutyCycle;
    TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;

    // Phase A
    TIM_OC1Init(FET_H_TIMER, &TIM_OCInitStructure);
    TIM_OC1PreloadConfig(FET_H_TIMER, TIM_OCPreload_Enable);

    // Phase B
    TIM_OC2Init(FET_H_TIMER, &TIM_OCInitStructure);
    TIM_OC2PreloadConfig(FET_H_TIMER, TIM_OCPreload_Enable);

    // Phase C
    TIM_OC3Init(FET_H_TIMER, &TIM_OCInitStructure);
    TIM_OC3PreloadConfig(FET_H_TIMER, TIM_OCPreload_Enable);

    TIM_ARRPreloadConfig(FET_H_TIMER, ENABLE);

    TIM_Cmd(FET_H_TIMER, ENABLE);     // TIMER4
    TIM_Cmd(FET_MASTER_TIMER, ENABLE);// TIMER3

    FET_H_TIMER->CNT = 0;
    FET_MASTER_TIMER->CNT = 0;

    // Setup the GPIOs for timer4 and timer3:
    // now set AF mode for the high side gates
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;

    // A
    GPIO_InitStructure.GPIO_Pin = FET_A_H_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_Init(FET_A_H_PORT, &GPIO_InitStructure);

    // B
    GPIO_InitStructure.GPIO_Pin = FET_B_H_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_Init(FET_B_H_PORT, &GPIO_InitStructure);

    // C
    GPIO_InitStructure.GPIO_Pin = FET_C_H_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_Init(FET_C_H_PORT, &GPIO_InitStructure);

    // shut 'em down! - step 0 is shutdown state
    fetSetStep(0);  

//    fetSelfTest();
//    fetTest();
}

void fetMissedCommutate(int period)
{
	int32_t newPeriod;

	// commutate
	fetSetStep(fetNextStep);

	newPeriod = period + period / 4;
	if (newPeriod > 0xffff / TIMER_MULT)
		newPeriod = 0xffff / TIMER_MULT;
	timerSetAlarm2(newPeriod, fetMissedCommutate, period);
}

// scheduled in DMA1_Channel1_IRQHandler in adc.c with timerSetAlarm1() call
void fetCommutate(uint32_t period) // takes the crossingPeriod variable - uint32_t
{
	if (ESC_state != ESC_STATE_NOCOMM)
	{
		// keep count of in order ZC detections
		if (fetStep == fetNextStep)
		{
			timerCancelAlarm2();

			// commutate
			fetSetStep(fetStep);

			fetGoodDetects++;
			if (fetGoodDetects >= 6)
				fetBadDetects = 0;

			// in case of missed zc
			if (ESC_state == ESC_STATE_RUNNING) timerSetAlarm2(period + period / 2, fetMissedCommutate, period);
			else if (ESC_state == ESC_STATE_STARTING) //		timerSetAlarm2(period*2, fetMissedCommutate, period*2);
				timerSetAlarm2(period + period / 2, fetMissedCommutate, period);
		}
		else
		{  // detected an error
			fetBadDetects++;
			fetTotalBadDetects++;
			fetGoodDetects = 0;
		}
	}
}

// initiates motor start sequence
void motorStartSeqInit(void)
{
	// set globals to start position
	startSeqCnt = 0;

	// set first step
	fetSetBraking(0);
	fetSetStep(fetNextStep);

	// Start sequence will run Without commutation.
	ESC_state = ESC_STATE_NOCOMM;

	// start "motorStartSeq"
	timerSetAlarm2(0, motorStartSeq, 0);
}


// motor startup
void fetStartCommutation(uint8_t startStep)
{
	fetSetBraking(0);
	// fetStartDuty = parameters_asFloat32[START_VOLTAGE] / avgBattVolts * fetPeriod; // start cycle = start voltage / battery voltage (12V) * PWM pulse period
	fetStartDuty = 1000 * parameters_asFloat32[fSTART_VOLTAGE] / avg_BattmiliVolts * fetPeriod;
	adcSetCrossingPeriod(adcMaxPeriod / 2);
	detectedCrossing = timerMicros;
	fetDutyCycle = fetStartDuty;
	fetApplyDutyCycle(fetDutyCycle);
	adcMaxAmps = 0;
	fetGoodDetects = 0;
	fetBadDetects = 0;
	fetTotalBadDetects = 0;
	fetNextStep = startStep;

	// start. fetMissedCommutate will switch to next step state
	timerSetAlarm2(0, fetMissedCommutate, crossingPeriod);
}

// generates motor start sequence
void motorStartSeq(int period)
{
	int nextPeriod;

	// Static field to align rotor. Without commutation.
	if (startSeqCnt < parameters_asUint32[uSTART_ALIGN_TIME])
	{
		// PWM ramp up   -   the duty cycle slowly increases
		// fetStartDuty = parameters_asFloat32[START_ALIGN_VOLTAGE]	* ((float) startSeqCnt / parameters_asUint32[START_ALIGN_TIME])	/ avgBattVolts * fetPeriod;
		fetStartDuty = parameters_asFloat32[START_ALIGN_VOLTAGE]	* (1000 * (float) startSeqCnt / parameters_asUint32[uSTART_ALIGN_TIME])	/ avg_BattmiliVolts * fetPeriod;
		fetDutyCycle = fetStartDuty;
		fetApplyDutyCycle(fetDutyCycle);

		// Prepare next function call
		period = 1000 * TIMER_MULT; // 1000 uS = 1 ms
		nextPeriod = 1000 * TIMER_MULT;
		timerSetAlarm2(period, motorStartSeq, nextPeriod);
	}
	// Rotating field with optional acceleration but without commutation.
	else if (startSeqCnt < (parameters_asUint32[uSTART_ALIGN_TIME] + parameters_asUint32[uSTART_STEPS_NUM]))
	{
		// One time if entering "Rotating field"
		if (startSeqCnt == parameters_asUint32[uSTART_ALIGN_TIME])
		{
			period = parameters_asFloat32[fMAX_PERIOD] * TIMER_MULT;
			detectedCrossing = timerMicros;
		}

		fetSetStep(fetNextStep);  // next step [1..6]

		// Set PWM
		//fetStartDuty = parameters_asFloat32[START_VOLTAGE] / avgBattVolts * fetPeriod;
		fetStartDuty = (1000*parameters_asFloat32[fSTART_VOLTAGE]) / avg_BattmiliVolts * fetPeriod;
		fetDutyCycle = fetStartDuty;
		fetApplyDutyCycle(fetDutyCycle);

		// Prepare next function call
		nextPeriod = period - (parameters_asUint32[uSTART_STEPS_ACCEL] * TIMER_MULT);
		if (nextPeriod < (parameters_asUint32[uSTART_STEPS_PERIOD] * TIMER_MULT) )
			nextPeriod = crossingPeriod;

		timerSetAlarm2(period, motorStartSeq, nextPeriod);
	}
	else
	{
		// let motor run
		if (parameters_asUint32[uSTART_STEPS_NUM])
		{
			adcMaxAmps = 0;
			fetGoodDetects = 0;
			fetBadDetects = 0;
			fetTotalBadDetects = 0;

			// last one
			fetSetStep(fetNextStep);

			// cancel any existing ZC detection
			timerCancelAlarm1();

			// allow normal commutation
			ESC_state = ESC_STATE_STARTING;
		}
		// Continue normal startup with commutation
		else
		{ // The motor is running
		  // allow normal commutation
			ESC_state = ESC_STATE_STARTING;

			fetStartCommutation(fetNextStep);
		}
	}

	// count up step of startup sequence
	startSeqCnt++;
}

void fetTest(void)
{
	fetSetStep(1);

	__disable_fault_irq(); // __asm volatile ("cpsid f");
	/*
	 // pulse phase A HI FET
	 FET_A_H_PORT->BSRR = AH_ON;
	 timerDelay(5);
	 FET_A_H_PORT->BSRR = AH_OFF;
	 timerDelay(20);
	 FET_A_H_PORT->BSRR = AH_ON;
	 timerDelay(5);
	 FET_A_H_PORT->BSRR = AH_OFF;
	 timerDelay(5);
	 FET_A_H_PORT->BSRR = AH_ON;
	 timerDelay(10);
	 // leave in inactive state
	 FET_A_H_PORT->BSRR = AH_OFF;
	 */
//    *AH_BITBAND = 0;

	while (1)
	{
		FET_A_L_PORT->BSRR = AL_ON;
		FET_B_L_PORT->BSRR = BL_ON;
		FET_C_L_PORT->BSRR = CL_ON;

		timerDelay(10);

		FET_A_L_PORT->BSRR = AL_OFF;
		FET_B_L_PORT->BSRR = BL_OFF;
		FET_C_L_PORT->BSRR = CL_OFF;

		timerDelay(10);
	}

	FET_H_TIMER->FET_A_H_CHANNEL = 200;

	while (1)
		;

	__enable_irq(); //__asm volatile ("cpsie i");
}


void fetSetConstants(void)
{
	uint32_t switchFreq = parameters_asUint32[uSWITCH_FREQ]; // PWM freq default 20Khz
	float startVoltage = parameters_asFloat32[fSTART_VOLTAGE];
	uint32_t startDetects = parameters_asUint32[uGOOD_DETECTS_START];
	uint32_t disarmDetects = parameters_asUint32[uBAD_DETECTS_DISARM];
	uint32_t cfg_fetBraking = parameters_asUint32[uFET_BRAKING];
	float servoMaxRate = parameters_asFloat32[fSERVO_MAX_RATE];

	// bounds checking
	if (switchFreq > FET_MAX_SWITCH_FREQ)
		switchFreq = FET_MAX_SWITCH_FREQ;
	else if (switchFreq < FET_MIN_SWITCH_FREQ)
		switchFreq = FET_MIN_SWITCH_FREQ;

	if (startVoltage > FET_MAX_START_VOLTAGE)
		startVoltage = FET_MAX_START_VOLTAGE;
	else if (startVoltage < FET_MIN_START_VOLTAGE)
		startVoltage = FET_MIN_START_VOLTAGE;

	if (startDetects > FET_MAX_START_DETECTS)
		startDetects = FET_MAX_START_DETECTS;
	else if (startDetects < FET_MIN_START_DETECTS)
		startDetects = FET_MIN_START_DETECTS;

	if (disarmDetects > FET_MAX_DISARM_DETECTS)
		disarmDetects = FET_MAX_DISARM_DETECTS;
	else if (disarmDetects < FET_MIN_DISARM_DETECTS)
		disarmDetects = FET_MIN_DISARM_DETECTS;

	if (cfg_fetBraking > 0)
		cfg_fetBraking = 1;
	else
		cfg_fetBraking = 0;

	if (servoMaxRate <= 0.0f)
		servoMaxRate = 360.0f;
	// Calculate CPU timer frequency division register:
	uint32_t fetSwitchFreq;
	fetSwitchFreq = switchFreq * 1000 * 2; // Calculate the frequency from KHz setting
	fetPeriod = FET_AHB_FREQ / fetSwitchFreq; // bus speed / switching frequency - depends on fetSwitchFreq. Default: 36MHz/20kHz = 36000/20 = 3600/2 = 1800
	fetSetBaseTime(fetPeriod);

	fetStartDetects = startDetects;
	fetDisarmDetects = disarmDetects;
	fetBrakingEnabled = (uint8_t) cfg_fetBraking;
	fetServoMaxRate = servoMaxRate / RPM_PID_RUN_FREQ * parameters_asUint32[uMOTOR_POLES] * 0.5f;

	if (parameters_asSint32[iDIRECTION] >= 0 )
		fetStepDir = 1;
	else
		fetStepDir = -1;

	parameters_asUint32[uSWITCH_FREQ] = switchFreq;
	parameters_asFloat32[fSTART_VOLTAGE] = startVoltage;
	parameters_asUint32[uGOOD_DETECTS_START] = startDetects;
	parameters_asUint32[uBAD_DETECTS_DISARM] = disarmDetects;
	parameters_asUint32[uFET_BRAKING] = cfg_fetBraking;
	parameters_asFloat32[fSERVO_MAX_RATE] = servoMaxRate;
	parameters_asSint32[iDIRECTION] = fetStepDir;

	fetCreateSine();
}
