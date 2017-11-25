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
#include "config.h"
#include "run.h"
#include "main.h"
#include "timer.h"
#include "fet.h"
#include "pwm.h"
#include "cli.h"
#include "binary.h"
#include "can.h"
#include "misc.h"
#include "stm32f10x_exti.h"
#include "stm32f10x_pwr.h"
#include "stm32f10x_iwdg.h"
#include "stm32f10x_dbgmcu.h"
#include <math.h>
#include "adc.h"

volatile uint32_t runCount;
uint32_t oldIdleCounter;    // The number of empty cycles in the main function.
// float idlePercent;          // percentage of free time in the main loop.
uint32_t U_idle_x100;		// percentage of free time in the main loop. DONE: convert above to UINT

float avgAmps, maxAmps;     // Average current, maximum current. TODO: Convert to micro amps 100A = 100*1.0E6 uA, within uint32 range

float avgBattVolts;				// Average VBatt voltage, sampled by ADC, then converted to Volts. TODO: Convert to integer dimension [milivolts] to opt out FLOPS
//uint32_t avg_uVolts;		// Average VBatt voltage, sampled by ADC, then converted to uVolts @ SystickHandler
uint32_t avg_BattmiliVolts;		// Average VBatt voltage, sampled by ADC, then converted to mVolts @ SystickHandler


float rpm;                 // The current speed in RPM. The measured value is calculated in the runRpm function and is used in runThrotLim.
uint32_t targetRpm;        // was float. target speed setting (we use this variable only in closed loop or closed loop thrust mode)
float rpmI;				   // This is the integrator's "tank" variable.
float rpmPTerm, rpmITerm;  // P & I terms for the PI regulator
float runRPMFactor;		   //
float runRpmLPF;
float maxCurrentSQRT;
escDisarmReasons_t disarmReason;
uint8_t commandMode;      // serial communication mode ascii or binary
uint8_t runArmCount;
volatile runModes_t runMode; // Run mode (open loop mode, RPM mode, thrust mode, servo mode)
uint8_t escId;
float maxThrust;

void runFeedIWDG(void)
{
#ifdef RUN_ENABLE_IWDG
	IWDG_ReloadCounter();  // feed the dog
#endif
}

// setup the hardware independent watchdog
uint16_t runIWDGInit(int ms)
{
	uint16_t prevReloadVal;
	int reloadVal;

#ifndef RUN_ENABLE_IWDG
	return 0;
#endif
	IWDG_ReloadCounter();

	DBGMCU_Config(DBGMCU_IWDG_STOP, ENABLE);

	// IWDG timeout equal to 10 ms (the timeout may varies due to LSI frequency dispersion)
	// Enable write access to IWDG_PR and IWDG_RLR registers
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);

	// IWDG counter clock: LSI/4
	IWDG_SetPrescaler(IWDG_Prescaler_4);

	// Set counter reload value to obtain 10ms IWDG TimeOut.
	//  Counter Reload Value	= 10ms/IWDG counter clock period
	//				= 10ms / (RUN_LSI_FREQ/4)
	//				= 0.01s / (RUN_LSI_FREQ/4)
	//				= RUN_LSI_FREQ/(4 * 100)
	//				= RUN_LSI_FREQ/400
	reloadVal = RUN_LSI_FREQ * ms / 4000;

	if (reloadVal < 1)
		reloadVal = 1;
	else if (reloadVal > 0xfff)
		reloadVal = 0xfff;

	prevReloadVal = IWDG->RLR;

	IWDG_SetReload(reloadVal);

	// Reload IWDG counter
	IWDG_ReloadCounter();

	// Enable IWDG (the LSI oscillator will be enabled by hardware)
	IWDG_Enable();

	return (prevReloadVal * 4000 / RUN_LSI_FREQ);
}


void runDisarm(escDisarmReasons_t reason)
{
	fetSetDutyCycle(0);
	timerCancelAlarm2();
	ESC_state = ESC_STATE_DISARMED;
#ifdef ENABLE_PWM_PROTOCOL
	pwmIsrAllOn();
#endif
	GPIO_SetBits(GPIO_STATUS_LED_PORT, GPIO_STATUS_LED_PIN); //digitalHi(statusLed);   // turn off
	GPIO_ResetBits(GPIO_ERROR_LED_PORT, GPIO_ERROR_LED_PIN); // digitalLo(errorLed);    // turn on
	disarmReason = reason;
}

void runArm(void)
{
	unsigned int i;

	fetSetDutyCycle(0);
	timerCancelAlarm2();
	GPIO_SetBits(GPIO_ERROR_LED_PORT, GPIO_ERROR_LED_PIN); //digitalHi(errorLed);         // turn LED off
	GPIO_ResetBits(GPIO_STATUS_LED_PORT, GPIO_STATUS_LED_PIN); // digitalLo(statusLed);   // turn LED on

	if (runMode == SERVO_MODE)
	{
		ESC_state = ESC_STATE_RUNNING;
	}
	else
	{
		ESC_state = ESC_STATE_STOPPED;
		if (inputMode == ESC_INPUT_UART)
			runMode = OPEN_LOOP;
		fetSetBraking(0);
	}

	// extra beeps signifying run mode
	for (i = 0; i < runMode + 1; i++)
	{
		fetBeep(150, 600);
		timerDelay(10000);
	}
}

void runStart(void)
{
	if (ESC_state == ESC_STATE_STOPPED)
	{
		// reset integral before new motor startup
		runRpmPIDReset();

		if ((parameters_asUint32[START_ALIGN_TIME] == 0) && (parameters_asUint32[START_STEPS_NUM] == 0))
		{
			ESC_state = 3;// ESC_STATE_STARTING;
			fetStartCommutation(0);
		}
		else
		{
			motorStartSeqInit();
		}
	}
}


void runStop(void)
{
	runMode = OPEN_LOOP;
	fetSetDutyCycle(0);
}

// set the duty cycle by user control (@Main thread) (cli) duty = 0 ~ 100
uint8_t runDuty(float duty)
{
	uint8_t ret = 0;

	if (duty >= 0.0f || duty <= 100.0f)
	{
		runMode = OPEN_LOOP;
		fetSetBraking(0);
		fetSetDutyCycle((uint16_t) (fetPeriod * duty * 0.01f)); // result >=0
		ret = 1;
	}

	return ret;
}

// 0 => 2^16 . Processed in IRQ handler - SysTick
void runSetpoint(uint16_t val)
{
	float target;

	if (ESC_state == ESC_STATE_RUNNING)
	{
		if (runMode == OPEN_LOOP)
		{
			fetSetDutyCycle(fetPeriod * val / ((1 << 16) - 1)); // result >=0
		}
		else if (runMode == CLOSED_LOOP_RPM)
		{
			// target RPM
			target = parameters_asUint32[PWM_RPM_SCALE] * val * (1.0f / ((1 << 16) - 1));

			// limit to configured maximum
			targetRpm =	(target > parameters_asUint32[PWM_RPM_SCALE]) ?	parameters_asUint32[PWM_RPM_SCALE] : target;
		}
		else if (runMode == CLOSED_LOOP_THRUST)
		{
			// target thrust
			target = maxThrust * val * (1.0f / ((1 << 16) - 1));

			// calc target RPM for requested thrust
			target = ((sqrtf(parameters_asFloat32[THR1TERM] * parameters_asFloat32[THR1TERM] + 4.0f * parameters_asFloat32[THR2TERM] * target)
					- parameters_asFloat32[THR1TERM]) / (2.0f * parameters_asFloat32[THR2TERM]));

			targetRpm =	(target > parameters_asUint32[PWM_RPM_SCALE]) ?	parameters_asUint32[PWM_RPM_SCALE] : target;
		}
	}
	else if (ESC_state == ESC_STATE_STOPPED && val > 0)
	{
		runStart();
	}
}


#ifdef ENABLE_PWM_PROTOCOL
void runNewInput(uint16_t setpoint)
{
	static uint16_t lastPwm;
	static float filteredSetpoint = 0;

	// Lowpass Input if configured
	// TODO: Make lowpass independent from pwm update rate
	if (parameters_asFloat32[PWM_LOWPASS])
	{
		filteredSetpoint = (parameters_asFloat32[PWM_LOWPASS] * filteredSetpoint + (float) setpoint) / (1.0f + parameters_asFloat32[PWM_LOWPASS]);
		setpoint = filteredSetpoint;
	}

	if (ESC_state == ESC_STATE_RUNNING && setpoint != lastPwm)
	{
		if (runMode == OPEN_LOOP)
		{
			// TODO: add separation between PWM communication and FET PWM parameters
			fetSetDutyCycle( fetPeriod * (int32_t) (setpoint - pwmLoValue)	/ (int32_t) (pwmHiValue - pwmLoValue));
		}
		else if (runMode == CLOSED_LOOP_RPM)
		{
			float target = parameters_asUint32[PWM_RPM_SCALE] * (setpoint - pwmLoValue) / (pwmHiValue - pwmLoValue);

			// limit to configured maximum
			targetRpm =	(target > parameters_asUint32[PWM_RPM_SCALE]) ?	parameters_asUint32[PWM_RPM_SCALE] : target;
		}
		// THRUST Mode
		else if (runMode == CLOSED_LOOP_THRUST)
		{
			float targetThrust;  // desired trust
			float target;        // target(rpm)

			// Calculate targetThrust based on input and MAX_THRUST
			targetThrust = maxThrust * (setpoint - pwmLoValue)
					/ (pwmHiValue - pwmLoValue);

			// Workaraound: Negative targetThrust will screw up sqrtf() and create MAX_RPM on throttle min. Dangerous!
			if (targetThrust > 0.0f)
			{
				// Calculate target(rpm) based on targetThrust
				target =
						((sqrtf(
								parameters_asFloat32[THR1TERM] * parameters_asFloat32[THR1TERM]
										+ 4.0f * parameters_asFloat32[THR2TERM]
												* targetThrust)
								- parameters_asFloat32[THR1TERM])
								/ (2.0f * parameters_asFloat32[THR2TERM]));
			}
			// targetThrust is negative (pwm_in < pwmLoValue)
			else
			{
				target = 0.0f;
			}

			// upper limit for targetRpm is configured maximum PWM_RPM_SCALE (which is MAX_RPM)
			targetRpm =	(target > parameters_asUint32[PWM_RPM_SCALE]) ?	parameters_asUint32[PWM_RPM_SCALE] : target;
		}
		else if (runMode == SERVO_MODE)
		{
			fetSetAngleFromPwm(setpoint);
		}

		lastPwm = setpoint;
	}
	else if ((ESC_state == ESC_STATE_NOCOMM || ESC_state == ESC_STATE_STARTING)
			&& setpoint <= pwmLoValue)
	{
		fetSetDutyCycle(0);
		ESC_state = ESC_STATE_RUNNING;
	}
	else if (ESC_state == ESC_STATE_DISARMED && setpoint > pwmMinValue
			&& setpoint <= pwmLoValue)
	{
		runArmCount++;
		if (runArmCount > RUN_ARM_COUNT)
			runArm();
	}
	else
	{
		runArmCount = 0;
	}

	if (ESC_state == ESC_STATE_STOPPED && setpoint >= pwmMinStart)
	{
		runStart();
	}
}
#endif   // ENABLE_PWM_PROTOCOL


// Called in SysTick_Handler, running at 2 kHz rate. Not called only in Servo mode.
// The task is to monitor/drive the state of the ESC and runDisarm() if there's an error.
static inline void run_Monitor(void)
{
	register uint32_t t, d;
	__disable_irq();        //__asm volatile ("cpsid i");
	t = timerMicros;
	d = detectedCrossing;
#ifdef ENABLE_PWM_PROTOCOL
	register uint32_t pwm_Proto_Valid_us = pwmValidMicros;
#endif   // ENABLE_PWM_PROTOCOL
	__enable_irq();        //__asm volatile ("cpsie i");

	if (ESC_state == ESC_STATE_STARTING && fetGoodDetects > fetStartDetects)
	{
		ESC_state = ESC_STATE_RUNNING;
		GPIO_SetBits(GPIO_STATUS_LED_PORT, GPIO_STATUS_LED_PIN); //digitalHi(statusLed);   // turn off
	}
	else if (ESC_state >= ESC_STATE_STOPPED)
	{   // running or starting
		d = (t >= d) ? (t - d) : (TIMER_MASK - d + t);
#ifdef ENABLE_PWM_PROTOCOL
		// timeout if PWM signal disappears
		if (inputMode == ESC_INPUT_PWM)
		{
			// in PWM mode determine if the PWM input has timed out
			pwm_Proto_Valid_us = (t >= pwm_Proto_Valid_us) ? (t - pwm_Proto_Valid_us) : (TIMER_MASK - pwm_Proto_Valid_us + t);

			if (pwm_Proto_Valid_us > PWM_TIMEOUT) runDisarm(REASON_PWM_TIMEOUT);
		}
#endif   // ENABLE_PWM_PROTOCOL
#ifdef 	ENABLE_CANBUS_PROTOCOL
		// timeout if CAN updates cease
		if (inputMode == ESC_INPUT_CAN)
		{
			uint32_t a = canData.validMicros;

			a = (t >= a) ? (t - a) : (TIMER_MASK - a + t);

			if (a > CAN_TIMEOUT)
				runDisarm(REASON_CAN_TIMEOUT);
		}
#endif //ENABLE_CANBUS_PROTOCOL

		if (ESC_state >= ESC_STATE_STARTING && d > ADC_CROSSING_TIMEOUT)
		{
			// During operation, an error occurred
			if (fetDutyCycle > 0)
			{
				runDisarm(REASON_CROSSING_TIMEOUT);
			}
			else
			{
				runArm();
#ifdef ENABLE_PWM_PROTOCOL
				pwmIsrRunOn();
#endif   // ENABLE_PWM_PROTOCOL
			}
		}
		else if (ESC_state >= ESC_STATE_STARTING && fetBadDetects > fetDisarmDetects)
		{ // After given number of errors detected in the running state, enter here
			if (fetDutyCycle > 0)	runDisarm(REASON_BAD_DETECTS);
		}
		else if (ESC_state == ESC_STATE_STOPPED)
		{
			adcAmpsOffset = adcAvgAmps_ShuntVoltage;	// record current amperage offset
		}
	}
	else if (ESC_state == ESC_STATE_DISARMED && !(runCount % (RUN_FREQ / 10))) // 2000 / 200 == 10, so with 10 FPS rate
	{ // we update the adcAmpsOffset & toggle the LED
		adcAmpsOffset = adcAvgAmps_ShuntVoltage;	// record current amperage offset
		GPIO_TogglePins(GPIO_ERROR_LED_PORT, GPIO_ERROR_LED_PIN); //digitalTogg(errorLed);
	}
}


void runRpmPIDReset(void)
{
	rpmI = 0.0f; // reset integrator tank
}

// called by runRPM(),  2000 times per second @ systick timer IRQ
// calculation of PID: rpm - the measured speed value; target - the target speed value
// result: Direct FET duty cycle in dimension of fetPeriod = FET_AHB_FREQ/fetSwitchFreq
// e.t. from 0 to fetPeriod
// for 20 kHz: fetPeriod  = (SystemCoreClock/2) / fetSwitchFreq	= 36Mhz/20kHz = 1800
static inline int32_t runRpmPID(float rpm, float target)
{
	float error;
	float ff, rpmP; // this is actually a PI regulator
	float iTerm = rpmI;
	int32_t output;

	// feed forward
	ff = ((target * target * parameters_asFloat32[FF1TERM] + target * parameters_asFloat32[FF2TERM]) / avgBattVolts) * fetPeriod;

	error = (target - rpm);

	if (error > 500) error = 500; // limits d_Duty/dt Original was: if (error > 1000.0f) error = 1000.0f;

	if (error > 0.0f)
	{
		rpmP = error * rpmPTerm;
		rpmI += error * rpmITerm; // integrate
	}
	else
	{
		rpmP = error * rpmPTerm * parameters_asFloat32[PNFAC];
		rpmI += error * rpmITerm * parameters_asFloat32[INFAC];
	}

	if (fetBrakingEnabled)
	{
		if (rpm < 300.0f)
		{
			fetSetBraking(0);
		}
		else if (error <= -100.0f)
		{
			fetSetBraking(1);
		}
		else if (fetBraking && error > -25.0f)
		{
			fetSetBraking(0);
		}
	}

	output = ff + (rpmP + rpmI) * (1.0f / 1500.0f) * fetPeriod;


	if (output >= fetPeriod)
		rpmI = iTerm; // don't allow integral to continue to rise if at max output
	if (output<0)
		{
		 rpmI = iTerm; // don't allow integral to continue to fall
		 output=fetPeriod/32; // if it goes sub-zero, this causes nasty overflow in Duty cycle
		}


	return output;
}

/*
// https://www.embeddedrelated.com/showarticle/121.php
// The faster the rate you execute an integrator or filter, the more resolution you need in state variables.
// If you're executing your control loop less than 5 times the intended bandwidth, that's too slow, and if you're executing
// your control loop more than 500 times the intended bandwidth, that's probably too fast.
// My goal is 0.1s response, 10 Hz and we execute at 2 kHz which is 200 x 10 Hz, so not too fast but close to be.

// Tuning: http://www.embedded.com/design/prototyping-and-development/4211211/PID-without-a-PhD
// Once you get the setup ready, set all gains to zero.
// If it isn't set already, set the proportional gain to a starting value between 1 and 100.
// Your system will probably either show terribly slow performance or it will oscillate.
// If you see oscillation, drop the proportional gain by factors of eight or 10 until the oscillation stops.
// If you don't see oscillation, increase the proportional gain by factors of eight or 10 until you start seeing
// oscillation or excessive overshoot. As with the differential controller, I usually tune right up to the point of too much
// overshoot then reduce the gain by a factor of two or four.
// Once you have your proportional gain set, start increasing integral gain. Your starting values will probably be from 0.0001 to 0.01.
// Here again, you want to find the range of integral gain that gives you reasonably fast performance without too much overshoot and without being too close to oscillation.
static int32_t PID_SumIntegral = 0;
uint16_t Motor_Kv	= 920;
static const int32_t Ki2_X16384 = 4;   // Integral gain = 0.0001 * 16384 == 1.6 = 2
static const int32_t Kp2_X1024 = 10*1024; // Proportional Gain = 1 * 1024 == 1024
#define MAX_RPM_PI_INTEGRAL_VAL1		 10000<<16
#define MIN_RPM_PI_INTEGRAL_VAL1		-(10000<<16)
static inline uint32_t runRpmPI_fastfixed1(uint32_t rpm_Current,	uint32_t rpm_Target) // UINT implementation
{
	int16_t  error;
	int32_t  pTerm_X1024;
	int32_t  iTerm;
	int32_t  PID_RPM_Value;
	//
	error = (rpm_Target - rpm_Current);
	pTerm_X1024 = Kp2_X1024 * error;	// proportional term

	// calculate the integral state with appropriate limiting:
	PID_SumIntegral = PID_SumIntegral + Ki2_X16384*error; // accumulate the pre-multiplied integral
	if (PID_SumIntegral > MAX_RPM_PI_INTEGRAL_VAL1) PID_SumIntegral = MAX_RPM_PI_INTEGRAL_VAL1;
	  else if (PID_SumIntegral	< MIN_RPM_PI_INTEGRAL_VAL1) PID_SumIntegral = MIN_RPM_PI_INTEGRAL_VAL1;
	iTerm =  PID_SumIntegral/(int32_t)16384;  // calculate the integral term
	//dTerm = Kd_x16384 * (rpm_Current - RpmPI_Dstate); // differential terms act as a brake. i.e. if the system is rapidly approaching the desired value, the dterm reduces the control output so that you do not overshoot
	//RpmPI_Dstate = rpm_Current; // save


	PID_RPM_Value = pTerm_X1024/(int32_t)1024 + iTerm; // pTerm + iTerm - dTerm;
    // PID_RPM_Value needs to be converted to Duty before output.
	// RPM = Motor_Kv * Motor_Volts. Motor Kv is better measured under load, hence "calibrated".
	// Motor_Volts = Vbatt * DutyCycle [0..100%], where 100% = 1;
	// So, RPM = Motor_Kv * Vbatt * DutyCycle <==> DutyCycle = RPM / (VbattV * Motor_Kv )
	// We're integer, so we need to scale.
	// Also, actual Duty is 100% when == fetPeriod, e.t. ADuty_TimerTicks = fetPeriod * duty% * 0.01f
	// Thus, ADuty_TimerTicks = fetPeriod * RPM / (100 * VbattV * Motor_Kv )
	// Check: fetPeriod = FET_AHB_FREQ / (switchFreq_kHz * 1000 * 2) = 36*10^6 / 20*1000*2 = 36*10^6 / 40000 = 900
	// Let rpm_Current = 200, rpm_Target = 10000, error = 9800, PID_RPM_Value = 9800 + 0
	// DutyValue = 9000*9800 / 12000 * 920 = 88200000 / 11040000 = 7, 63*920*12/900 = 772RPM
	// convert:
	int32_t IM_Val = (10 * fetPeriod * PID_RPM_Value);
	IM_Val = IM_Val / (int32_t)(avg_BattmiliVolts * Motor_Kv); // bah, division by unsigned converted everything to unsigned !!!!
	IM_Val = fetDutyCycle + IM_Val;
	if (IM_Val<10) IM_Val=10;
	else if(IM_Val>(int32_t)fetPeriod) IM_Val = fetPeriod;
	return IM_Val;
}
*/

// Another: http://www.ledin.com/integer-algorithms-implementation-and-issues/

static inline uint32_t runRpmPID_UINT(uint32_t rpm_Current, uint32_t rpm_Target) // UINT implementation
{
	int32_t error;
	int64_t ff, rpmP; // this is actually a PI regulator
	int32_t iTerm = rpmI; // take integrator value
	int32_t output;
	int32_t _FF1TERM,_FF2TERM;
	int32_t _rpmPTerm,_rpmITerm;
	// feed forward. FF1TERM & FF2TERM are sub-zero
	_FF1TERM = 16384 * parameters_asFloat32[FF1TERM];
	_FF2TERM = 16384 * parameters_asFloat32[FF2TERM];
	ff = (  1000*( (rpm_Target * rpm_Target * _FF1TERM)/16384 + (rpm_Target * _FF2TERM)/16384 ) / avg_BattmiliVolts ) * fetPeriod;

	error = (rpm_Target - rpm_Current);

	// limit reaction:
	if (error > 1000)
		error = 1000;
	else if (error < -1000) error = -1000;

	_rpmPTerm = 16384 * rpmPTerm;
	_rpmITerm = 16384 * rpmITerm;
	if (error > 0)
	{
		rpmP =  (error * _rpmPTerm) / 16384;
		rpmI += (error * _rpmITerm) / 16384; // accumulate in the integrator tank
	}
	else
	{
		rpmP = error * _rpmPTerm * parameters_asFloat32[PNFAC] /(int32_t) 16384;
		rpmI += error * _rpmITerm * parameters_asFloat32[INFAC] / (int32_t)16384; // accumulate
	}

	if (fetBrakingEnabled)
	{ // decide whether it might help:
		if ((error <= -100) && (rpm_Current > 300))
			fetSetBraking(1); // should brake
		else
			fetSetBraking(0); // disable braking
	}

	output = ff + ( (rpmP + rpmI) * fetPeriod ) / 1500;

	// don't allow integral to continue to rise if at max output
	if (output >= fetPeriod)
		rpmI = iTerm;
	else if (output <= 0)
	 {
		rpmI = iTerm; // don't allow integral to continue to fall
		output = fetPeriod / 32; // When it goes sub-zero, this causes nasty overflow in duty cycle
	 }

	return output;
}

// calculate the motor speed, calculate the PID output value according to the current speed and set the duty cycle
// called 2000 times per second @ systick timer
static inline uint8_t runRpm(void)
{
	if (ESC_state > ESC_STATE_STARTING)
	{ // ESC_STATE_RUNNING
//	rpm = rpm * 0.90f + (runRPMFactor / (float)crossingPeriod) * 0.10f;
//	rpm -= (rpm - (runRPMFactor / (float)crossingPeriod)) * 0.25f;
//	rpm = (rpm + (runRPMFactor / (float)crossingPeriod)) * 0.5f;

//  rpm are calculated with low-pass filter applied:
//	rpm = (rpm + ((32768.0f * runRPMFactor) / (float)adcCrossingPeriod)) * 0.5f; // increased resolution, fixed filter here
		rpm = runRpmLPF * rpm + ((32768.0f * runRPMFactor) / (float) adcCrossingPeriod)	* (1.0f - runRpmLPF); // increased resolution, variable filter here

		// run closed loop control
		if (runMode == CLOSED_LOOP_RPM)
		{
			//fetSetDutyCycle(runRpmPID(rpm, targetRpm));
 // We skip steps, because else STM32F103C8T6 gets loaded 100% and bad things (e.g. main thread hangs) happen.
 // Unfortunately, skipping steps causes FET braking experimental feature to behave badly.
			if( runCount & 1) fetSetDutyCycle(runRpmPID(rpm, targetRpm)); // runRpmPI_fastfixed1() runRpmPID()
			//fetSetDutyCycle(runRpmPID_UINT(rpm, targetRpm));
			return 1;
		}
		// run closed loop control also for THRUST mode
		else if (runMode == CLOSED_LOOP_THRUST)
		{
			fetSetDutyCycle(runRpmPID(rpm, targetRpm));
			return 1;
		}
		else
		{
			return 0;
		}
	}
	else
	{
		rpm = 0.0f;
		return 0;
	}
}


void runSetupPVD(void)
{
// Power Voltage Detector (PVD) can be used to detect if power voltage is below or above selected voltage. 
// It can be used for closing file using FATFS when detected voltage below treshold so you don’t break data on card or similar thing, sky is the limit here.
// PVD allows you to select 8 voltages between 2 and 3 volts. For detailed voltages, check reference manual.

	EXTI_InitTypeDef EXTI_InitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;

	// Configure EXTI Line16(PVD Output) to generate an interrupt on rising and falling edges
	EXTI_ClearITPendingBit(EXTI_Line16);
	EXTI_InitStructure.EXTI_Line = EXTI_Line16;
	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising;
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
	EXTI_Init(&EXTI_InitStructure);

	// Enable the PVD Interrupt
	NVIC_InitStructure.NVIC_IRQChannel = PVD_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);

	// Configure the PVD Level to 2.2V - to generate an interrupt when the voltage is less than 2.2V
	PWR_PVDLevelConfig(PWR_PVDLevel_2V2);

	// Enable the PVD Output
	PWR_PVDCmd(ENABLE);
}

void runInit(void)
{
	runSetupPVD();
	runCheckAndSetConstants();
	runMode = parameters_asUint32[STARTUP_MODE];

	SysTick_Config(SystemCoreClock / RUN_FREQ); // Number of ticks bw 2 interrupts, so we get 2 kHz Systick timer
	NVIC_SetPriority(SysTick_IRQn, 2);	    // lower priority

	// setup hardware watchdog
	runIWDGInit(20);
}

#define RUN_CURRENT_ITERM	(1.0f * 1000.0f / RUN_FREQ)
#define RUN_CURRENT_PTERM	10.0f
#define RUN_MAX_DUTY_INCREASE	1.0f

float currentIState;

// Calculate the PWM duty cycle based on PID - current limiter
static inline int32_t runCurrentPID(int32_t duty)
{
	float error;
	float pTerm, iTerm;

	error = avgAmps - parameters_asFloat32[MAX_CURRENT];

	currentIState += error;
	if (currentIState < 0.0f)
		currentIState = 0.0f;
	iTerm = currentIState * RUN_CURRENT_ITERM;

	pTerm = error * RUN_CURRENT_PTERM;
	if (pTerm < 0.0f)
		pTerm = 0.0f;

	duty = duty - iTerm - pTerm;

	if (duty < 0)
		duty = 0;

	return duty;
}


static inline void runThrotLim(uint32_t duty)
{
	float maxVolts; // max allowed Volts
	uint32_t maxDuty;

	// only if a limit is set. Skip calculations by disabling limit.
	if (parameters_asFloat32[MAX_CURRENT] > 0.0f)
	{
		// if current limiter is calibrated - best performance
		if (parameters_asFloat32[CL1TERM] != 0.0f)
		{
			maxVolts = parameters_asFloat32[CL1TERM] + parameters_asFloat32[CL2TERM] * rpm
					+ parameters_asFloat32[CL3TERM] * parameters_asFloat32[MAX_CURRENT]
					+ parameters_asFloat32[CL4TERM] * rpm * maxCurrentSQRT
					+ parameters_asFloat32[CL5TERM] * maxCurrentSQRT;
			maxDuty = maxVolts * (fetPeriod / avgBattVolts);

			if (duty > maxDuty)
				fetActualDutyCycle = maxDuty;
				else
				fetActualDutyCycle = duty;
		}
		// otherwise, use PID - less accurate, lower performance
		else
		{
			fetActualDutyCycle += fetPeriod * (RUN_MAX_DUTY_INCREASE * 0.01f);
			if (fetActualDutyCycle > duty)
				fetActualDutyCycle = duty;
			fetActualDutyCycle = runCurrentPID(fetActualDutyCycle); // pass it via the Current limiter
		}
	}
	else
	{
		fetActualDutyCycle = duty;
	}

	fetApplyDutyCycle(fetActualDutyCycle);
}




void SysTick_Handler(void) // rate was set to 2 KHz
{
	// reload the hardware watchdog
	runFeedIWDG();
#ifdef ENABLE_CANBUS_PROTOCOL
	canProcess(); // TODO: Shouldn't this run in the main thread ?
#endif // ENABLE_CANBUS_PROTOCOL
	register uint32_t _SAvgVolts = adcAvgVolts_x0x65536; // sample the volatile
	avgBattVolts = _SAvgVolts * ADC_TO_VOLTS; // convert the ADC scaled battery voltage (typically 12V)
	// avg_nVolts = adcBattValToNanoVolts(_SAvgVolts /65536); // convert the ADC scaled battery voltage (typically 12V) to nV. adcAvgVolts is scaled by 65537
	avg_BattmiliVolts = adcBattValToMiliVolts_comp( _SAvgVolts / 65536 );

	avgAmps = (adcAvgAmps_ShuntVoltage - adcAmpsOffset) * adcToAmps; // Average current = (Current ADC current - ADC current at stop(offset) ) * Conversion coeff.

	if (runMode == SERVO_MODE)
	{
		fetUpdateServo();
	}
	else
	{
		run_Monitor(); // Check the state of the ESC. shutdown on errors
		runRpm();      // Calculate RPM, calculate PID, sets run PWM duty cycle
		runThrotLim(fetDutyCycle); // Limit & apply FET duty
	}
	// Calculate the percentage of free time to send to the host computer via the serial port
	if (!(runCount % (10 * 1000 / RUN_FREQ))) // each 5 runs
	{// DONE: optimized floating point op:  idlePercent = 100.0f * (idleCounter - oldIdleCounter) / (SystemCoreClock * 10 / RUN_FREQ / minCycles);
		U_idle_x100 = 10000 * (idleCounter - oldIdleCounter) / (SystemCoreClock * 10 / RUN_FREQ / minCycles); // this squeezed only +1% idle
		oldIdleCounter = idleCounter;
		totalCycles = 0;
	}
	runCount++;
}


void PVD_IRQHandler(void)
{
	// voltage dropping too low
	if (EXTI_GetITStatus(EXTI_Line16) != RESET)
	{
		// shut everything down
		runDisarm(REASON_LOW_VOLTAGE);

		// turn on both LEDs
		GPIO_ResetBits(GPIO_STATUS_LED_PORT, GPIO_STATUS_LED_PIN); //digitalLo(statusLed);
		GPIO_ResetBits(GPIO_ERROR_LED_PORT, GPIO_ERROR_LED_PIN); //digitalLo(errorLed);

		EXTI_ClearITPendingBit(EXTI_Line16);
	}
}


void runCheckAndSetConstants(void)
{
	int32_t startupMode = parameters_asUint32[STARTUP_MODE];
	float maxCurrent = parameters_asFloat32[MAX_CURRENT];

	escId = (uint8_t) parameters_asUint32[ESC_ID];

	if (startupMode < 0 || startupMode >= NUM_RUN_MODES)
		startupMode = 0;

	if (maxCurrent > RUN_MAX_MAX_CURRENT)
		maxCurrent = RUN_MAX_MAX_CURRENT;
	else if (maxCurrent < RUN_MIN_MAX_CURRENT)
		maxCurrent = RUN_MIN_MAX_CURRENT;

	// TODO: runRPMFactor seems to be integer also - convert. 120/6 = 20
	runRPMFactor = (1.0E6f * (float) TIMER_MULT * 120.0f) / ( parameters_asUint32[MOTOR_POLES] * 6.0f );
	maxCurrentSQRT = sqrtf(maxCurrent);


	parameters_asUint32[STARTUP_MODE] = startupMode;
	parameters_asFloat32[MAX_CURRENT] = maxCurrent;


	// Calculate MAX_THRUST from PWM_RPM_SCALE (which is MAX_RPM) and THRxTERMs
	// Based on "thrust = rpm * a1 + rpm^2 * a2"
	maxThrust = parameters_asUint32[PWM_RPM_SCALE] * parameters_asFloat32[THR1TERM]	+ parameters_asUint32[PWM_RPM_SCALE] * parameters_asUint32[PWM_RPM_SCALE] * parameters_asFloat32[THR2TERM];

	rpmPTerm  = parameters_asFloat32[PTERM];
	rpmITerm  = parameters_asFloat32[ITERM] * 1000.0f / RUN_FREQ;
	runRpmLPF = parameters_asFloat32[RPM_MEAS_LP] * 1000.0f / RUN_FREQ; // RPM_MEAS_LP - default 0.5
}
