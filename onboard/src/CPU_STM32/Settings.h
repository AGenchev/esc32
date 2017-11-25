#ifndef __Settings_H__
#define __Settings_H__


#ifndef TOOLCHAIN_GCC_ARM
#define TOOLCHAIN_GCC_ARM // for eclipse, it's defined in Makefile already (-DTOOLCHAIN_GCC_ARM)
#endif

#ifndef UNUSED_PARAMETER
#define UNUSED_PARAMETER(x) (void)(x) // use this to suppress "unused parameter" warning
#endif

#define FLAG_SET(BitNumber, Register)        (Register |=(1U<<BitNumber))
#define FLAG_CLR(BitNumber, Register)        (Register &=~(1U<<BitNumber))
#define FLAG_CHK(BitNumber, Register)        (Register & (1U<<BitNumber))
#define FLAG_TOGGLE(BitNumber, Register)	 (Register ^= 1U << BitNumber)



//#define RAM_RUN

#endif // __Settings_H__
