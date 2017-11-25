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
    Edited 2016-2017 - A.Genchev
*/

#include "GPIO.h"



// initialize gpio pins(s) according to the parameters.
void GPIO_Init_PP_Output_Low(GPIO_TypeDef* port, const uint16_t pin)
{
	GPIO_InitTypeDef GPIO_InitStructure;
	GPIO_ResetBits(port, pin);
	GPIO_InitStructure.GPIO_Pin = pin;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
	GPIO_Init(port, &GPIO_InitStructure);
}


/**
  * @brief  Toggles the specified GPIO pins..
  * @param  GPIOx: where x can be (A..I) to select the GPIO peripheral.
  * @param  GPIO_Pin: Specifies the pins to be toggled.
  * @retval None
  */
void GPIO_TogglePins(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin)
{
  /* Check the parameters */
  assert_param(IS_GPIO_ALL_PERIPH(GPIOx));
  GPIOx->ODR ^= GPIO_Pin;
}

