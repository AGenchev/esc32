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

    Copyright � 2011-2014  Bill Nesbitt
*/

#include <string.h>
#include <strings.h>
#include <math.h>
#include "config.h"
#include "fet.h"
#include "pwm.h"
#include "run.h"
#include "serial.h"
#include "can.h"
#include "stm32f10x_flash.h"
#include "stm32f10x_rcc.h"

#include "adc.h"

float parameters_asFloat32[CONFIG_NUM_PARAMS];
uint32_t * parameters_asUint32 = (uint32_t *) &parameters_asFloat32; // Uint alias
int32_t *  parameters_asSint32 = (int32_t * ) &parameters_asFloat32; // int alias

const char *configParameterStrings[] = {
    "CONFIG_VERSION",
    "STARTUP_MODE",           //
    "BAUD_RATE",              // Serial baud rate
    "PTERM",
    "ITERM",
    "FF1TERM",
    "FF2TERM",
    "CL1TERM",
    "CL2TERM",
    "CL3TERM",
    "CL4TERM",
    "CL5TERM",
    "SHUNT_RESISTANCE",
    "MIN_PERIOD",
    "MAX_PERIOD",
    "BLANKING_MICROS",
    "ADVANCE",
    "START_VOLTAGE",
    "GOOD_DETECTS_START",
    "BAD_DETECTS_DISARM",
    "MAX_CURRENT",
    "SWITCH_FREQ",
    "MOTOR_POLES",
    "PWM_MIN_PERIOD",
    "PWM_MAX_PERIOD",
    "PWM_MIN_VALUE",
    "PWM_LO_VALUE",
    "PWM_HI_VALUE",
    "PWM_MAX_VALUE",
    "PWM_MIN_START",
    "PWM_RPM_SCALE",
    "FET_BRAKING",            // Allow FET brake mode
    "PNFAC",
    "INFAC",
    "THR1TERM",
    "THR2TERM",
    "START_ALIGN_TIME",
    "START_ALIGN_VOLTAGE",
    "START_STEPS_NUM",
    "START_STEPS_PERIOD",
    "START_STEPS_ACCEL",
    "PWM_LOWPASS",
    "RPM_MEAS_LP",
    "SERVO_DUTY",
    "SERVO_P",                // Servo mode PID P parameters
    "SERVO_D",                // Servo mode PID D parameter
    "SERVO_MAX_RATE",
    "SERVO_SCALE",
    "ESC_ID",
    "DIRECTION"
};

const char *configFormatStrings[] = {
    "%f",	    // CONFIG_VERSION
    "%u",	    // STARTUP_MODE
    "%u",    	// BAUD_RATE
    "%.3f",	    // PTERM
    "%.5f",	    // ITERM
    "%f",	    // FF1TERM
    "%f",	    // FF2TERM
    "%f",	    // CL1TERM
    "%f",	    // CL2TERM
    "%f",	    // CL3TERM
    "%f",	    // CL4TERM
    "%f",	    // CL5TERM
    "%u mohms",   // SHUNT_RESISTANCE
    "%.0f us",	    // MIN_PERIOD
    "%.0f us",	    // MAX_PERIOD
    "%.0f us",	    // BLANKING_MICROS
    "%.2f Degs",    // ADVANCE
    "%.2f Volts",   // START_VOLTAGE
    "%.0f",	    // GOOD_DETECTS_START
    "%.0f",	    // BAD_DETECTS_DISARM
    "%.1f Amps",    // MAX_CURRENT
    "%.1f KHz",	    // SWITCH_FREQ
    "%u",	    // MOTOR_POLES
    "%u us",	    // PWM_MIN_PERIOD
    "%u us",	    // PWM_MAX_PERIOD
    "%u us",	    // PWM_MIN_VALUE
    "%u us",	    // PWM_LO_VALUE
    "%u us",	    // PWM_HI_VALUE
    "%u us",	    // PWM_MAX_VALUE
    "%u us",	    // PWM_MIN_START
    "%u RPM",	    // PWM_RPM_SCALE
    "%u",	    // FET_BRAKING
    "%.2f",	    // PNFAC
    "%.2f",	    // INFAC
    "%f",	    // THR1TERM
    "%f",	    // THR2TERM
    "%.0f ms",	    // START_ALIGN_TIME
    "%.2f Volts",   // START_ALIGN_VOLTAGE
    "%u",	    // START_STEPS_NUM
    "%u us",	    // START_STEPS_PERIOD
    "%u us",	    // START_STEPS_ACCEL
    "%2.2f",	    // PWM_LOWPASS
    "%.3f",	    // RPM_MEAS_LP
    "%.1f %%",	    // SERVO_DUTY
    "%.3f",	    // SERVO_P
    "%.3f",	    // SERVO_D
    "%.1f deg/s",   // SERVO_MAX_RATE
    "%.1f deg",	    // SERVO_SCALE
    "%u",	    // ESC_ID
    "%d"	    // DIRECTION
};

const char configFormatTypes[CONFIG_NUM_PARAMS] =
{ 		'f',	    // CONFIG_VERSION
	    'u',	    // STARTUP_MODE
	    'u',    	// BAUD_RATE	-- converted everywhere to UINT. Works.
	    'f',	    // PTERM
	    'f',	    // ITERM
	    'f',	    // FF1TERM
	    'f',	    // FF2TERM
	    'f',	    // CL1TERM
	    'f',	    // CL2TERM
	    'f',	    // CL3TERM
	    'f',	    // CL4TERM
	    'f',	    // CL5TERM
	    'u',   		// SHUNT_RESISTANCE, mili Ω
	    'f',	    // MIN_PERIOD	Should be 'u', but ...
	    'f',	    // MAX_PERIOD	Should be 'u', but ...
	    'f',	    // BLANKING_MICROS. Should be 'u', but ...
	    'f',    	// ADVANCE 0.1 .. 30.0
	    'f',   		// START_VOLTAGE
	    'f',	    // GOOD_DETECTS_START - should be UINT
	    'f',	    // BAD_DETECTS_DISARM - should be UINT
	    'f',    	// MAX_CURRENT		  - should be UINT
	    'f',	    // SWITCH_FREQ		  - should be UINT
	    'u',	    // MOTOR_POLES
	    'u',	    // PWM_MIN_PERIOD
	    'u',	    // PWM_MAX_PERIOD
	    'u',	    // PWM_MIN_VALUE
	    'u',	    // PWM_LO_VALUE
	    'u',	    // PWM_HI_VALUE
	    'u',	    // PWM_MAX_VALUE
	    'u',	    // PWM_MIN_START
	    'u',	    // PWM_RPM_SCALE
	    'u',	    // FET_BRAKING
	    'f',	    // PNFAC
	    'f',	    // INFAC
	    'f',	    // THR1TERM
	    'f',	    // THR2TERM
	    'u',	    // START_ALIGN_TIME -- converted everywhere.
	    'f',   		// START_ALIGN_VOLTAGE, V
	    'u',	    // START_STEPS_NUM  -- converted everywhere.
	    'u',	    // START_STEPS_PERIOD
	    'u',	    // START_STEPS_ACCEL
	    'f',	    // PWM_LOWPASS
	    'f',	    // RPM_MEAS_LP
	    'f',	    // SERVO_DUTY, precent, TODO: promiles integer
	    'f',	    // SERVO_P
	    'f',	    // SERVO_D
	    'f',   		// SERVO_MAX_RATE
	    'f',	    // SERVO_SCALE
	    'u',	    // ESC_ID
	    'i'	    	// DIRECTION
};



void configInit(void)
{
	float ver;

	configLoadDefault();

	ver = *(float *) FLASH_WRITE_ADDR; // Read the config version number from this address

	if (isnan(ver)) // Check ver data: if ver is NAN, (value is 0xffffffff), then it is invalid -> write valid data to the flash
		configWriteFlash();
	else if (ver >= parameters_asFloat32[CONFIG_VERSION])
		configReadFlash();
	else if (parameters_asFloat32[CONFIG_VERSION] > ver)
		configWriteFlash();
}

// recalculate constants with bounds checking
void configRecalcConst(void)
{
	adcSetConstants();
	fetSetConstants();
	runCheckAndSetConstants();
#ifdef ENABLE_PWM_PROTOCOL
	pwmSetConstants();
#endif
	serialCheckAndSetConstants();
#ifdef ENABLE_CANBUS_PROTOCOL
	canSetConstants();
#endif //ENABLE_CANBUS_PROTOCOL
}

// Set the parameter value based on the passed array index:
int configSetParamByID(unsigned int i, float value)
{
	if(i < CONFIG_NUM_PARAMS)
	{
		switch(configFormatTypes[i])
			{
			case 'i':
				parameters_asSint32[i] = value;
				break;
			case 'u':
				parameters_asUint32[i] = value;
				break;
			default:
				parameters_asFloat32[i] = value;
			}
		configRecalcConst();

		return 1;
	}

	return 0;
}
// Set the parameter value according to the string parm name:
int configSetParam(char *param, float value)
{
	int ret = 0;
	uint32_t i;

	for (i = 0; i < CONFIG_NUM_PARAMS; i++)
	{
		if (!strncasecmp(configParameterStrings[i], param,	strlen(configParameterStrings[i])))
		{
			configSetParamByID(i, value);
			ret = 1;
			break;
		}
	}

	return ret;
}


// returns the param index by the param name:
int configGetId(char *param)
{
	int i;

	for (i = 0; i < CONFIG_NUM_PARAMS; i++)
		if (!strncasecmp(configParameterStrings[i], param, 16))
			return i;

	return -1;
}

// TODO: This function is not called - comment out
/*
 float configGetParam(char *param)
 {
 int i;
 i = configGetId(param);
 if (i >= 0)
 return p[i];
 else
 return __float32_nan;
 }*/

void configLoadDefault(void)
{
	parameters_asFloat32[CONFIG_VERSION] = DEFAULT_CONFIG_VERSION;
	parameters_asUint32[STARTUP_MODE] = DEFAULT_STARTUP_MODE;
	parameters_asUint32[BAUD_RATE] = DEFAULT_BAUD_RATE;
	parameters_asFloat32[PTERM] = DEFAULT_PTERM;
	parameters_asFloat32[ITERM] = DEFAULT_ITERM;
	parameters_asFloat32[FF1TERM] = DEFAULT_FF1TERM;
	parameters_asFloat32[FF2TERM] = DEFAULT_FF2TERM;
	parameters_asFloat32[CL1TERM] = DEFAULT_CL1TERM;
	parameters_asFloat32[CL2TERM] = DEFAULT_CL2TERM;
	parameters_asFloat32[CL3TERM] = DEFAULT_CL3TERM;
	parameters_asFloat32[CL4TERM] = DEFAULT_CL4TERM;
	parameters_asFloat32[CL5TERM] = DEFAULT_CL5TERM;
	parameters_asUint32[SHUNT_RESISTANCE_MILIOHM] = DEFAULT_SHUNT_RESISTANCE_mOhm;
	parameters_asFloat32[MIN_PERIOD] = DEFAULT_MIN_PERIOD;
	parameters_asFloat32[MAX_PERIOD] = DEFAULT_MAX_PERIOD;
	parameters_asFloat32[BLANKING_MICROS] = DEFAULT_BLANKING_MICROS;
	parameters_asFloat32[ADVANCE] = DEFAULT_ADVANCE;	// leave this floating point. It's not included in real-time calculations
	parameters_asFloat32[START_VOLTAGE] = DEFAULT_START_VOLTAGE;
	parameters_asFloat32[GOOD_DETECTS_START] = DEFAULT_GOOD_DETECTS_START;
	parameters_asFloat32[BAD_DETECTS_DISARM] = DEFAULT_BAD_DETECTS_DISARM;
	parameters_asFloat32[MAX_CURRENT] = DEFAULT_MAX_CURRENT;
	parameters_asFloat32[SWITCH_FREQ] = DEFAULT_SWITCH_FREQ;
	parameters_asUint32[MOTOR_POLES] = DEFAULT_MOTOR_POLES;
	parameters_asUint32[PWM_MIN_PERIOD] = DEFAULT_PWM_MIN_PERIOD; // PWM timer1 ch1 minimum cycle
	parameters_asUint32[PWM_MAX_PERIOD] = DEFAULT_PWM_MAX_PERIOD; // PWM timer1 ch1 maximum cycle
	parameters_asUint32[PWM_MIN_VALUE] = DEFAULT_PWM_MIN_VALUE;   // PWM timer1 ch2 minimum cycle
	parameters_asUint32[PWM_LO_VALUE] = DEFAULT_PWM_LO_VALUE;
	parameters_asUint32[PWM_HI_VALUE] = DEFAULT_PWM_HI_VALUE;
	parameters_asUint32[PWM_MAX_VALUE] = DEFAULT_PWM_MAX_VALUE;   // PWM timer1 ch2 maximum cycle
	parameters_asUint32[PWM_MIN_START] = DEFAULT_PWM_MIN_START;
	parameters_asUint32[PWM_RPM_SCALE] = DEFAULT_PWM_RPM_SCALE;  // PWM <--> RPM proportion
	parameters_asUint32[FET_BRAKING] = DEFAULT_FET_BRAKING; // 1 == ON - Enables the brake mode, == 0 does not allow braking
	parameters_asFloat32[PNFAC] = DEFAULT_PNFAC;
	parameters_asFloat32[INFAC] = DEFAULT_INFAC;
	parameters_asFloat32[THR1TERM] = DEFAULT_THR1TERM;
	parameters_asFloat32[THR2TERM] = DEFAULT_THR2TERM;
	parameters_asUint32[START_ALIGN_TIME] = DEFAULT_START_ALIGN_TIME; // -- converted everywhere to Uint. Works.
	parameters_asFloat32[START_ALIGN_VOLTAGE] = DEFAULT_START_ALIGN_VOLTAGE;
	parameters_asUint32[START_STEPS_NUM] = DEFAULT_START_STEPS_NUM;   // -- converted everywhere to Uint. Works.
	parameters_asUint32[START_STEPS_PERIOD] = DEFAULT_START_STEPS_PERIOD;
	parameters_asUint32[START_STEPS_ACCEL] = DEFAULT_START_STEPS_ACCEL;
	parameters_asFloat32[PWM_LOWPASS] = DEFAULT_PWM_LOWPASS;
	parameters_asFloat32[RPM_MEAS_LP] = DEFAULT_RPM_MEAS_LP;
	parameters_asFloat32[SERVO_DUTY] = DEFAULT_SERVO_DUTY;
	parameters_asFloat32[SERVO_P] = DEFAULT_SERVO_P;        // Servo mode PID  P parameter. TODO: convert to UINT, scale float w 0x1000
	parameters_asFloat32[SERVO_D] = DEFAULT_SERVO_D;        // Servo mode PID  D parameter  TODO: convert to UINT, scale float w 0x1000
	parameters_asFloat32[SERVO_MAX_RATE] = DEFAULT_SERVO_MAX_RATE;
	parameters_asFloat32[SERVO_SCALE] = DEFAULT_SERVO_SCALE;
	parameters_asUint32[ESC_ID] = DEFAULT_ESC_ID;					// -- converted everywhere to UINT. Works.
	parameters_asSint32[DIRECTION] = DEFAULT_DIRECTION;				// -- converted everywhere to INT. Works.

	configRecalcConst();
}

// Write the configuration file to flash
int configWriteFlash(void)
{
	uint16_t prevReloadVal;
	FLASH_Status FLASHStatus;
	uint32_t address;
	int ret = 0;

	prevReloadVal = runIWDGInit(999);

	// Startup HSI clock
	RCC_HSICmd(ENABLE);
	while (RCC_GetFlagStatus(RCC_FLAG_HSIRDY) != SET)
		runFeedIWDG();

	FLASH_Unlock();

	FLASH_ClearFlag(FLASH_FLAG_EOP | FLASH_FLAG_PGERR | FLASH_FLAG_WRPRTERR);

	if ((FLASHStatus = FLASH_ErasePage(FLASH_WRITE_ADDR)) == FLASH_COMPLETE)
	{
		address = 0;
		while (FLASHStatus == FLASH_COMPLETE && address < sizeof(parameters_asFloat32))
		{
			if ((FLASHStatus = FLASH_ProgramWord(FLASH_WRITE_ADDR + address,
					*(uint32_t *) ((char *) parameters_asFloat32 + address)))
					!= FLASH_COMPLETE)
				break;

			address += 4;
		}

		ret = 1;
	}

	FLASH_Lock();

	runFeedIWDG();

	// Shutdown HSI clock
	RCC_HSICmd(DISABLE);
	while (RCC_GetFlagStatus(RCC_FLAG_HSIRDY) == SET)
	{;}

	runIWDGInit(prevReloadVal);

	return ret;
}

void configReadFlash(void)
{
	memcpy(parameters_asFloat32, (char *) FLASH_WRITE_ADDR, sizeof(parameters_asFloat32));
	configRecalcConst();
}
