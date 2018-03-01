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

#ifndef _CONFIG_H
#define _CONFIG_H

#include "stdint.h"

// see http://autoquad.org/wiki/wiki/aq-esc32/esc32/esc32-configuration-and-modes/
#define DEFAULT_CONFIG_VERSION		2.03f	// This config format is *incompatible* with the original esc32 firmware
#define DEFAULT_STARTUP_MODE		0       // This is the run mode that the ESC defaults to when first powered on. 0 == normal open loop operation, 1 == closed loop RPM mode, 2 == closed loop thrust mode (not yet implemented)
#define DEFAULT_BAUD_RATE		230400  	// Allowable range 9600 to 921600
#define DEFAULT_ESC_ID			0			// if nothing else is written into the configuration page. Can be retrieved by index.

#define DEFAULT_rpmPID_P_TERM	2048       // was 0.25f in FP version. The P term for the RPM PI controller. You may want it ==4096
#define DEFAULT_PNFAC			10.0f		// ???
#define DEFAULT_rpmPID_I_TERM	10			// 0.0006f     // The I term for the RPM PI controller
#define DEFAULT_INFAC			0.15f		// ???
// Integer PI controller parameters


// how to calibrate: http://autoquad.org/wiki/wiki/aq-esc32/esc32/esc32-calibrations/
// NOTE: this calibration does NOT work anymore !! Code is changed.
// don't seek support for non-original ESC32 instances !!!
#define DEFAULT_FF1TERM			1.667189e-07 //+4.848572e-08     // Feed forward terms used for the RPM controller.  Closed loop RPM mode will not function until FF1 & FF2 terms have been set.
#define DEFAULT_FF2TERM			-3.752384e-04 //+1.144477e-03     // These values should be evaluated/calculated using the esc32Cal program with the –r2v option

// Battery current limiting:
#define DEFAULT_CL1TERM			+3.183795e+00     // CL1TERM through CL5TERM are used by the virtual current limiter which will not function until they are set.
#define DEFAULT_CL2TERM			+8.285745e-04     // If CL1TERM through CL5TERM is not set, a PI controller will be used for current limiting instead.
#define DEFAULT_CL3TERM			+1.429679e+01     // CL1TERM through CL5TERM can be calculated using the esc32Cal program with the –cl option.
#define DEFAULT_CL4TERM			+2.150966e-04     // see http://autoquad.org/wiki/wiki/aq-esc32/esc32/esc32-calibrations/
#define DEFAULT_CL5TERM			-1.420920e+01


#define DEFAULT_THR1TERM		0.0f
#define DEFAULT_THR2TERM		1.0f

#define DEFAULT_SHUNT_RESISTANCE_mOhm 20	   // in mili Ohms. The amplifier had default fixed gain of 50.9
#define DEFAULT_SHUNT_RESISTANCE_Ohm_x0x10000 1311 // (DEFAULT_SHUNT_RESISTANCE_mOhm * 65536)/1000 // scaled value. 1311 for Rshunt = 0.02 Ohm
												// DEFAULT_SHUNT_RESISTANCE_Ohm * 65536 = 1310.72 ~ 1311
												// to solve for miliohm, we have (DEFAULT_SHUNT_RESISTANCE_mOhm * 65536)/1000


#define DEFAULT_MIN_PERIOD			50.0f	    // The minimum commutation period allowed in microseconds
#define DEFAULT_MAX_PERIOD			12000.0f  	// The maximum commutation period allowed in microseconds
#define DEFAULT_BLANKING_MICROS			30.0f	// The number of microseconds to ignore back EMF after a commutation.
#define DEFAULT_ADVANCE				10.0f	    // The amount of timing advance in electrical degrees.  There are 60 electrical degrees in a commutation cycle.  This value can be set from 0 to 30 degrees.
#define DEFAULT_START_VOLTAGE			1.1f	// The amount of voltage presented to the motor during startup. Allowable range is 0.1v to 3.0v
#define DEFAULT_START_ALIGN_TIME		600	    // ms to align rotor in known position
#define DEFAULT_START_ALIGN_VOLTAGE		0.9f    // max voltage during align (around 0.8 * START_VOLTAGE)
#define DEFAULT_START_STEPS_NUM			0	    // steps without commutation
#define DEFAULT_START_STEPS_PERIOD	16000	    // time in us between steps
#define DEFAULT_START_STEPS_ACCEL		0	    // us each following step will be shorter (acceleration)
#define DEFAULT_N_GOOD_DETECTS_START	75		// 	Once started, the number of good/in order zero crossings needed to be detected before the motor is considered to be in the running state.
#define DEFAULT_N_BAD_DETECTS_DISARM	48		// The number of missed zero crossing detects allowed before the ESC considers the motor not to be running at which point will go into the disarmed state.
#define DEFAULT_MAX_CURRENT		0	    	// was 20.0. When set, the throttle limiter runs. The maximum amount of current in amps that the ESC will allow.
#define DEFAULT_FET_PWM_SWITCH_FREQ_KHZ	20	    // The output PWM pulse frequency used to power the motor windings in KHz.  Valid range is from 4KHz to 64KHz.
#define DEFAULT_MOTOR_POLES			 14     // The number of magnetic poles used in the motor’s construction.  This value only needs to be set correctly if you want to use the RPM closed loop mode.

#define DEFAULT_PWM_INTF_MIN_PERIOD		2200	// PWM interface: The minimum period in microseconds that the ESC will consider an input PWM waveform to be valid.  Default value represents approx 450Hz.  For MultiWii and ArduCopter APM need to be 2000
#define DEFAULT_PWM_INTF_MAX_PERIOD		25000	// PWM interface: The maximum period in microseconds that the ESC will consider an input PWM waveform to be valid.  Default value represents approx 40Hz

#define DEFAULT_PWM_INTF_MIN_VALUE		750	    // PWM interface: The minimum input PWM pulse length in microseconds which the ESC will consider to be valid. For DJI Naza this value has to be 900!
#define DEFAULT_PWM_INTF_LO_VALUE		1000	  // PWM interface: The input PWM pulse length in microseconds for the lowest throttle setting. For ArduCopter APM (or Open Pilot Revo w/ APM fw) this value needs to be changed to 1035!
#define DEFAULT_PWM_INTF_HI_VALUE		1950	  // PWM interface: The input PWM pulse length in microseconds for the highest throttle setting.
#define DEFAULT_PWM_INTF_MAX_VALUE		2250	  // PWM interface: The maximum input PWM pulse length in microseconds which the ESC will consider to be valid.
#define DEFAULT_PWM_INTF_MIN_START		1100	  // PWM interface: The input PWM pulse length in microseconds at which the motor will be started.  Once running, the throttle can be brought as low as PWM_MIN_VALUE as long as the motor does not stall.

#define DEFAULT_PWM_INTF_LOWPASS		0.0f	    // PWM interface: lowpass on PWM input values (0 = none, 10 = heavy, no upper limit)
#define DEFAULT_RPM_INTF_MEAS_LP		0.5f	    // PWM interface: lowpass measured RPM values for closed loop control (0 = none, 0.99 = max, >=1 not allowed)

#define DEFAULT_PWM_INTF_RPM_SCALE		6500	  // PWM interface: The scale of the input PWM pulse length.  In closed loop RPM run mode, PWM_LO_VALUE will indicate 0 RPM and PWM_HI_VALUE will indicate this RPM. Closed loop modes only! RPM equivalent of maximum PWM IN in CLOSED_LOOP mode

#define DEFAULT_FET_BRAKING			0         // Turns on regenerative braking in closed loop modes (experimental),  0 == off, 1 == on. Closed Loop modes only!!

#define DEFAULT_SERVO_DUTY			16.0f	  // % TODO: convert to promiles (percent * 10)
#define DEFAULT_SERVO_P				0.05f	  // TODO: convert to fixed point x1024..x32768 PID can withstand some precision loss
#define DEFAULT_SERVO_D				0.0f
#define DEFAULT_SERVO_MAX_RATE		1000.0f	  // deg/s TODO: convert to mrad/s
#define DEFAULT_SERVO_SCALE			360.0f	  // deg   TODO: convert to mrad, 1000 milliradian = 57.2957795131 deg
											  // 360 degrees equals  2*Pi rads or 6283.185307164 milli-radians or 6283*37/200
#define DEFAULT_DIRECTION			1	    // 1 == forward, -1 == reverse

#define FLASH_PAGE_SIZE			((uint16_t)0x400)   // 1024 bytes
#define FLASH_WRITE_ADDR		(0x08000000 + (uint32_t)FLASH_PAGE_SIZE * 63)    // use the last KB for storage, we assume 64 KB flash

// You can enable/disable PHY protocols we support:
#define ENABLE_ONEWIRE_PROTOCOL 1
#undef	ENABLE_ONEWIRE_PROTOCOL			// disable one wire protocol support

#define ENABLE_CANBUS_PROTOCOL 1
#undef	ENABLE_CANBUS_PROTOCOL			// disable CANBUS protocol support

#define ENABLE_PWM_PROTOCOL 1
#undef	ENABLE_PWM_PROTOCOL				// disable PWM control protocol support



#ifdef ENABLE_PWM_PROTOCOL
#else
#define USE_PWM_PIN_AS_USART_DEVICE_SELECT  1	// allow parallel connection of USART RX & TX lines with "chip select" line
#endif  // ENABLE_PWM_PROTOCOL


enum configParameters {
    fCONFIG_VERSION = 0,
    uSTARTUP_MODE, // 0 == normal open loop mode 1 == closed loop RPM mode 2 == thrust closed loop mode
    uBAUD_RATE,    // The default baud rate
    uPTERM,        // Speed PI control, P item
    uITERM,        // Speed PI control, item I
    FF1TERM,	  // Feed forward terms used for the RPM controller.  Closed loop RPM mode will not function until FF1 & FF2 terms have been set.
    FF2TERM,
    CL1TERM,	  // Current Limiter (CL) coefficients. CL1TERM is in range []
    CL2TERM,	  // CL2TERM is in range []
    CL3TERM,	  // CL3TERM is in range []
    CL4TERM,	  // CL4TERM is in range []
    CL5TERM,	  // CL5TERM is in range []
    SHUNT_RESISTANCE_MILIOHM,
    fMIN_PERIOD,       // The minimum commutation period
    fMAX_PERIOD,		  // The maximum commutation period
    fBLANKING_MICROS,  // BEMF sensing blanking time
    ADVANCE,          // The amount of timing advance in electrical degrees.  There are 60 electrical degrees in a commutation cycle.  This value can be set from 0 to 30 degrees.
    fSTART_VOLTAGE,
    uGOOD_DETECTS_START, // how many good detects're necessary to consider motor running OK ?
    uBAD_DETECTS_DISARM, // how many bad detects are enough to stop the motor from running
    fMAX_CURRENT,
    uSWITCH_FREQ,        // PWM freq in KHz, default 20KHz
    uMOTOR_POLES,        // N of magnetic poles, used to detect RPM and ...
    PWM_INTF_MIN_PERIOD,
    PWM_INTF_MAX_PERIOD,
    PWM_INTF_MIN_VALUE,      // PWM input minimum high time (pulse width)
    PWM_INTF_LO_VALUE,
    PWM_INTF_HI_VALUE,
    PWM_INTF_MAX_VALUE,     //  maximum high time (pulse width)
    PWM_INTF_MIN_START,
    PWM_INTF_RPM_SCALE,
    uFET_BRAKING,       // FET Brake Mode enable 0 = Off 1 = On
    PNFAC,
    INFAC,
    THR1TERM,
    THR2TERM,
    uSTART_ALIGN_TIME,
    START_ALIGN_VOLTAGE,
    uSTART_STEPS_NUM,
    uSTART_STEPS_PERIOD,
    uSTART_STEPS_ACCEL,
    fPWM_INTF_LOWPASS,
    fRPM_INTF_MEAS_LP,
    fSERVO_DUTY,
    fSERVO_P,
    fSERVO_D,
    fSERVO_MAX_RATE,
    fSERVO_SCALE,
    uESC_ID,
    iDIRECTION,
    CONFIG_NUM_PARAMS   // the last member gives the count ? TODO: use sizeof() 
};


extern float    parameters_asFloat32[CONFIG_NUM_PARAMS];           // configuration parameters. Todo: refactor/rename accordingly
extern uint32_t * parameters_asUint32;
extern int32_t  * parameters_asSint32;

extern const char *configParameterStrings[];
extern const char *configFormatStrings[];
extern const char configFormatTypes[];

extern void configInit(void);
extern int configSetParam(char *param, float value);
extern int configSetParamByID(unsigned int i, float value);		// used by the binary UART protocol
extern int configGetId(char *param);
extern float configGetParam(char *param);
extern void configLoadDefault(void);
extern void configReadFlash(void);
extern int configWriteFlash(void);

#endif
