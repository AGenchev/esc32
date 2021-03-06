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

#include "timer.h"
#include "stm32f10x_tim.h"
#include "misc.h"

timerStruct_t timerData;
volatile uint32_t timerMicros;

// must be called at least once every 65536 ticks in order for this strategy to work; e.t. at least 30Hz rate
// TODO - consider interrupt interference
uint32_t timerGetMicros(void) // maintains 32-bit timer counter using a 16-bit hardware timer
{
	static uint16_t timerLast; // previous HW counter value
	static uint16_t hiBits;
	register uint16_t tmp;

	tmp = TIMER_TIM->CNT; // sample the counter

	if (tmp < timerLast) // counter had overflow & begun from 0 before the current time
		hiBits++;

	timerLast = tmp;

	timerMicros = (hiBits << 16 | tmp) & TIMER_MASK; // update global var

	return timerMicros;
}

// we use timer2 for delay:
void timerDelay(uint16_t us)
{
	uint16_t cnt = TIMER_TIM->CNT;
	uint16_t targetTimerVal = cnt + us * TIMER_MULT; // TIMER_MULT=2 when timer resolution = 0.5 µs, timer freq. = 2 MHz

	if (targetTimerVal < cnt) // we got overflow
	{
		// wait till timer rolls over
		while (TIMER_TIM->CNT > targetTimerVal)
			{;}
	}
	while (TIMER_TIM->CNT < targetTimerVal)
		{;}
}

// cancel channel 1, compare interrupt
void timerCancelAlarm1(void)
{
	TIMER_TIM->DIER &= (uint16_t) ~TIM_IT_CC1;
	TIM_ClearITPendingBit(TIMER_TIM, TIM_IT_CC1);
}

// cancel channel 2, compare interrupt
void timerCancelAlarm2(void)
{
	TIMER_TIM->DIER &= (uint16_t) ~TIM_IT_CC2;
	TIM_ClearITPendingBit(TIMER_TIM, TIM_IT_CC2);
}

// cancel channel 3, compare interrupt
void timerCancelAlarm3(void)
{
	TIMER_TIM->DIER &= (uint16_t) ~TIM_IT_CC3;
	TIM_ClearITPendingBit(TIMER_TIM, TIM_IT_CC3);
}

uint8_t timerAlarmActive3(void)
{
	return (TIMER_TIM->DIER & TIM_IT_CC3);
}

// Create a timer - Initialize TIMER2
void timerInit(void)
{
	NVIC_InitTypeDef NVIC_InitStructure;
	TIM_TimeBaseInitTypeDef TIM_TimeBaseStructure;
	TIM_OCInitTypeDef TIM_OCInitStructure;

	// Enable the TIMER_TIM global Interrupt
	NVIC_InitStructure.NVIC_IRQChannel = TIMER_IRQ_CH;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);

	// Time base configuration
	TIM_TimeBaseStructure.TIM_Prescaler = (72 / TIMER_MULT) - 1; // Freq is divided (1+35) times
	TIM_TimeBaseStructure.TIM_Period = 0xFFFF;     // Automatically reload value
	TIM_TimeBaseStructure.TIM_ClockDivision = 0;
	TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
	TIM_TimeBaseInit(TIMER_TIM, &TIM_TimeBaseStructure);

	timerCancelAlarm1();
	timerCancelAlarm2();
	timerCancelAlarm3();

	// Output Compare for alarm
	TIM_OCStructInit(&TIM_OCInitStructure);
	TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_Inactive;
	TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
	TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;

	TIM_OC1Init(TIMER_TIM, &TIM_OCInitStructure);
	TIM_OC1PreloadConfig(TIMER_TIM, TIM_OCPreload_Disable);

	TIM_OC2Init(TIMER_TIM, &TIM_OCInitStructure);
	TIM_OC2PreloadConfig(TIMER_TIM, TIM_OCPreload_Disable);

	TIM_OC3Init(TIMER_TIM, &TIM_OCInitStructure);
	TIM_OC3PreloadConfig(TIMER_TIM, TIM_OCPreload_Disable);

	TIM_ARRPreloadConfig(TIMER_TIM, ENABLE);  // ARR has a buffer

	// go...
	TIM_Cmd(TIMER_TIM, ENABLE);
}

//parameter:
// ticks: the relative time to call the callback function
// callback: the function to be called
// parameter: Parameters to call the function with
// TODO: worry about 32 bit rollover

// used for fet switching schedule after ADC sampling
void timerSetAlarm1(uint32_t ticks, timerCallback_ut *callback, uint32_t parameter)
{
	// do it now
	if (ticks <= TIMER_MULT)
	{ // less than 2 ticks. Call the callback function directly
		// Disable the Interrupt
		TIMER_TIM->DIER &= (uint16_t) ~TIM_IT_CC1;

		callback(parameter);
	}
	// otherwise, schedule it
	else
	{
		timerData.alarm1Callback = callback;
		timerData.alarm1Parameter = parameter;

		TIMER_TIM->CCR1 = TIMER_TIM->CNT + ticks;
		TIMER_TIM->SR = (uint16_t) ~TIM_IT_CC1;

		TIMER_TIM->DIER |= TIM_IT_CC1;
	}
}

// fet.c uses it for the motorStartSeq and then for scheduling fetMissedCommutate() calls
void timerSetAlarm2(uint32_t ticks, timerCallback_t *callback, int parameter)
{
	// do it now
	if (ticks <= TIMER_MULT)
	{		// less than 2 ticks. Call the callback function directly
		// Disable the Interrupt
		TIMER_TIM->DIER &= (uint16_t) ~TIM_IT_CC2;

		callback(parameter);
	}
	// otherwise, schedule it
	else
	{
		timerData.alarm2Callback = callback;
		timerData.alarm2Parameter = parameter;

		TIMER_TIM->CCR2 = TIMER_TIM->CNT + ticks;
		TIMER_TIM->SR = (uint16_t) ~TIM_IT_CC2;
		TIMER_TIM->DIER |= TIM_IT_CC2;
	}
}

// used by ow.c. Mainly used for the 1wire protocol
void timerSetAlarm3(uint32_t ticks, timerCallback_t *callback, int parameter)
{
	// do it now
	if (ticks <= TIMER_MULT)
	{  // less than 2 ticks. Call the callback function directly
		// Disable the Interrupt
		TIMER_TIM->DIER &= (uint16_t) ~TIM_IT_CC3;

		callback(parameter);
	}
	// otherwise, schedule it
	else
	{
		timerData.alarm3Callback = callback;
		timerData.alarm3Parameter = parameter;

		TIMER_TIM->CCR3 = TIMER_TIM->CNT + ticks;
		TIMER_TIM->SR = (uint16_t) ~TIM_IT_CC3;
		TIMER_TIM->DIER |= TIM_IT_CC3;
	}
}

void TIMER_ISR(void)
{
	if (TIM_GetITStatus(TIMER_TIM, TIM_IT_CC1) != RESET)
	{
		TIMER_TIM->SR = (uint16_t) ~TIM_IT_CC1;

		// Disable the Interrupt
		TIMER_TIM->DIER &= (uint16_t) ~TIM_IT_CC1;

		timerData.alarm1Callback(timerData.alarm1Parameter);
	}
	else if (TIM_GetITStatus(TIMER_TIM, TIM_IT_CC2) != RESET)
	{
		TIMER_TIM->SR = (uint16_t) ~TIM_IT_CC2;

		// Disable the Interrupt
		TIMER_TIM->DIER &= (uint16_t) ~TIM_IT_CC2;

		timerData.alarm2Callback(timerData.alarm2Parameter);
	}
	else if (TIM_GetITStatus(TIMER_TIM, TIM_IT_CC3) != RESET)
	{
		TIMER_TIM->SR = (uint16_t) ~TIM_IT_CC3;

		// Disable the Interrupt
		TIMER_TIM->DIER &= (uint16_t) ~TIM_IT_CC3;

		timerData.alarm3Callback(timerData.alarm3Parameter);
	}
}
