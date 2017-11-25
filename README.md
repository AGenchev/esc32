# code taken from esc32, reworked in gelemodxx branches. Hardware - included.
Please, switch to gelemodxx branches if you want to watch my code. The main / trunk branch I will leave unmodified !!!
Automatically exported from code.google.com/p/esc32

I plan to modify this and reform the project... The goal - to compile with FOSS tools completely and to contain all source.
I will offer a PCB hardware design to test it.
The clone won't be called esc32, because I don't want to confuse the users - I will introduce new bugs.

First bug: My version has slower floating point operations. Thus the control loop is close to take 100% of the CPU time, which is dangerous, because it's timer-driven, e.t. in IRQ. Resolution: to rewrite the control loop in integer. Not done yet.

