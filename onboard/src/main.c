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
#include "rcc.h"
#include "config.h"
#include "timer.h"
#include "fet.h"
#include "serial.h"
#include "pwm.h"
#include "run.h"
#include "cli.h"
#include "binary.h"
#ifdef ENABLE_ONEWIRE // define this in config.h
#include "ow.h"
#endif //ENABLE_ONEWIRE
#include "can.h"
#include "GPIO.h"

// these are accessed both in main() and IRQ handler SysTick_Handler:
volatile uint32_t minCycles, idleCounter, totalCycles; // The total number of cycles is used to calculate the percentage of free time (that is, without interruption, nops in the loop)
volatile escStates_t ESC_state;
volatile uint8_t inputMode; // Run status, input mode (control mode serial port iic can pwm 1wire)


int main(void)
{
	rccInit();   // Turn on some of the CPU clocks by default
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_4); // 4 bits for preemp priority 0 bit for sub priority
	//
	GPIO_Init_PP_Output_Low(GPIO_STATUS_LED_PORT, GPIO_STATUS_LED_PIN); //statusLed = digitalInit(GPIO_STATUS_LED_PORT, GPIO_STATUS_LED_PIN);
	GPIO_Init_PP_Output_Low(GPIO_ERROR_LED_PORT, GPIO_ERROR_LED_PIN); //errorLed = digitalInit(GPIO_ERROR_LED_PORT, GPIO_ERROR_LED_PIN);
#ifdef ESC_DEBUG
	GPIO_Init_PP_Output_Low(GPIO_TP_PORT, GPIO_TP_PIN);
	// digitalLo(tp); - done by digitalInit()
#endif

	timerInit();  // Timer2 internal counter
	configInit();  // load the default configuration
	adcInit();
	fetInit();
	serialInit();
#ifdef 	ENABLE_CANBUS_PROTOCOL // see config.h for these defines
	canInit();    // CAN bus (since version 1.5)
#endif	//ENABLE_CANBUS_PROTOCOL
	runInit();
	cliInit();
#ifdef ENABLE_ONEWIRE
	owInit();     // initialize the 1-wire protocol
#endif
	runDisarm(REASON_STARTUP);  // initial state - disarmed
	inputMode = ESC_INPUT_PWM;  // default mode - to be compatible w other ESCs

	fetSetDutyCycle(0);
	fetBeep(200, 100);
	fetBeep(300, 100);
	fetBeep(400, 100);
	fetBeep(500, 100);
	fetBeep(400, 100);
	fetBeep(300, 100);
	fetBeep(200, 100);

#ifdef ENABLE_PWM_PROTOCOL
	pwmInit();
#endif  // ENABLE_PWM_PROTOCOL

	// could be done w: GPIOx->BSRR = GPIO_Pin;
	GPIO_SetBits(GPIO_STATUS_LED_PORT, GPIO_STATUS_LED_PIN); //digitalHi(statusLed);
	GPIO_SetBits(GPIO_ERROR_LED_PORT, GPIO_ERROR_LED_PIN); //digitalHi(errorLed);

	// self calibrating idle timer loop
	{
		uint32_t lastRunCount=0;
		uint32_t thisCycles, lastCycles=0;
		volatile uint32_t cycles;
		// Core Debug registers: see http://embeddedb.blogspot.bg/2013/10/how-to-count-cycles-on-arm-cortex-m.html
		// if CPU has DWT  (Data Watchpoint and Trace) unit, you can use its register to count the number of cycles in which some code is executed
		volatile uint32_t *DWT_CYCCNT = (uint32_t *) 0xE0001004; // the stm32 provides the DWT_CYCCNT register, which counts clock ticks. It is located at address 0xE0001004
		volatile uint32_t *DWT_CONTROL = (uint32_t *) 0xE0001000;
		volatile uint32_t *SCB_DEMCR = (uint32_t *) 0xE000EDFC;

		*SCB_DEMCR = *SCB_DEMCR | 0x01000000;// enable the use of DWT
		*DWT_CONTROL = *DWT_CONTROL | 1;	 // enable the counter

		minCycles = 0xffff; // 65535
		while (1)
		{
			idleCounter++;  // We calculate the CPU time left ?

			if (runCount != lastRunCount && !(runCount % (RUN_FREQ / 1000)))
			{
				if (commandMode == CLI_MODE)
					cliCheck();        // check for cli command
				else
					binaryCheck();     // check for binary command
				lastRunCount = runCount;
			}

			thisCycles = *DWT_CYCCNT;
			cycles = thisCycles - lastCycles;
			lastCycles = thisCycles;

			// record shortest number of instructions for loop
			totalCycles += cycles;
			if (cycles < minCycles) minCycles = cycles;
		}
	}
}

#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  while (1)
  {
    NOP;
  }
}
#endif

void HardFault_Handler(void)
{
    FET_PANIC;
    while (1){;}
}

void MemManage_Handler(void)
{
    FET_PANIC;
    while (1){;}
}

void BusFault_Handler(void)
{
    FET_PANIC;
    while (1){;}
}

void UsageFault_Handler(void)
{
    FET_PANIC;
    while (1){;}
}

void reset_wait(void)
{
    FET_PANIC;
    while (1){;}
}


