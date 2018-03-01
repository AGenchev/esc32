# code taken from esc32, heavily reworked

I modified this and reformed the project... The goal - to compile with FOSS tools completely and to contain all source.
I put in a PCB hardware design to test it.
I probably have introduced new bugs.

First "problem": When I compiled with GCC, I got less CPU free time than the binary from esc32. Thus the control loop was closer to take 100% of the CPU time.
I considered this dangerous, because the control loop is timer-driven, e.t. in IRQ. Resolution path taken: to rewrite the control loop in integer. Most of it's done, RPM calculation is still in floating point though.

