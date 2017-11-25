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
#include "cli.h"
#include "getbuildnum.h"
#include "main.h"
#include "serial.h"
#include "run.h"
#include "fet.h"
#include "pwm.h"

#include "rcc.h"
#include "timer.h"
#include "can.h"
//Gele: these below are from libc .. I had to go https://github.com/PetteriAimonen & his Baselibc
//Gele: TODO: remove stdxxx dependencies
//#include "sprintf.h" // local implementation
#include <stdio.h>
#include "stdlib.h" // bsearch is here
#include <string.h>
#include <math.h>
#include "adc.h"

char version[16];// current software version
char cliBuf[32]; // The data received by the serial port is stored in this array and is accessed according to cliBufIndex
int cliBufIndex; // serial buff index
char tempBuf[64];// output char buffer
int cliTelemetry; // Automatically print data mode, in the systick interrupt will call cliCheck function. Then you can automatically print the current information (serial mode)

// Local functions:
static void clifetSelfTest(void *cmd, char *cmdLine);

// this table must be sorted by command name 
// from small to bigger because it is searched by dichotomy
const cliCommand_t cliCommandTable[] = {
    {"arm", "", cliFuncArm},                                    // switch to manual operation
    {"beep", "<frequency> <duration>", cliFuncBeep},            // let the motor beep
    {"binary", "", cliFuncBinary},                              // switches the serial port to binary control mode.
    {"bootloader", "", cliFuncBoot},                            // restart esc32 (in bootloader mode?)
    {"config", "[READ | WRITE | DEFAULT]", cliFuncConfig},       // Read /write / reset the parameter table
    {"disarm", "", cliFuncDisarm},                              // Stop the manual operation mode
    {"duty", "<percent>", cliFuncDuty},                         // Set the duty cycle (0 ~ 100%, the higher the value the faster the speed)
	{"fetSelfTest","",clifetSelfTest},							// performs FET self test and Displays the results
	{"help", "", cliFuncHelp},                                  // Displays help information for supported function commands
    {"input", "[PWM | UART | I2C | CAN]", cliFuncInput},        // Set the input control mode
    {"mode", "[OPEN_LOOP | RPM | THRUST | SERVO]", cliFuncMode},// Set the run mode
    {"pos", "<degrees>", cliFuncPos},                           // Set the motor to go to what angle (only in the servo control mode), is passed in the parameters 
#ifdef ENABLE_PWM_PROTOCOL
	{"pwm", "<microseconds>", cliFuncPwm},                      // set the PWM ??
#endif
    {"rpm", "<target>", cliFuncRpm},                            // Set the target speed
    {"set", "LIST | [<PARAMETER> <value>]", cliFuncSet},        // set the parameter table
    {"start", "", cliFuncStart},                                // start the motor 
    {"status", "", cliFuncStatus},                              // display status
    {"stop", "", cliFuncStop},                                  // stop the motor 
    {"telemetry", "<Hz>", cliFuncTelemetry},                    // Automatically display the ESC state (independent of control)
    {"version", "", cliFuncVer}                                 // display the version
};

// sorted commands list. Use this list to sort & insert new commands:
/* We use: http://alphabetizer.flap.tv/ to sort our commands online :-)
arm
beep
binary
bootloader
config
disarm
duty
fetSelfTest
help
input
mode
pos
pwm
rpm
set
start
status
stop
telemetry
version
*/

#define CLI_N_CMDS (sizeof cliCommandTable / sizeof cliCommandTable[0])

const char *cliInputModes[] =
{
    "PWM",
    "UART",
    "I2C",
    "CAN",
    "OW"
};

const char *cliStates[] =
{
    "DISARMED",
    "STOPPED",
    "PRE-START",
    "STARTING",
    "RUNNING"
};

const char *cliRunModes[] =
{
    "OPEN_LOOP",
    "RPM",
    "THRUST",
    "SERVO"
};

const char cliHome[] = {0x1b, 0x5b, 0x48, 0x00};
const char cliClear[] = {0x1b, 0x5b, 0x32, 0x4a, 0x00};
const char cliClearEOL[] = {0x1b, 0x5b, 0x4b, 0x00};
const char cliClearEOS[] = {0x1b, 0x5b, 0x4a, 0x00};
const char *stopError = "ESC must be stopped first\r\n";
const char *runError = "ESC not running\r\n";

// command help:
void cliUsage(cliCommand_t *cmd)
{
    serialPrint("usage: ");
    serialPrint(cmd->name);
    serialWrite(' ');
    serialPrint(cmd->params);
    serialPrint("\r\n");
}

void cliFuncChangeInput(uint8_t input)
{  // set the control mode (serial can iic pwm ow)
	if (inputMode != input)
	{
		inputMode = input;
		sprintf(tempBuf, "Input mode set to %s\r\n", cliInputModes[input]);
		serialPrint(tempBuf);
	}
}

void cliFuncArm(void *cmd, char *cmdLine)
{ // arm the ESC
	if (ESC_state > ESC_STATE_DISARMED)
	{
		serialPrint("ESC already armed\r\n");
	}
	else
	{
		if (runMode != SERVO_MODE)
			cliFuncChangeInput(ESC_INPUT_UART);
		runArm();
		serialPrint("ESC armed\r\n");
	}
}

void cliFuncBeep(void *cmd, char *cmdLine)
{
	uint16_t freq, dur;

	if (ESC_state > ESC_STATE_STOPPED)
	{
		serialPrint(stopError);
	}
	else
	{
		if (sscanf(cmdLine, "%hu %hu", &freq, &dur) != 2)
		{
			cliUsage((cliCommand_t *) cmd);
		}
		else if (freq < 10 || freq > 5000)
		{
			serialPrint("frequency out of range: 10 => 5000\r\n");
		}
		else if (dur < 1 || dur > 1000)
		{
			serialPrint("duration out of range: 1 => 1000\r\n");
		}
		else
		{
			fetBeep(freq, dur);
		}
	}
}

void cliFuncBinary(void *cmd, char *cmdLine)
{
	if (ESC_state > ESC_STATE_STOPPED)
	{
		serialPrint(stopError);
	}
	else
	{
		serialPrint("Entering binary command mode...\r\n");
		cliTelemetry = 0;
		commandMode = BINARY_MODE;
	}
}


void cliFuncBoot(void *cmd, char *cmdLine)
{
	if (ESC_state != ESC_STATE_DISARMED)
	{
		serialPrint("ESC armed, disarm first\r\n");
	}
	else
	{
		serialPrint("Rebooting in boot loader mode...\r\n");
		timerDelay(0xffff);

		rccReset();
	}
}

void cliFuncConfig(void *cmd, char *cmdLine)
{
	char param[8];

	if (ESC_state > ESC_STATE_STOPPED)
	{
		serialPrint(stopError);
	}
	else if (sscanf(cmdLine, "%8s", param) != 1)
	{
		cliUsage((cliCommand_t *) cmd);
	}
	else if (!strcasecmp(param, "default"))
	{
		configLoadDefault();
		serialPrint("CONFIG: defaults loaded\r\n");
	}
	else if (!strcasecmp(param, "read"))
	{
		configReadFlash();
		serialPrint("CONFIG: read flash\r\n");
	}
	else if (!strcasecmp(param, "write"))
	{
		if (configWriteFlash())
		{
			serialPrint("CONFIG: wrote flash\r\n");
		}
		else
		{
			serialPrint("CONFIG: write flash failed!\r\n");
		}
	}
	else
	{
		cliUsage((cliCommand_t *) cmd);
	}
}

void cliFuncDisarm(void *cmd, char *cmdLine)
{	runDisarm(REASON_CLI_USER);
	cliFuncChangeInput(ESC_INPUT_UART);
	serialPrint("ESC disarmed\r\n");
}

void cliFuncDuty(void *cmd, char *cmdLine)
{
	float duty;

	if (ESC_state < ESC_STATE_RUNNING)
	{
		serialPrint(runError);
	}
	else
	{
		if (sscanf(cmdLine, "%f", &duty) != 1)
		{
			cliUsage((cliCommand_t *) cmd);
		}
		else if (!runDuty(duty))
		{
			serialPrint("duty out of range: 0 => 100\r\n");
		}
		else
		{
			sprintf(tempBuf, "Fet duty set to %.2f%%\r\n",
					(float) fetDutyCycle / fetPeriod * 100.0f);
			serialPrint(tempBuf);
		}
	}
}

static void clifetSelfTest(void *cmd, char *cmdLine)
{
	fetSelfTestResults_t firstErr;
	if (ESC_state != ESC_STATE_DISARMED)
		{
			serialPrint("ESC must be disarmed\r\n");
			return;
		}
	firstErr = fetSelfTest();
	char * RESULT="FAILED"; char* Mosfet;
	switch(firstErr)
	{
	case FET_TEST_A_LO_FAIL: Mosfet="A-LO";
		break;
	case FET_TEST_B_LO_FAIL: Mosfet="B-LO";
		break;
	case FET_TEST_C_LO_FAIL: Mosfet="C-LO";
		break;
	case FET_TEST_A_HI_FAIL: Mosfet="A-HI";
		break;
	case FET_TEST_B_HI_FAIL: Mosfet="B-HI";
		break;
	case FET_TEST_C_HI_FAIL: Mosfet="C-HI";
		break;
	default: // case FET_TEST_PASSED:
		Mosfet=NULL;RESULT="TEST PASSED";
		break;
	}
	sprintf(tempBuf,"FET %s %s\r\n", Mosfet, RESULT);
	serialPrint(tempBuf);
}

void cliFuncHelp(void *cmd, char *cmdLine)
{
	uint16_t i;

	serialPrint("Available commands:\r\n\n");

	for (i = 0; i < CLI_N_CMDS; i++)
	{
		serialPrint(cliCommandTable[i].name);
		serialWrite(' ');
		serialPrint(cliCommandTable[i].params);
		serialPrint("\r\n");
	}
}

void cliFuncInput(void *cmd, char *cmdLine)
{
	char mode[sizeof cliInputModes[0]];
	uint16_t i;

	if (sscanf(cmdLine, "%7s", mode) != 1)
	{
		cliUsage((cliCommand_t *) cmd);
	}
	else
	{
		for (i = 0; i < (sizeof cliInputModes / sizeof cliInputModes[0]); i++)
		{
			if (!strncasecmp(cliInputModes[i], mode, 3))
				break;
		}

		if (i < (sizeof cliInputModes / sizeof cliInputModes[0]))
		{
			cliFuncDisarm(cmd, cmdLine);
			cliFuncChangeInput(i);
		}
		else
			cliUsage((cliCommand_t *) cmd);
	}
}

void cliFuncMode(void *cmd, char *cmdLine)
{
	char mode[sizeof cliRunModes[0]];
	uint16_t i;

	if (sscanf(cmdLine, "%10s", mode) != 1)
	{
		cliUsage((cliCommand_t *) cmd);
	}
	else
	{
		for (i = 0; i < (sizeof cliRunModes / sizeof cliRunModes[0]); i++)
		{
			if (!strncasecmp(cliRunModes[i], mode, strlen(cliRunModes[i])))
				break;
		}

		if (i < (sizeof cliRunModes / sizeof cliRunModes[0]))
		{
			cliFuncDisarm(cmd, cmdLine);
			runMode = i;
			sprintf(tempBuf, "Run mode set to %s\r\n", cliRunModes[i]);
			serialPrint(tempBuf);
		}
		else
			cliUsage((cliCommand_t *) cmd);
	}
}

void cliFuncPos(void *cmd, char *cmdLine)
{
	float angle;

	if (ESC_state < ESC_STATE_RUNNING)
	{
		serialPrint(runError);
	}
	else if (runMode != SERVO_MODE)
	{
		serialPrint("Command only valid in servo mode\r\n");
	}
	else
	{
		if (sscanf(cmdLine, "%f", &angle) != 1)
		{
			cliUsage((cliCommand_t *) cmd);
		}
		else
		{
			fetSetAngle(angle);
			sprintf(tempBuf, "Position set to %.1f\r\n", angle);
			serialPrint(tempBuf);
		}
	}
}


#ifdef ENABLE_PWM_PROTOCOL
void cliFuncPwm(void *cmd, char *cmdLine)
{
	uint16_t pwm;

	if (ESC_state < ESC_STATE_RUNNING)
	{
		serialPrint(runError);
	}
	else
	{
		if (sscanf(cmdLine, "%hu", &pwm) != 1)
		{
			cliUsage((cliCommand_t *) cmd);
		}
		else if (pwm < pwmLoValue || pwm > pwmHiValue)
		{
			sprintf(tempBuf, "PWM out of range: %d => %d\r\n", pwmLoValue,
					pwmHiValue);
			serialPrint(tempBuf);
		}
		else
		{
			if (runMode != SERVO_MODE)
				runMode = OPEN_LOOP;
			runNewInput(pwm);
			sprintf(tempBuf, "PWM set to %d\r\n", pwm);
			serialPrint(tempBuf);
		}
	}
}
#endif

void cliFuncRpm(void *cmd, char *cmdLine)
{
	unsigned int targetRPM;

	if (ESC_state < ESC_STATE_RUNNING)
	{
		serialPrint(runError);
	}
	else
	{
		if (sscanf(cmdLine, "%u", &targetRPM) != 1)
		{
			cliUsage((cliCommand_t *) cmd);
		}
		else if (parameters_asFloat32[FF1TERM] == 0.0f)
		{
			serialPrint("Calibration parameters required\r\n");
		}
		else if (targetRPM < 100 || targetRPM > 10000)
		{
			serialPrint("RPM out of range: 100 => 10000\r\n");
		}
		else
		{
			if (runMode != CLOSED_LOOP_RPM)
			{
				runRpmPIDReset();
				runMode = CLOSED_LOOP_RPM;
			}
			targetRpm = targetRPM;
			sprintf(tempBuf, "RPM set to %6u\r\n",(unsigned int) targetRpm); // was %6.1f
			serialPrint(tempBuf);
		}
	}
}

void cliPrintParam(unsigned int i)
{
	const char *format = "%-20s = ";

	sprintf(tempBuf, format, configParameterStrings[i]);
	serialPrint(tempBuf);
	switch(configFormatTypes[i])
	{
	case 'i':
		sprintf(tempBuf, configFormatStrings[i], parameters_asSint32[i]);
		break;
	case 'u':
		sprintf(tempBuf, configFormatStrings[i], parameters_asUint32[i]);
		break;
	default:
		sprintf(tempBuf, configFormatStrings[i], parameters_asFloat32[i]);
	}
	serialPrint(tempBuf);serialPrint("\r\n");
}

void cliFuncSet(void *cmd, char *cmdLine)
{
	char param[32];
	float value;
	int i; // must be signed beacuse used also to get return value of a function

	if (sscanf(cmdLine, "%32s", param) != 1)
	{
		cliUsage((cliCommand_t *) cmd);
	}
	else
	{
		if (!strcasecmp(param, "list"))
		{
			for (i = 1; i < CONFIG_NUM_PARAMS; i++)
				cliPrintParam(i);
		}
		else
		{
			i = configGetId(param);

			if (i < 0)
			{
				sprintf(tempBuf, "SET: no such parameter '%s'\r\n", param);
				serialPrint(tempBuf);
			}
			else
			{
				if (sscanf(cmdLine + strlen(param) + 1, "%f", &value) == 1)
				{
					if (ESC_state > ESC_STATE_STOPPED)
					{
						sprintf(tempBuf, stopError);
						serialPrint(tempBuf);
					}
					else
					{
						configSetParamByID(i, value);
						cliPrintParam(i);
					}
				}
				else
				{
					cliPrintParam(i);
				}
			}
		}
	}
}



void cliFuncStart(void *cmd, char *cmdLine)
{
	if (ESC_state == ESC_STATE_DISARMED)
	{
		serialPrint("ESC disarmed, arm first\r\n");
	}
	else if (ESC_state > ESC_STATE_STOPPED)
	{
		serialPrint("ESC already running\r\n");
	}
	else
	{
		runStart();
		serialPrint("ESC started\r\n");
	}
}

void cliFuncStatus(void *cmd, char *cmdLine)
{
	const char *formatFloat  = "%-12s%10.2f\r\n"; //"%-12s%10.2f\r\n"; // we have sprintf() w floating point support
	const char *formatInt    = "%-12s%10d\r\n";
	const char *formatString = "%-12s%10s\r\n";
	const char *formatFP7P2  = "%-12s%7d.%02d\r\n";
	float duty;

	duty = (float) fetActualDutyCycle / fetPeriod;

	sprintf(tempBuf, formatString, "INPUT MODE", cliInputModes[inputMode]);
	serialPrint(tempBuf);

	sprintf(tempBuf, formatString, "RUN MODE", cliRunModes[runMode]);
	serialPrint(tempBuf);

	sprintf(tempBuf, formatString, "ESC STATE", cliStates[ESC_state]);
	serialPrint(tempBuf);

	//sprintf(tempBuf, formatFloat, "PERCENT IDLE", idlePercent);
		//serialPrint(tempBuf);
	sprintf(tempBuf, formatFP7P2, "PERCENT IDLE", U_idle_x100/100, U_idle_x100%100);
	serialPrint(tempBuf);

	sprintf(tempBuf, formatFloat, "COMM PERIOD",(float) (crossingPeriod / TIMER_MULT));
	serialPrint(tempBuf);

	sprintf(tempBuf, formatInt, "BAD DETECTS", fetTotalBadDetects);
	serialPrint(tempBuf);

	sprintf(tempBuf, formatFloat, "FET DUTY", duty * 100.0f);
	serialPrint(tempBuf);

	sprintf(tempBuf, formatFloat, "RPM", rpm);
	serialPrint(tempBuf);

	sprintf(tempBuf, formatFloat, "AMPS AVG", avgAmps); //
	serialPrint(tempBuf);
	sprintf(tempBuf, formatFloat, "AMPS_AVG", adcToMiliAmps_default(adcAvgAmps_ShuntVoltage/65536) ); //
	serialPrint(tempBuf);



	sprintf(tempBuf, formatFloat, "AMPS MAX", maxAmps);
	serialPrint(tempBuf);

	uint32_t Batt_mV = avg_BattmiliVolts; // sample
	sprintf(tempBuf, formatFloat, "BAT VOLTS", avgBattVolts);
	serialPrint(tempBuf);
	sprintf(tempBuf,formatFP7P2, "BAT VOLTS" , Batt_mV/1000, (Batt_mV%1000+3)/10  );
	serialPrint(tempBuf);


	sprintf(tempBuf, formatFloat, "MOTOR VOLTS", avgBattVolts * duty);
	serialPrint(tempBuf);

#ifdef ESC_DEBUG
	sprintf(tempBuf, formatInt, "DISARM CODE", disarmReason);
	serialPrint(tempBuf);
#ifdef ENABLE_CANBUS_PROTOCOL
	sprintf(tempBuf, formatInt, "CAN NET ID", canData.networkId);
	serialPrint(tempBuf);
#endif //ENABLE_CANBUS_PROTOCOL
#endif
}

void cliFuncStop(void *cmd, char *cmdLine)
{
	if (ESC_state < ESC_STATE_NOCOMM)
	{
		serialPrint(runError);
	}
	else
	{
		runStop();
		cliFuncChangeInput(ESC_INPUT_UART);
		serialPrint("ESC stopping\r\n");
	}
}

void cliFuncTelemetry(void *cmd, char *cmdLine)
{
	uint16_t freq;

	if (sscanf(cmdLine, "%hu", &freq) != 1)
	{
		cliUsage((cliCommand_t *) cmd);
	}
	else if (freq > 100)
	{
		serialPrint("Frequency out of range: 0 => 100\r\n");
	}
	else
	{
		if (freq > 0)
		{
			cliTelemetry = RUN_FREQ / freq;
			serialPrint(cliHome);
			serialPrint(cliClear);
			serialWrite('\n');
		}
		else
			cliTelemetry = 0;
	}
}

void cliFuncVer(void *cmd, char *cmdLine)
{
	sprintf(tempBuf, "ESC32 ver %s\r\n", version);
	serialPrint(tempBuf);
}

int cliCommandComp(const void *c1, const void *c2)
{ // bsearch function used by the comparison implementation function
	const cliCommand_t *cmd1 = c1, *cmd2 = c2;

	return strncasecmp(cmd1->name, cmd2->name, strlen(cmd2->name));
}

// According to the name parameter, find the corresponding array entry information from the cliCommandTable table
// If not found, then bsearch will return empty..
cliCommand_t *cliCommandGet(char *name)
{
	cliCommand_t target =	{ name, NULL, NULL };

	return bsearch(&target, cliCommandTable, CLI_N_CMDS, sizeof cliCommandTable[0], cliCommandComp);
}


// TODO: check if I fixed it right
char *cliTabComplete(char *name, int len)
{
	uint32_t i;

	for (i = 0; i < CLI_N_CMDS; i++)
	{
		if( 0 == strncasecmp(name, cliCommandTable[i].name, len) ) // !strncasecmp == (0 == strncasecmp)
		{ // equal
			if( ( (i + 1) < CLI_N_CMDS ) &&  0 == strncasecmp(name, cliCommandTable[i + 1].name, len) )
				return 0;
			else
				return cliCommandTable[i].name;
		}
	}
	return 0;
}

// clear the cli buffer
void cliPrompt(void)
{
	serialPrint("\r\n> ");
	memset(cliBuf, 0, sizeof(cliBuf));
	cliBufIndex = 0;
}

void cliCheck(void)
{
	cliCommand_t *cmd = NULL;

	if (cliTelemetry && !(runCount % cliTelemetry))
	{ // Automatic output of the ESC state
		maxAmps = (adcMaxAmps - adcAmpsOffset) * adcToAmps;

		serialPrint(cliHome);
		sprintf(tempBuf, "Telemetry @ %d Hz\r\n\n", RUN_FREQ / cliTelemetry);
		serialPrint(tempBuf);
		cliFuncStatus(cmd, "");
		serialPrint("\n> ");
		serialPrint(cliBuf);
		serialPrint(cliClearEOL);
	}

	while (serialAvailable())
	{ // If the serial port received data, then enter the loop
		char c = serialRead();

		cliBuf[cliBufIndex++] = c;
		if (cliBufIndex == sizeof(cliBuf))
		{
			cliBufIndex--;
			c = '\n';
		}

		// EOL
		if (cliBufIndex && (c == '\n' || c == '\r'))
		{
			if (cliBufIndex > 1)
			{ // Get a valid command (terminated line). Compare if the command is correct and execute accordingly
				serialPrint("\r\n");
				serialPrint(cliClearEOS);
				cliBuf[cliBufIndex - 1] = 0;

				cmd = cliCommandGet(cliBuf); // read from  cliBuf

				if (cmd)
					cmd->cmdFunc(cmd, cliBuf + strlen(cmd->name));
				else
					serialPrint("Command not found");

				if (commandMode != CLI_MODE)
				{
					cliBufIndex = 0;
					return;
				}
			}

			cliPrompt();
		}
		// tab completion
		else if (c == CLI_TAB)
		{
			char *ret;

			cliBuf[--cliBufIndex] = 0;
			ret = cliTabComplete(cliBuf, cliBufIndex);
			if (ret)
			{
				cliBufIndex = strlen(ret);
				memcpy(cliBuf, ret, cliBufIndex);
				cliBuf[cliBufIndex++] = ' ';
				serialPrint("\r> ");
				serialPrint(cliBuf);
				serialPrint(cliClearEOL);
			}
		}
		// interrupt
		else if (c == CLI_INTR)
		{
			cliPrompt();
		}
		// backspace
		else if (c == CLI_BS)
		{
			if (cliBufIndex > 1)
			{
				cliBuf[cliBufIndex - 2] = 0;
				serialPrint("\r> ");
				serialPrint(cliBuf);
				serialWrite(' ');
				serialPrint("\r> ");
				serialPrint(cliBuf);
				cliBufIndex -= 2;
			}
			else
			{
				cliBufIndex--;
			}
		}
		// out of range character
		else if (c < 32 || c > 126)
		{
			serialWrite(CLI_BELL);
			cliBufIndex--;
		}
		else
		{
			serialWrite(c);
		}
	}
}

// print some information to the serial port
void cliInit(void)
{

	serialPrint(cliHome);
	serialPrint(cliClear);
	sprintf(version, "%s.%d", VERSION, getBuildNumber());

	cliFuncVer(0, 0);
	serialPrint("\r\nCLI ready.\r\n");

	cliPrompt();
}
