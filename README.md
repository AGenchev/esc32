# code taken from esc32, heavily reworked

I plan to modify this and reform the project... The goal - to compile with FOSS tools completely and to contain all source.
I will offer a PCB hardware design to test it.
I will introduce new bugs.

First "bug": My version has slower floating point operations. Thus the control loop is close to take 100% of the CPU time, which is dangerous, because it's timer-driven, e.t. in IRQ. Resolution: to rewrite the control loop in integer. Not done yet.

