# code from esc32, reworked in my "gelemodxx" branches. Basically I've created 'ESC32 on Bluepill' hardware. which compiles with GCC for ARM (arm-none-eabi-gcc)
Hardware is included. The main / trunk branch of Bill Nesbitt, I will leave unmodified !!!
E.t. no pull request will be made, because I have changed too many things and don't intend to modify the original project.
Hardware: https://github.com/AGenchev/esc32/tree/gelemod02/hardware

Please, switch to gelemodxx branches if you want to see my mods & hardware. 
Compiler & toolchain: freeware GCC (arm-none-eabi) and openocd. 
Debug adaptor: CMSIS-DAP (opensource).

<b>Note:</b> This free code <b>does NOT give you the right to seek any support on the official Autoquad / ESC32 forum</b>, because they have not sold this HW/SW and bugs to you.

Support: I give you this work as is in hope that it will be useful, but I do not provide any support.
If you want to improve a bit of it, we may discuss. 
I want to get rid of FLOPS in the control loop, because now it eats too many clock cycles.

I plan to modify this and reform the project... The goal - to compile with FOSS tools completely and to contain all source.
I will offer a PCB hardware design to test it.

I will introduce new bugs.

First bug: My version has slower floating point operations. Thus the control loop is close to take 100% of the CPU time, which is dangerous, because it's timer-driven, e.t. in IRQ. I had to rewrite the control loop in integer.

