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

    Copyright © 2011, 2012  Bill Nesbitt
*/
#include <stdio.h>
#include <stdlib.h>
#include "config.h"
#include "pwm.h"
#include "serial.h"
#include "stm32f10x_dma.h"
#include "misc.h"


serialPort_t serialPort; // our instance of RX buffer & TX buffer

// send the contents of the serial send buffer using the DMA
void serialStartTxDMA()
{
	//was serialPort_t *s = &serialPort;

	SERIAL_TX_DMA_CHANNEL->CMAR = (uint32_t) &serialPort.txBuf[serialPort.txTail]; // was s->txBuf[s->txTail];
	if( serialPort.txHead > serialPort.txTail) 					// was (s->txHead > s->txTail)
	{
		SERIAL_TX_DMA_CHANNEL->CNDTR = serialPort.txHead - serialPort.txTail; //was  s->txHead - s->txTail;
		serialPort.txTail = serialPort.txHead; //was  s->txTail = s->txHead;
	}
	else
	{
		SERIAL_TX_DMA_CHANNEL->CNDTR = SERIAL_TX_BUFSIZE - serialPort.txTail;
		serialPort.txTail = 0; //was s->txTail = 0;
	}

	DMA_Cmd(SERIAL_TX_DMA_CHANNEL, ENABLE);
}

// Write the contents to be sent to the serial send buffer
void serialWrite(int ch)
{
	serialPort_t *s = &serialPort;

	s->txBuf[s->txHead] = ch;
	s->txHead = (s->txHead + 1) % SERIAL_TX_BUFSIZE;

	if (!(SERIAL_TX_DMA_CHANNEL->CCR & 1))
		serialStartTxDMA();
}

// check if data available
unsigned char serialAvailable()
{
	return (SERIAL_RX_DMA_CHANNEL->CNDTR != serialPort.rxPos);
}

// only call after a affirmative return from serialAvailable()
int serialRead()
{
	serialPort_t *s = &serialPort;
	int ch;

	ch = s->rxBuf[SERIAL_RX_BUFSIZE - s->rxPos];
	if (--s->rxPos == 0)
		s->rxPos = SERIAL_RX_BUFSIZE;

	return ch;
}

void serialPrint(const char *str)
{
	while (*str)
		serialWrite(*(str++));
}

void serialOpenPort(int baud)
{
	USART_InitTypeDef USART_InitStructure;

	USART_InitStructure.USART_BaudRate = baud;
	USART_InitStructure.USART_WordLength = USART_WordLength_8b;
	USART_InitStructure.USART_StopBits = USART_StopBits_1;
	USART_InitStructure.USART_Parity = USART_Parity_No;
	USART_InitStructure.USART_HardwareFlowControl = SERIAL_FLOW_CONTROL;
	USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
	USART_Init(SERIAL_UART, &USART_InitStructure);
}


// enable or disable io to this device:
void serial_GPIO_Control(void)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	uint8_t  _enable_port;

#ifndef ENABLE_PWM_PROTOCOL
#ifdef  USE_PWM_PIN_AS_USART_DEVICE_SELECT  		  // used to enable TX output push/pull
	if( (PWM_PORT->IDR & PWM_PIN ) != (uint32_t)Bit_RESET) _enable_port = 1;
	else _enable_port = 0;
#endif // USE_PWM_PIN_AS_USART_DEVICE_SELECT
#else
	_enable_port = 1;
#endif  // ENABLE_PWM_PROTOCOL
	GPIO_InitStructure.GPIO_Pin = SERIAL_UART_TX_PIN;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	if (_enable_port)
		{ // enable:
			GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;	// Alternative Push-Pull - we're selected
			GPIO_Init(SERIAL_UART_PORT, &GPIO_InitStructure);
			// RX pin: input floating w/ pull ups
			GPIO_InitStructure.GPIO_Pin = SERIAL_UART_RX_PIN;
			GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;    // PullUp = ON
			GPIO_Init(SERIAL_UART_PORT, &GPIO_InitStructure);
		}
		else
		{// disable:
			GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;	// Push-Pull - we're selected
			GPIO_Init(SERIAL_UART_PORT, &GPIO_InitStructure);
			// RX pin: analog input floating
			GPIO_InitStructure.GPIO_Pin = SERIAL_UART_RX_PIN;
			GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AIN;    // analog
			GPIO_Init(SERIAL_UART_PORT, &GPIO_InitStructure);
		}

}

//The Steps to configure the EXTI peripheral are
//    1) Configure a GPIO pin as input
//    2) Specify it will operate in interrupt mode
//    3) Select the port to source the interrupt
//    4) Enable the EXTI module
//    5) Select the event that will trigger the EXTI modeul (i.e. rising edge, falling edge or both)

/**
  * @brief  Configures EXTI Line8 (connected to PA8 pin) in interrupt mode
  * @param  None
  * @retval None
  */
void EXTILine8_PA8_Config(void)
{

  GPIO_InitTypeDef   GPIO_InitStructure;
  NVIC_InitTypeDef   NVIC_InitStructure;
  EXTI_InitTypeDef   EXTI_InitStructure;

  GPIO_InitStructure.GPIO_Pin = PWM_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU; // input, pullup to be "selected" when nothing connected
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_Init(PWM_PORT, &GPIO_InitStructure);

  // enable clocking AFIO block - need to set alt function to PA8 btn pin
  // Done: RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);

  // connect PA8 pin to EXTI Line (datasheet says PA8, PB8, PC8 connected to EXTI_Line8)
  // depend on AFIO block
  GPIO_EXTILineConfig(GPIO_PortSourceGPIOA, GPIO_PinSource8);

  // Configure EXTI Line:
  EXTI_InitStructure.EXTI_Line = EXTI_Line8; // Connected to PA8, PB8, PC8, PD8...
  EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
  EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising_Falling; // on both edges
  EXTI_InitStructure.EXTI_LineCmd = ENABLE; // enables the line
  EXTI_Init(&EXTI_InitStructure);

  // Enable EXTI Line8 IRQ @ NVIC and the priority:
  NVIC_InitStructure.NVIC_IRQChannel =  EXTI9_5_IRQn; // because lines 5 to 9 - are in one block
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 4; // medium-high
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0; //in my_init, I left 0 bits for sub-priorities
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
  //
}

// all interrupts for lines 5 to 9 will be handle here
void EXTI9_5_IRQHandler(void)
{
	if (EXTI_GetITStatus(EXTI_Line8) != RESET)
	{ // handle only line8 events
		EXTI->PR = EXTI_Line8;// EXTI_ClearITPendingBit(EXTI_Line8); // exit from interrupt
		serial_GPIO_Control(); // read PA8 pin
	}
// here may be functions for other interrups from lines 5 to 9

//	NVIC_ClearPendingIRQ(EXTI9_5_IRQn) очищает бит общей линии прерывания (он к тому же очищается автоматом при входе)
//  а сброс в EXTI->PR очищает конкретную линию порта.
}

void serialInit(void)
{
	DMA_InitTypeDef DMA_InitStructure;
	NVIC_InitTypeDef NVIC_InitStructure;
	serialPort_t *s = &serialPort;

#ifndef ENABLE_PWM_PROTOCOL
#ifdef  USE_PWM_PIN_AS_USART_DEVICE_SELECT  		  // used to enable TX output push/pull
	EXTILine8_PA8_Config();
#endif // USE_PWM_PIN_AS_USART_DEVICE_SELECT
#endif  // ENABLE_PWM_PROTOCOL

	serial_GPIO_Control();

	// Enable the DMA1_Channel4 global Interrupt
	NVIC_InitStructure.NVIC_IRQChannel = DMA1_Channel4_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 2;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);

	// reset serial send and receive pointers:
	s->rxHead = s->rxTail = 0;
	s->txHead = s->txTail = 0;

	serialOpenPort(parameters_asUint32[uBAUD_RATE]);

	// Configure DMA for rx
	DMA_DeInit(SERIAL_RX_DMA_CHANNEL);
	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
	DMA_InitStructure.DMA_Priority = DMA_Priority_Medium;
	DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;

	DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t) &SERIAL_UART->DR; // Data register. was: SERIAL_UART + 0x04;
	DMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t) s->rxBuf;
	DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralSRC;
	//DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
	//DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
	//DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
	//DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
	DMA_InitStructure.DMA_BufferSize = SERIAL_RX_BUFSIZE;
	DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
	DMA_Init(SERIAL_RX_DMA_CHANNEL, &DMA_InitStructure);

	DMA_Cmd(SERIAL_RX_DMA_CHANNEL, ENABLE);					// Enable DMA1_Channel5

	USART_DMACmd(SERIAL_UART, USART_DMAReq_Rx, ENABLE); // Enable USART DMA interface for RX
	s->rxPos = DMA_GetCurrDataCounter(SERIAL_RX_DMA_CHANNEL);   // We poll SERIAL_RX_DMA->CNDTR to check whether new data has been received

	// Configure DMA for tx
	DMA_DeInit(SERIAL_TX_DMA_CHANNEL);
	DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t) &SERIAL_UART->DR; // Data register. was:
	DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;
	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_Byte;
	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
	DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
	DMA_Init(SERIAL_TX_DMA_CHANNEL, &DMA_InitStructure);
	DMA_ITConfig(SERIAL_TX_DMA_CHANNEL, DMA_IT_TC, ENABLE);
	SERIAL_TX_DMA_CHANNEL->CNDTR = 0;

	USART_DMACmd(SERIAL_UART, USART_DMAReq_Tx, ENABLE);

	USART_Cmd(SERIAL_UART, ENABLE);
}

// USART tx DMA IRQ
void DMA1_Channel4_IRQHandler(void)
{
	DMA_ClearITPendingBit(DMA1_IT_TC4);
	DMA_Cmd(SERIAL_TX_DMA_CHANNEL, DISABLE);

	if (serialPort.txHead != serialPort.txTail) // have more data ?
		serialStartTxDMA();
}

// set serial port baud rate. Do a boundary check:
void serialCheckAndSetConstants(void)
{
	//parameters_asUint32[BAUD_RATE] = parameters_asUint32[BAUD_RATE];
	if (parameters_asUint32[uBAUD_RATE] < SERIAL_MIN_BAUD)		parameters_asUint32[uBAUD_RATE] = SERIAL_MIN_BAUD;
	else if (parameters_asUint32[uBAUD_RATE] > SERIAL_MAX_BAUD)	parameters_asUint32[uBAUD_RATE] = SERIAL_MAX_BAUD;
	serialOpenPort(parameters_asUint32[uBAUD_RATE]);
}
