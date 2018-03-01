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

#ifndef _ADC_H
#define _ADC_H

#include "timer.h"
#include "stm32f10x_adc.h"

#define ADC_FAST_SAMPLE

#ifdef ADC_FAST_SAMPLE
    #define ADC_SAMPLE_TIME	ADC_SampleTime_7Cycles5
    #define ADC_DETECTION_TIME	(uint16_t)((7.5+12.5)*4*TIMER_MULT/12)	    // 4 ADC groups w/7.5 clk sample @ 12Mhz ADC clock (in us)
#else
    #define ADC_SAMPLE_TIME	ADC_SampleTime_28Cycles5
    #define ADC_DETECTION_TIME	(uint16_t)((28.5+12.5)*2*TIMER_MULT/12)	    // 2 ADC groups w/28.5 clk sample @ 12Mhz ADC clock (in us)
#endif	// ADC_FAST_SAMPLE

#define ADC_CHANNELS            2
#define ADC_CLOCK               RCC_PCLK2_Div6              // 12Mhz

#define ADC_RESOLUTION_BITS		12							// 12 bit ADC resolution
#define ADC_REF_VOLTAGE         3.30f
#define ADC_REF_VOLTAGE_uV      (3300 * 1000)	 // 1V = 1 milion μV
#define ADC_REF_VOLTAGE_nV      ((uint64_t)3300 * 1000000) // 1V = 1 bilion nV = 1000 000 000 nV, 3300 * 10^6
#define ADC_TO_VOLTAGE			(ADC_REF_VOLTAGE / (1<<ADC_RESOLUTION_BITS))    // 12 bit ADC resolution has 4096 values incl. 0
#define ADC_TO_MICROVOLTS		(ADC_REF_VOLTAGE_uV / (1<<ADC_RESOLUTION_BITS)) // 806 uV, 4096*806/1000 = 3301 mV, error = 1mV
// Dynamic range:
// 1V = 1 000 000 uV, MAX int32 = 2,147,483,647 ~ 2147V. This allows us to define some coefficients
// multiplied by 10 for additional resolution, leaving us range of +/- 200V. The hardware of BluePill-ESC32
// can work with Max +20V with current schematic (non-separated Vmotor and VmosfetDrv), so this is enough.
#define ADC_TO_NANOVOLTS		(ADC_REF_VOLTAGE_nV / (1<<ADC_RESOLUTION_BITS)) // 805664 nV, 4096*805664/1000 = 3299999.744 nV, error = -0.3 nV

#define ADC_VOLTS_R_TOP 	10000	// 10kΩ
#define ADC_VOLTS_R_BOTTOM 	1500	// 1.5kΩ

#define ADC_VOLTS_PRECISION	16
#define ADC_VOLTS_SLOPE		((float)(ADC_VOLTS_R_TOP + ADC_VOLTS_R_BOTTOM) / ADC_VOLTS_R_BOTTOM) // float inverted coefficient = 7.6(6), Rtop = 10K, Rbot = 1.5K, 1%
#define ADC_TO_VOLTS		(ADC_TO_VOLTAGE * ADC_VOLTS_SLOPE / ((1<<(ADC_VOLTS_PRECISION))+1) )
// The above definition is somewhat difficult to understand:
// ADC_TO_VOLTAGE = 0,000805664 * 4096 gives 3.3, for example ADC value 2047 is 2047*ADC_TO_VOLTAGE = 1.649194 V
// it's O.K., but we have a VIN voltage divider. To get it's ratio, we take the current flowing: Id = Uin /(R1+R2)
// U1 = Id * R2 == Uin/(R1+R2) * R2; Ratio = U1/Uin = Uin/(R1+R2)*R2/Uin = 1/(R1+R2)*R2 = 1/(10+1.5)*1.5 = 0,130434783
// so 10V give 1.30434783V or ADC=1619
// to do direct conversion ADC_Value must be multiplied by ADC_TO_VOLTAGE and then by ADC_VOLTS_SLOPE ~ 10/1.30434783 = 7,666666
// But what does here ((1<<(ADC_VOLTS_PRECISION))+1) divisor = 65537 ... scales back pre-scaled by ??? value
// TODO: Implement all this with fixed point / 64-bit arithmetic:
// 13.2192183 / 7,666666 = 1,724246015V -> ADCV = 1724.246015*4096/3300 = 2140

#define ADC_TO_BATT_UVOLTS		(ADC_TO_MICROVOLTS * ADC_VOLTS_SLOPE)
// example: ADC=1619, ADC_TO_BATT_UVOLTS = 806 * 1619 * 7,666666 = 10,004339V error = +4 mV
#define ADC_VOLTS_SLOPE_X0x10000	( (0x10000*(ADC_VOLTS_R_TOP + ADC_VOLTS_R_BOTTOM)) / ADC_VOLTS_R_BOTTOM ) // scaled float inverted coefficient; Rtop = 10K, Rbot = 1.5K, 1%
//#define ADC_CVT_TO_BATT_NVOLTS (x)  ( (uint64_t)( x*ADC_TO_NANOVOLTS*ADC_VOLTS_SLOPE_X0x10000)/0x10000  )
// example: ADC=1619,ADC_CVT_TO_BATT_NVOLTS(1619) = (805664*1619*502442)/65536 = 10000156853 nV = 10000,157mV, Error = +0.157mV
#define ADC_MIN_SHUNT_MILIOHMS		20	 // in mili Ohms, == 20 mΩ TODO: move to integer mΩ dimension
#define ADC_MAX_SHUNT_MILI_OHMS		1000 // in mili Ohms  == 1000 mΩ = 1 Ω
#define ADC_AMPS_PRECISION			16	 // bits. Um, ADC is 12-bit....
#define ADC_SHUNT_GAIN				1+11000/180
#define ADC_SHUNT_GAINx10			621  // G=62.1; x10Value = 10*G = 10*(1+Rout/Rgnd), original value: 10*50.9f, current values: Rout=11 kΩ, Rgnd=180 Ω, G=62.1
#define ADC_SHUNT_GAIN_X0x10		994  // 993.6 actually

#define ADC_MIN_ADVANCE		0.1f	    // in electrical degrees
#define ADC_MAX_ADVANCE		30.0f	// in electrical degrees
#define ADC_MIN_BLANKING_MICROS	0	    // hard limit define - in μS
#define ADC_MAX_BLANKING_MICROS 100	    // hard limit define - in μS
#define ADC_MIN_MIN_PERIOD	20	    // μS
#define ADC_MAX_MIN_PERIOD	500	    // μS
#define ADC_MIN_MAX_PERIOD	1000	    // μS
#define ADC_MAX_MAX_PERIOD	20000	    // μS

#define ADC_HIST_SIZE		64
#ifdef ADC_FAST_SAMPLE
#define ADC_MIN_COMP		30
#else
#define ADC_MIN_COMP		15
#endif
#define ADC_CROSSING_TIMEOUT	(250000*TIMER_MULT)

//#define ADC_COMMUTATION_ADVANCE	(0)				    // 0 deg
//#define ADC_COMMUTATION_ADVANCE	(crossingPeriod/16)		    // 3.75 deg
//#define ADC_COMMUTATION_ADVANCE	(crossingPeriod/8)		    // 7.5 deg
//#define ADC_COMMUTATION_ADVANCE	(crossingPeriod/4)		    // 15 deg
//#define ADC_COMMUTATION_ADVANCE	(crossingPeriod/2)		    // 30 deg
#define ADC_COMMUTATION_ADVANCE	(crossingPeriod/adcAdvance)		    // variable
// global variables, exported from ADC module:
extern float adcToAmps;
extern uint16_t adcAdvance; // adcAdvance has range [600 .. 2] for ADVANCE in electrical degrees [0.1 .. 30], thus is defined as uint16_t
extern uint32_t adcblankingMicros;
extern uint32_t adcMaxPeriod;	// global
extern uint32_t adcMinPeriod;
extern int32_t adcAmpsOffset; // this needs to be signed, in ADC units (reffered to the reference voltage)
extern volatile int32_t adcAvgAmps_ShuntVoltage;
extern volatile int32_t adcMaxAmps;
extern volatile int32_t adcAvgVolts_x0x65536;
extern uint16_t histSize;
extern uint32_t avgA, avgB, avgC;
extern volatile uint32_t detectedCrossing;
extern volatile uint32_t crossingPeriod;
extern volatile int32_t adcCrossingPeriod;

extern void adcInit(void);
extern void adcSetConstants(void);
extern void adcSetCrossingPeriod(int32_t crossPer);
extern uint64_t adcBattValToNanoVolts(uint16_t ADCValue);
extern uint32_t adcBattValToMiliVolts_comp(uint16_t Raw_ADCValue);
extern uint64_t adcToNanoAmps_default(uint16_t ADCValue);
extern uint16_t  adcToMiliAmps_default(uint16_t raw_ADCValue);
// Unused function: extern uint32_t adcGetInstantCurrent(void);

#endif
