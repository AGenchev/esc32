The hardware was converted from EAGLE to KiCad<br/>
<b>Note:</b> I will post hardware which is not fully compatible with the official code of ESC32.
versions:<br/><br/>
a href=https://github.com/AGenchev/esc32/tree/gelemod02/hardware/HardWr_0.2a>HardWr_0.2</a> is on single-layer (w. bridges) routed PCB. ESC32 works on bluepill.
The CPU is STM32F103C8T6, found on cheap chinese boards called Bluepill.
Uses IR2110S NMOSFET gate drivers.
<br /><b>WARNING:</b> The Vcc of the motor and of the IR2110S is tied together so the Vcc shall not exceed 20V for this project.
<br />Note: My test PCB is not intended to fly or to drive racing car. I just wanted to drive a BLDC motor with fixed RPM indoor. 
<br />Control: over serial interface. I set baudrate to 230400, 8-N-1. There are CLI interface and binary interface. Other interfaces which were supported by ESC32 (CAN bus, OneWire, PWM) are there, but are disabled via #UNDEF directive in config.h. because I don't need 'em.
