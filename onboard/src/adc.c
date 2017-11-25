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

#include "main.h"
#include "adc.h"
#include "fet.h"
#include "run.h"
#include "GPIO.h"
#include "timer.h"
#include "config.h"
#include "stm32f10x_adc.h"
#include "stm32f10x_dma.h"
#include "misc.h"

#ifdef ADC_FAST_SAMPLE
uint32_t adcRawData[ADC_CHANNELS*4]={0,};  // ADC values. DMA sampling is used. Values are automatically placed here
// Note: 32-bit variables are used
// Order:       0             1             2           3      | 	4         5         6       7
	//ADC1  SENSE_CURRENT SENSE_CURRENT    SENSE_B    SENSE_B  | SENSE_VIN SENSE_VIN SENSE_B SENSE_B  - in low 16 bits
	//ADC2    SENSE_A       SENSE_A        SENSE_C    SENSE_C  | SENSE_A   SENSE_A   SENSE_C SENSE_C  - in low 16 bits
	// Note:  Order is not SENSE_A,  SENSE_B,  SENSE_C
#else
uint32_t adcRawData[ADC_CHANNELS*2];
#endif

float adcToAmps;    // The current value of the ADC is converted to the actual current
uint16_t adcAdvance; // adcAdvance has range [600 .. 2]
uint32_t adcblankingMicros;
uint32_t adcMaxPeriod; // ADC max time in ... units
uint32_t adcMinPeriod; // ADC minimum commutation time in ... units


static uint16_t histIndex;  // the index value of the hist array
uint16_t histSize;          // size of the array
static uint16_t histA[ADC_HIST_SIZE]; // Adc converted values
static uint16_t histB[ADC_HIST_SIZE];
static uint16_t histC[ADC_HIST_SIZE];
uint32_t avgA, avgB, avgC; 	 // running averages over the history ?

int32_t adcAmpsOffset;		 // signed auto-measured OpAmp amplified offset voltage. Measured in runWatchDog() when ESC_STATE_STOPPED or ESC_STATE_DISARMED
volatile int32_t adcAvgAmps_ShuntVoltage; // modified inside .. handler
volatile int32_t adcMaxAmps; // modified inside .. handler
volatile int32_t adcAvgVolts_x0x65536;

uint8_t adcStateA, adcStateB, adcStateC;  //

volatile uint32_t detectedCrossing;
volatile uint32_t crossingPeriod; //
volatile int32_t adcCrossingPeriod;
uint32_t nextCrossingDetect;
uint32_t numLoops;

void adcCalibrateADC(ADC_TypeDef *ADCx)
{
    // Enable ADC reset calibration register
    ADC_ResetCalibration(ADCx);

    // Check the end of ADC reset calibration register
    while(ADC_GetResetCalibrationStatus(ADCx))
	{;}

    // Start ADC calibration
    ADC_StartCalibration(ADCx);

    // Check the end of ADC calibration
    while(ADC_GetCalibrationStatus(ADCx))
	{;}
}

void adcInit(void)
{
    ADC_InitTypeDef ADC_InitStructure;
    DMA_InitTypeDef DMA_InitStructure;
    NVIC_InitTypeDef NVIC_InitStructure;

    adcSetConstants();
    histSize = ADC_HIST_SIZE;

    // Use STM32's Dual Regular Simultaneous Mode capable of ~ 1.7M samples per second
    // NOTE: we assume that RCC code has already placed all pins into Analog In mode during startup

    // Good DMA NFO: https://blog.frankvh.com/2011/08/18/stm32f2xx-dma-controllers/
    // http://www.embedds.com/using-direct-memory-access-dma-in-stm23-projects/
    // DMA1 channel1 configuration (ADC1). Memory address must be aligned to your selected data width
    DMA_DeInit(DMA1_Channel1);
    DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)ADC1 + 0x4c;
    DMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t)&adcRawData[0];
    DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralSRC;
    DMA_InitStructure.DMA_BufferSize = sizeof(adcRawData)/4;
    DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
    DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
    DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Word;
    DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Word;
    DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
    DMA_InitStructure.DMA_Priority = DMA_Priority_VeryHigh;
    DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
    DMA_Init(DMA1_Channel1, &DMA_InitStructure);

    DMA_ITConfig(DMA1_Channel1, DMA_IT_TC | DMA_IT_HT, ENABLE); // Transfer Complete and Transfer Half Complete interrupt
    DMA_ClearITPendingBit(DMA1_IT_GL1 | DMA1_IT_TC1 | DMA1_IT_HT1);

    DMA_Cmd(DMA1_Channel1, ENABLE);

    // Enable the DMA1_Channel1 global Interrupt
    NVIC_InitStructure.NVIC_IRQChannel = DMA1_Channel1_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
    NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);

    // ADC1 configuration
//    ADC_InitStructure.ADC_Mode = ADC_Mode_RegSimult;
    ADC_InitStructure.ADC_Mode = ADC_Mode_RegInjecSimult;
    ADC_InitStructure.ADC_ScanConvMode = ENABLE;
    ADC_InitStructure.ADC_ContinuousConvMode = ENABLE;
    ADC_InitStructure.ADC_ExternalTrigConv = ADC_ExternalTrigConv_None;
    ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
    ADC_InitStructure.ADC_NbrOfChannel = sizeof(adcRawData)/4;
    ADC_Init(ADC1, &ADC_InitStructure);

#ifdef ADC_FAST_SAMPLE
    ADC_RegularChannelConfig(ADC1, ADC_Channel_5, 1, ADC_SAMPLE_TIME);	// SENSE_CURRENT
    ADC_RegularChannelConfig(ADC1, ADC_Channel_5, 2, ADC_SAMPLE_TIME);	// SENSE_CURRENT
    ADC_RegularChannelConfig(ADC1, ADC_Channel_2, 3, ADC_SAMPLE_TIME);	// SENSE_B
    ADC_RegularChannelConfig(ADC1, ADC_Channel_2, 4, ADC_SAMPLE_TIME);	// SENSE_B
    ADC_RegularChannelConfig(ADC1, ADC_Channel_4, 5, ADC_SAMPLE_TIME);	// SENSE_VIN
    ADC_RegularChannelConfig(ADC1, ADC_Channel_4, 6, ADC_SAMPLE_TIME);	// SENSE_VIN
    ADC_RegularChannelConfig(ADC1, ADC_Channel_2, 7, ADC_SAMPLE_TIME);	// SENSE_B
    ADC_RegularChannelConfig(ADC1, ADC_Channel_2, 8, ADC_SAMPLE_TIME);	// SENSE_B
#else
    ADC_RegularChannelConfig(ADC1, ADC_Channel_5, 1, ADC_SAMPLE_TIME);	// SENSE_CURRENT
    ADC_RegularChannelConfig(ADC1, ADC_Channel_2, 2, ADC_SAMPLE_TIME);	// SENSE_B
    ADC_RegularChannelConfig(ADC1, ADC_Channel_4, 3, ADC_SAMPLE_TIME);	// SENSE_VIN
    ADC_RegularChannelConfig(ADC1, ADC_Channel_2, 4, ADC_SAMPLE_TIME);	// SENSE_B
#endif
    ADC_DMACmd(ADC1, ENABLE);

    // ADC2 configuration:
    // ADC_InitStructure.ADC_Mode = ADC_Mode_RegSimult;
    // Already set: ADC_InitStructure.ADC_Mode = ADC_Mode_RegInjecSimult;
    // Already set: ADC_InitStructure.ADC_ScanConvMode = ENABLE;
    // Already set: ADC_InitStructure.ADC_ContinuousConvMode = ENABLE;
    // Already set: ADC_InitStructure.ADC_ExternalTrigConv = ADC_ExternalTrigConv_None;
    // Already set: ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
    // Already set: ADC_InitStructure.ADC_NbrOfChannel = sizeof(adcRawData)/4;
    ADC_Init(ADC2, &ADC_InitStructure);

#ifdef ADC_FAST_SAMPLE
    ADC_RegularChannelConfig(ADC2, ADC_Channel_1, 1, ADC_SAMPLE_TIME);	// SENSE_A
    ADC_RegularChannelConfig(ADC2, ADC_Channel_1, 2, ADC_SAMPLE_TIME);	// SENSE_A
    ADC_RegularChannelConfig(ADC2, ADC_Channel_3, 3, ADC_SAMPLE_TIME);	// SENSE_C
    ADC_RegularChannelConfig(ADC2, ADC_Channel_3, 4, ADC_SAMPLE_TIME);	// SENSE_C
    ADC_RegularChannelConfig(ADC2, ADC_Channel_1, 5, ADC_SAMPLE_TIME);	// SENSE_A
    ADC_RegularChannelConfig(ADC2, ADC_Channel_1, 6, ADC_SAMPLE_TIME);	// SENSE_A
    ADC_RegularChannelConfig(ADC2, ADC_Channel_3, 7, ADC_SAMPLE_TIME);	// SENSE_C
    ADC_RegularChannelConfig(ADC2, ADC_Channel_3, 8, ADC_SAMPLE_TIME);	// SENSE_C
#else
    ADC_RegularChannelConfig(ADC2, ADC_Channel_1, 1, ADC_SAMPLE_TIME);	// SENSE_A
    ADC_RegularChannelConfig(ADC2, ADC_Channel_3, 2, ADC_SAMPLE_TIME);	// SENSE_C
    ADC_RegularChannelConfig(ADC2, ADC_Channel_1, 3, ADC_SAMPLE_TIME);	// SENSE_A
    ADC_RegularChannelConfig(ADC2, ADC_Channel_3, 4, ADC_SAMPLE_TIME);	// SENSE_C
#endif

    ADC_ExternalTrigConvCmd(ADC2, ENABLE); // conversion by external trigger

    // enable and calibrate
    ADC_Cmd(ADC1, ENABLE);
    adcCalibrateADC(ADC1);

    ADC_Cmd(ADC2, ENABLE);
    adcCalibrateADC(ADC2);

    nextCrossingDetect = adcMaxPeriod;

    // setup injection sequence
    ADC_InjectedSequencerLengthConfig(ADC1, 1);
    ADC_InjectedSequencerLengthConfig(ADC2, 1);
    ADC_InjectedChannelConfig(ADC1, ADC_Channel_5, 1, ADC_SAMPLE_TIME);// SENSE_CURRENT
    ADC_InjectedChannelConfig(ADC2, ADC_Channel_4, 1, ADC_SAMPLE_TIME);// SENSE_VIN
    ADC_ExternalTrigInjectedConvCmd(ADC1, ENABLE);
    ADC_ExternalTrigInjectedConvCmd(ADC2, ENABLE);
    ADC_ExternalTrigInjectedConvConfig(ADC1, ADC_ExternalTrigInjecConv_None);
    ADC_ExternalTrigInjectedConvConfig(ADC2, ADC_ExternalTrigInjecConv_None);

    // Start ADC1 / ADC2 Conversions
    ADC_SoftwareStartConvCmd(ADC1, ENABLE);
}

// initial - called by fetStartCommutation()
void adcSetCrossingPeriod(int32_t crossPer)
{
    adcCrossingPeriod = crossPer<<15;
    crossingPeriod = crossPer;
}

static inline void adcGrowHist(void)
{
	register uint32_t i;

	avgA += histA[histIndex];
	avgB += histB[histIndex];
	avgC += histC[histIndex];

	for (i = histSize; i > histIndex; i--)
	{
		histA[i] = histA[i - 1];
		histB[i] = histB[i - 1];
		histC[i] = histC[i - 1];
	}

	histSize++;
}

static inline void adcShrinkHist(void)
{
	register uint32_t i;

	for (i = histIndex; i < histSize - 1; i++)
	{
		histA[i] = histA[i + 1];
		histB[i] = histB[i + 1];
		histC[i] = histC[i + 1];
	}

	histSize--;

	if (histIndex == histSize)	histIndex = 0;

	avgA -= histA[histIndex];
	avgB -= histB[histIndex];
	avgC -= histC[histIndex];
}


static inline void adcEvaluateHistSize(void)
{
	uint32_t sizeNeeded;

//  sizeNeeded = crossingPeriod/16/TIMER_MULT;
//    sizeNeeded = crossingPeriod/20/TIMER_MULT;
//  sizeNeeded = crossingPeriod/24/TIMER_MULT;
	//sizeNeeded = crossingPeriod / 32 / TIMER_MULT;
	sizeNeeded = crossingPeriod / (32 * TIMER_MULT);
//

	if (sizeNeeded > (histSize + 1) && histSize < ADC_HIST_SIZE)
		adcGrowHist();
	else if (sizeNeeded < (histSize - 1) && sizeNeeded > 1)
		adcShrinkHist();
}

//#pragma GCC optimize ("-O1")
#pragma GCC optimize ("-O3")
void DMA1_Channel1_IRQHandler(void)
{
	register uint16_t *raw = (uint16_t *) adcRawData;
	register uint32_t valA, valB, valC;//, valCOMP;
	//int ampsFlag = 0;
	uint32_t currentMicros;

	__disable_irq();// __asm volatile ("cpsid i"); same code with global GCC -O2, but much readable
	currentMicros = timerGetMicros();
	__enable_irq();//__asm volatile ("cpsie i");

#ifdef ADC_FAST_SAMPLE
// DMA channels can generate three interrupts: transfer finished, half-finished and transfer error.
	if ((DMA1->ISR & DMA1_FLAG_TC1) != RESET)
	{
		raw += (ADC_CHANNELS * 4);         // "4 16bit words" inside of 4 32-bit DWords
		// The pointer above is typed, so it's incremented by 16 bytes e.t. by 4 "DWords"
		// since Dwords are  used, raw[0] contains first sample of SENSE_VIN, raw[1] contains 0, raw[2] contains second sample of SENSE_VIN
		adcAvgVolts_x0x65536 -= (adcAvgVolts_x0x65536	- (int32_t) ((raw[0] + raw[2]) << (ADC_VOLTS_PRECISION - 1))) >> 6;
		// the operation above should average the 2 samples with the adcAvgVolts, but how it's done ...
		// let's fantasize: probably adcAvgVolts is already scaled. Value of 100, shifted by 16 bits gets 6553600.
		// we shift by 16-1 = 15 bits, because we sum 2 values and *divide* the result by 2
		// if adcAvgVolts is also 6553600, we get 0, so adcAvgVolts stays the same.
		// if adcAvgVolts is 5000000, we get 5000000 - (5000000 - 6553600) >> 6 == 5000000 - -24275 = 5000000 + 24275
		// = 5024275, e.t. the average slowly will converge to the new value with K=1/64. Lowpass filtering.
		// e.t. adcAvgVolts_x0x10000 = adcAvgVolts_x0x10000 - (adcAvgVolts_x0x10000 - newAVG*x0x10000)/64, e.t. adcAvgVolts + Difference/64
		// this is equal to  adcAvgVolts_x0x10000 = adcAvgVolts_x0x10000 + (newAVG*65536 - adcAvgVolts_x0x10000 )/64

	}
	else
	{// Um? DMA1_IT_HT1 - half transmission complete interrupt -> average current
		adcAvgAmps_ShuntVoltage -= (adcAvgAmps_ShuntVoltage - (int32_t) ((raw[0] + raw[2]) << (ADC_AMPS_PRECISION - 1)))	>> 6;
		// we take raw[0] + raw[2], these contain  SENSE_CURRENT first sample and + SENSE_CURRENT second sample
		// raw[1] and raw[3] are zero, because the buffer contains 32-bit values
	}
#else
	if ((DMA1->ISR & DMA1_FLAG_TC1) != RESET)
	{
		raw += (ADC_CHANNELS * 2);        // 2 16bit words each
		adcAvgVolts_x0x65536 -= (adcAvgVolts_x0x65536 - (int32_t)(raw[0]<<ADC_VOLTS_PRECISION))>>6;
	}
	else
	{
		adcAvgAmps_ShuntVoltage -= (adcAvgAmps_ShuntVoltage - (int32_t)(raw[0]<<ADC_AMPS_PRECISION))>>6;
	}
#endif

	DMA1->IFCR = DMA1_IT_GL1 | DMA1_IT_TC1 | DMA1_IT_HT1;// clear flags

	if (runMode == SERVO_MODE)
		return;// running in servo mode does not require AD sampling. Idle = 30% in this mode.

	// blanking time after commutation
	if (!fetCommutationMicros	|| ((currentMicros >= fetCommutationMicros) ?
					(currentMicros - fetCommutationMicros) : (TIMER_MASK - fetCommutationMicros + currentMicros)) > adcblankingMicros)

	{
#ifdef ADC_FAST_SAMPLE
		histA[histIndex] = valA = (raw[1] + raw[3]); // sum of Value[t-1] + Value [t]
		histB[histIndex] = valB = (raw[4] + raw[6]);
		histC[histIndex] = valC = (raw[5] + raw[7]);
#else
		histA[histIndex] = valA = raw[1];
		histB[histIndex] = valB = raw[2];
		histC[histIndex] = valC = raw[3];
#endif
		histIndex = (histIndex + 1) % histSize; 	// next index. if(++histIndex==histSize) histIndex=0; - more instructions
		avgA = avgA + valA - histA[histIndex];		// next index represents the oldest value in the hist
		avgB = avgB + valB - histB[histIndex];		// add current value, subtract oldest value. Total can add up to 64 values
		avgC = avgC + valC - histC[histIndex];
		// get average & compare
		if ((avgA + avgB + avgC) / histSize > (ADC_MIN_COMP * 3) && ESC_state != ESC_STATE_DISARMED)
		{ // Zero crossing:
			register int32_t periodMicros;
			// current time - last commutation time = two time intervals
			periodMicros = (currentMicros >= detectedCrossing) ?
							// current time - the time of the last commutation
							(currentMicros - detectedCrossing) : (TIMER_MASK - detectedCrossing + currentMicros);// get the adc interval twice

			if (periodMicros > nextCrossingDetect)
			{ //
				register int8_t nextStep = 0;

				if (!adcStateA && avgA >= (avgB + avgC) >> 1)
				{
					adcStateA = 1;
					if (fetStepDir > 0)
						nextStep = 6;
					else
						nextStep = 1;
				}
				else if (adcStateA && avgA <= (avgB + avgC) >> 1)
				{
					adcStateA = 0;
					if (fetStepDir > 0)
						nextStep = 3;
					else
						nextStep = 4;
				}
				else if (!adcStateB && avgB >= (avgA + avgC) >> 1)
				{
					adcStateB = 1;
					if (fetStepDir > 0)
						nextStep = 4;
					else
						nextStep = 5;
				}
				else if (adcStateB && avgB <= (avgA + avgC) >> 1)
				{
					adcStateB = 0;
					if (fetStepDir > 0)
						nextStep = 1;
					else
						nextStep = 2;
				}
				else if (!adcStateC && avgC >= (avgA + avgB) >> 1)
				{
					adcStateC = 1;
					if (fetStepDir > 0)
						nextStep = 2;
					else
						nextStep = 3;
				}
				else if (adcStateC && avgC <= (avgA + avgB) >> 1)
				{
					adcStateC = 0;
					if (fetStepDir > 0)
						nextStep = 5;
					else
						nextStep = 6;
				}

				if (nextStep && periodMicros > adcMinPeriod)
				{
					if (periodMicros > adcMaxPeriod)
						periodMicros = adcMaxPeriod;

//		    crossingPeriod = (crossingPeriod*3 + periodMicros)/4;
//		    crossingPeriod = (crossingPeriod*5 + periodMicros)/6;
					adcCrossingPeriod += ((periodMicros << 15) - adcCrossingPeriod) >> 3;
					crossingPeriod = adcCrossingPeriod >> 15;
//		    adcCrossingPeriod += ((periodMicros<<15) - adcCrossingPeriod)>>4;
//		    crossingPeriod = adcCrossingPeriod>>15;
//		    crossingPeriod = (crossingPeriod*7 + periodMicros)/8;
//		    crossingPeriod = (crossingPeriod*15 + periodMicros)/16;

					// schedule next commutation
					fetStep = nextStep;
					fetCommutationMicros = 0;
					timerSetAlarm1(	crossingPeriod	/ 2- (ADC_DETECTION_TIME*(histSize+2))/2 - ADC_COMMUTATION_ADVANCE,	fetCommutate, crossingPeriod);

					// record crossing time
					detectedCrossing = currentMicros;

					// resize history based on period
					adcEvaluateHistSize();

					// calculate next crossing detection time
					//		nextCrossingDetect = crossingPeriod*2/3;
					nextCrossingDetect = crossingPeriod * 3 / 4;
					//		nextCrossingDetect = crossingPeriod*6/8;

					// record highest current draw for this run
					if (adcAvgAmps_ShuntVoltage > adcMaxAmps)
						adcMaxAmps = adcAvgAmps_ShuntVoltage;
				}
			}
		}
	}
}

// start injected conversion of current sensor.  Useful for current sensor HW debug
int32_t adcGetInstantCurrent(void)
{
	ADC_ClearFlag(ADC1, ADC_FLAG_JEOC);
	ADC_SoftwareStartInjectedConvCmd(ADC1, ENABLE);
	while (ADC_GetFlagStatus(ADC1, ADC_FLAG_JEOC) != SET)
		;
	return (int32_t) ADC_GetInjectedConversionValue(ADC1, ADC_InjectedChannel_1);
}

void adcSetConstants(void)
{
	uint32_t shuntResistance_miliOhm = parameters_asUint32[SHUNT_RESISTANCE_MILIOHM];
	float advance = parameters_asFloat32[ADVANCE];
	float blankingMicros = parameters_asFloat32[BLANKING_MICROS];
	float minPeriod = parameters_asFloat32[MIN_PERIOD];
	float maxPeriod = parameters_asFloat32[MAX_PERIOD];

	// bounds checking
	if (shuntResistance_miliOhm > ADC_MAX_SHUNT_MILI_OHMS)		shuntResistance_miliOhm = ADC_MAX_SHUNT_MILI_OHMS;
	else if (shuntResistance_miliOhm < ADC_MIN_SHUNT_MILIOHMS)	shuntResistance_miliOhm = ADC_MIN_SHUNT_MILIOHMS;

	if (advance > ADC_MAX_ADVANCE)		advance = ADC_MAX_ADVANCE;
	else if (advance < ADC_MIN_ADVANCE) advance = ADC_MIN_ADVANCE;

	if (blankingMicros > ADC_MAX_BLANKING_MICROS)		blankingMicros = ADC_MAX_BLANKING_MICROS;
	else if (blankingMicros < ADC_MIN_BLANKING_MICROS)	blankingMicros = ADC_MIN_BLANKING_MICROS;

	if (minPeriod > ADC_MAX_MIN_PERIOD)					minPeriod = ADC_MAX_MIN_PERIOD;
	else if (minPeriod < ADC_MIN_MIN_PERIOD)			minPeriod = ADC_MIN_MIN_PERIOD;

	if (maxPeriod > ADC_MAX_MAX_PERIOD)					maxPeriod = ADC_MAX_MAX_PERIOD;
	else if (maxPeriod < ADC_MIN_MAX_PERIOD)			maxPeriod = ADC_MIN_MAX_PERIOD;

	adcToAmps = ((ADC_TO_VOLTAGE / ((1 << (ADC_AMPS_PRECISION)) + 1)) / (ADC_SHUNT_GAINx10 * shuntResistance_miliOhm / 10000.0f));
	adcAdvance = 100.0f / (advance * (50.0f / 30.0f)); // TODO: very carefully optimize such expressions !!
	adcblankingMicros = blankingMicros * TIMER_MULT;
	adcMinPeriod = minPeriod * TIMER_MULT;
	adcMaxPeriod = maxPeriod * TIMER_MULT;

	parameters_asUint32[SHUNT_RESISTANCE_MILIOHM] = shuntResistance_miliOhm;
	parameters_asFloat32[ADVANCE] = advance;
	parameters_asFloat32[BLANKING_MICROS] = blankingMicros;
	parameters_asFloat32[MIN_PERIOD] = minPeriod;
	parameters_asFloat32[MAX_PERIOD] = maxPeriod;
}

// We've got a fixed point converter w/o division (compiles to smull,umull and bitshifting):
// verified on X86_64
// Dynamic range with current 'slope' values: 0..50-bits used, Intermediate Value = 0..0x5e3a09246dcc0
// Output= 0..25293 mv = 0..25V
// Error with current values: +0.15mV @ 10V (error truncated so the true value got)
// Some tools: https://web2.0calc.com/; https://defuse.ca/big-number-calculator.htm
// http://homepage.divms.uiowa.edu/~jones/bcd/divide.html
uint64_t inline adcBattValToNanoVolts(uint16_t Raw_ADCValue)
{return (uint64_t)( Raw_ADCValue*ADC_TO_NANOVOLTS*ADC_VOLTS_SLOPE_X0x10000)/0x10000;
}

// 1V = 10^9 nV = 10^6 uV = 10^3 mV, 1mV = 10^6 nV
uint32_t inline adcBattValToMiliVolts(uint16_t Raw_ADCValue)
{ uint32_t pmV = adcBattValToNanoVolts(Raw_ADCValue)/0x100000; // pseudo-milivolts
  pmV = pmV * 105 / 100 ;// roughly compensated
  return pmV;
}


// Nanovolts -> milivots to get into 32-bit range. Tested: Max Error = -5/+2mV [1.5V; 25V], +0.6mv @ 13.2V
uint32_t inline adcBattValToMiliVolts_comp(uint16_t raw_ADCValue) // compensated++
{ register uint32_t pmV  = (uint64_t)( raw_ADCValue*ADC_TO_NANOVOLTS*ADC_VOLTS_SLOPE_X0x10000)/(0x10000*128); // 64-bit division implemented as shift
  //uint32_t pmV = nV/128; // 1048576 == 0x100000; pseudo-milivolts
/*double dpmV = nV/64.0; dpmV = dpmV / 16384.0; // get our value
  dpmV = 25293.436929 - dpmV; // difference = actual value - our value
  dpmV = 16384.0 * dpmV; // scale back to return at /64 range
  dpmV = (nV/64.0)/dpmV; // exact divisor for compensation value. Round up - get smaller voltage, round down - larger..
*/
  return  pmV / 7812; // get compensated value. uint32 divisions have max penalty 12 clocks each
}


// Using current default shunt value of 20 mili Ohm, we can get away without calling into division routine:
//
uint64_t  inline adcToNanoAmps_default(uint16_t raw_ADCValue)
{ // U_opamp_out, nv = ADCValue * ADC_TO_NANOVOLTS
  // Ireal,na = U_opamp_out / (R,Ohm * Ka_opamp) => (Ireal/0x10000),na = U_opamp_out / (0x10000 * R,Ohm * Ka_opamp)
  // return (10*0x10000 * ADCValue * ADC_TO_NANOVOLTS) / (DEFAULT_SHUNT_RESISTANCE_Ohm_x0x10000 * ADC_SHUNT_GAINx10);
  // we want to get away w/o true division, so we do the 'slope' trick again:
  uint32_t OutNanovolts = raw_ADCValue * ADC_TO_NANOVOLTS; // MAX_ADCValue * ADC_TO_NANOVOLTS = 4096*805664 = 3299999744 (within 32-bit range).
  uint16_t Default_slope_X0x10000 = 52766;//0x10000/( float(ADC_SHUNT_GAIN*DEFAULT_SHUNT_RESISTANCE_mOhm)/1000.0);
  return ((uint64_t)OutNanovolts * Default_slope_X0x10000) / 0x10000;
}

// roughly compensated. I read articles below, and got my solution:
// http://stackoverflow.com/questions/22494468/is-there-a-fast-way-to-divide-a-long-by-1000000-besides-using-the-operator
// consult also http://www.hackersdelight.org/magic.htm
uint16_t  adcToMiliAmps_default(uint16_t raw_ADCValue)
{ // U_opamp_out, nv = ADCValue * ADC_TO_NANOVOLTS
  // Ireal,na = U_opamp_out / (R,Ohm * Ka_opamp) => (Ireal/0x10000),na = U_opamp_out / (0x10000 * R,Ohm * Ka_opamp)
  // return (10*0x10000 * ADCValue * ADC_TO_NANOVOLTS) / (DEFAULT_SHUNT_RESISTANCE_Ohm_x0x10000 * ADC_SHUNT_GAINx10);
  // we want to get away w/o true division, so we do the 'slope' trick again:
  uint32_t OutNanovolts = raw_ADCValue * ADC_TO_NANOVOLTS;
  uint16_t Default_slope_X0x10000 = 55404;//0x10000/( float(ADC_SHUNT_GAIN*DEFAULT_SHUNT_RESISTANCE_mOhm)/1000.0);
  return ((uint64_t)OutNanovolts * Default_slope_X0x10000) / 0x1000000000;
}
