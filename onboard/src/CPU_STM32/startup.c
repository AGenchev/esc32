/** Startup C file - no assembly startup is needed for m3 cores :-)
 * \file startup.c
 * \brief STM32 (STM32F101 - STM32F103) vector table and startupcode
 * \details STM32 (STM32F101 - STM32F103) vector table and startupcode
 * \author Marten Petschke
 * \date 21.Aug.2012
 * \Modifications, comments - A.Genchev, date 17.May.2015 
 */


#include "stm32f10x.h" // Load CMSIS and peripheral library and configuration

//#include "printf.h" // debug support
/******************************************************************************
* chip: STM32F101VB
* compiler: yagarto-gcc 7.1
******************************************************************************/
// Linker provided symbols (addresses):
extern unsigned long __data_init_start;      // init value location in the flash. Start address for the initialization
											 // values of the .data section.
extern unsigned long __data_start;           // RAM Start address for the .data section
extern unsigned long __data_end;             // RAM End address for the .data section
extern unsigned long __bss_start;            // RAM Start address for the .bss section
extern unsigned long __bss_end;              // RAM End address for the .bss section
extern unsigned long __stack_start;		 	 // RAM @ end of physical RAM; main and intr stack end (from linker script)
// stack end is where the heap ends, because the stack grows backwards
extern void __libc_init_array(void);  		 // calls CTORS of static objects in C++. Not needed for "pure C"

/*
+=============================================================================+
| local declarations
+=============================================================================+
*/

void Reset_Handler(void) __attribute__((noreturn));
extern void main(void);

static void __Init_Data(void)
{
	unsigned long *source;
	unsigned long *destination;
	// default stack left to "__main_stack_end" so no change here..

	// Copying data from Flash to RAM  - Initialize .data section
	source = &__data_init_start; // provided by the linker script
	for (destination = &__data_start; destination < &__data_end;)
	{
		*(destination++) = *(source++);
	}
	// default zero to undefined variables //Zero-init .bss section
	for (destination = &__bss_start; destination < &__bss_end;)
	{
		*(destination++) = 0;
	}
	/* Call CTORS of static objects */
	// __libc_init_array(); // C++! Not needed for "pure C"
}


/*------------------------------------------------------------------------*//**
* \brief Default interrupt handler.
* \details Default interrupt handler, used for interrupts that don't have their
* own handler defined.
*//*-------------------------------------------------------------------------*/

//static void __Default_Handler(void) __attribute__ ((interrupt));
void __Default_Handler(void)
{	// 1. Determining Which Exception Handler is Executing (if triggered by IRQ) as per http://www.freertos.org/Debugging-Hard-Faults-On-Cortex-M-Microcontrollers.html
	// We load the number of the executing interrupt into register 2 (r2) before the infinite loop is entered:
	// System Control Block 0xE000ED04	ICSR - Interrupt Control and State Register
	volatile uint32_t int_no = SCB->ICSR & 0xFF;
	//asm(" mov r3, ICSR"); // Load the address of the interrupt control register into r3
	//asm(" ldr r2, [r3, #0]"); // Load the value of the interrupt control register into r2 from the address held in r3.
	//asm(" uxtb r2, r2"); // The interrupt number is in the least significant byte - clear all other bits.
	UNUSED_PARAMETER(int_no);
	while (1)
	{;
	}

}

/*
+=============================================================================+
| assign all unhandled interrupts to the default handler using weak linking w alias
+=============================================================================+
*/

// Non-maskable interrupt (RCC clock security system)
void NMI_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// All class of fault
void HardFault_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// Memory management
void MemManage_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// Pre-fetch fault, memory access fault
void BusFault_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// Undefined instruction or illegal state
void UsageFault_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// Reserved 0x1C
void __Reserved_0x1C_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// Reserved 0x20
void __Reserved_0x20_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// Reserved 0x24
void __Reserved_0x24_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// Reserved 0x28
void __Reserved_0x28_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// System service call via SWI instruction
void SVC_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// Debug monitor
void DebugMon_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// Reserved 0x34
void __Reserved_0x34_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// Pendable request for system service
void PendSV_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// System tick timer
void SysTick_Handler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// Window watchdog interrupt
void WWDG_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// PVD through EXTI line detection interrupt
void PVD_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// Tamper interrupt
void TAMPER_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// RTC global interrupt
void RTC_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// Flash global interrupt
void FLASH_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// RCC global interrupt
void RCC_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// EXTI Line0 interrupt
void EXTI0_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// EXTI Line1 interrupt
void EXTI1_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// EXTI Line2 interrupt
void EXTI2_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// EXTI Line3 interrupt
void EXTI3_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// EXTI Line4 interrupt
void EXTI4_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// DMA1 Channel1 global interrupt
void DMA1_Channel1_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// DMA1 Channel2 global interrupt
void DMA1_Channel2_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// DMA1 Channel3 global interrupt
void DMA1_Channel3_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// DMA1 Channel4 global interrupt
void DMA1_Channel4_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// DMA1 Channel5 global interrupt
void DMA1_Channel5_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// DMA1 Channel6 global interrupt
void DMA1_Channel6_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// DMA1 Channel7 global interrupt
void DMA1_Channel7_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// ADC1 and ADC2 global interrupt
void ADC1_2_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// USB high priority or CAN TX interrupts:  different names for coocox and *** 
//void USB_HP_CAN_TX_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));
void USB_HP_CAN1_TX_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));


// USB low priority or CAN RX0 interrupts:  different names for coocox and ***
//void USB_LP_CAN_RX0_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));
void USB_LP_CAN1_RX0_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));



// CAN RX1 interrupt
void CAN_RX1_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// CAN SCE interrupt
void CAN_SCE_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// EXTI Line[9:5] interrupts
void EXTI9_5_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// TIM1 break interrupt
void TIM1_BRK_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// TIM1 update interrupt
void TIM1_UP_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// TIM1 trigger and commutation interrupts
void TIM1_TRG_COM_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// TIM1 capture compare interrupt
void TIM1_CC_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// TIM2 global interrupt
void TIM2_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// TIM3 global interrupt
void TIM3_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// TIM4 global interrupt
void TIM4_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// I2C1 event interrupt
void I2C1_EV_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// I2C1 error interrupt
void I2C1_ER_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// I2C2 event interrupt
void I2C2_EV_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// I2C2 error interrupt
void I2C2_ER_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// SPI1 global interrupt
void SPI1_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// SPI2 global interrupt
void SPI2_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// USART1 global interrupt
void USART1_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// USART2 global interrupt
void USART2_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// USART3 global interrupt
void USART3_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// EXTI Line[15:10] interrupts
void EXTI15_10_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// RTC alarm through EXTI line interrupt
void RTCAlarm_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// USB wakeup from suspend through EXTI line interrupt:
void USBWakeUp_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));



// TIM8 break interrupt
void TIM8_BRK_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// TIM8 update interrupt
void TIM8_UP_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// TIM8 trigger and commutation interrupts
void TIM8_TRG_COM_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// TIM8 capture compare interrupt
void TIM8_CC_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// ADC3 global interrupt
void ADC3_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// FSMC global interrupt
void FSMC_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// SDIO global interrupt
void SDIO_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// TIM5 global interrupt
void TIM5_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// SPI3 global interrupt
void SPI3_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// UART4 global interrupt
void UART4_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// UART5 global interrupt
void UART5_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// TIM6 global interrupt
void TIM6_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// TIM7 global interrupt
void TIM7_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// DMA2 Channel1 global interrupt
void DMA2_Channel1_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// DMA2 Channel2 global interrupt
void DMA2_Channel2_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// DMA2 Channel3 global interrupt
void DMA2_Channel3_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

// DMA2 Channel4 and DMA2 Channel5 global interrupts
void DMA2_Channel4_5_IRQHandler(void) __attribute__ ((interrupt, weak, alias("__Default_Handler")));

/*
+=============================================================================+
| Vector table,  ".vectors" must be defined in linker script
| This table covers the very first 8 bytes in the Flash. They contain a
| stack address and a jump address to the first code - Reset_handler()
+=============================================================================+
Note: there are some extra handlers at the end, not for STM32F103C8
Note: the table name below(g_ISR_Vectors) must be the same as in the linker script used !!!
*/

void (* const g_ISR_Vectors[])(void) __attribute__ ((section(".g_ISR_Vectors"))) =
{
		(void (*)(void))&__stack_start, // Main stack end address, by default loaded in CONTROL special register
		Reset_Handler,						// first code after Reset
		NMI_Handler,						// Non-maskable interrupt (RCC clock security system)
		HardFault_Handler,					// All class of fault
		MemManage_Handler,					// Memory management
		BusFault_Handler,					// Pre-fetch fault, memory access fault
		UsageFault_Handler,					// Undefined instruction or illegal state
		__Reserved_0x1C_Handler,			// Reserved 0x1C
		__Reserved_0x20_Handler,			// Reserved 0x20
		__Reserved_0x24_Handler,			// Reserved 0x24
		__Reserved_0x28_Handler,			// Reserved 0x28
		SVC_Handler,						// System service call via SWI instruction
		DebugMon_Handler,					// Debug monitor
		__Reserved_0x34_Handler,			// Reserved 0x34
		PendSV_Handler,						// Pendable request for system service
		SysTick_Handler,					// System tick timer
		WWDG_IRQHandler,					// Window watchdog interrupt
		PVD_IRQHandler,						// PVD through EXTI line detection interrupt
		TAMPER_IRQHandler,					// Tamper interrupt
		RTC_IRQHandler,						// RTC global interrupt
		FLASH_IRQHandler,					// Flash global interrupt
		RCC_IRQHandler,						// RCC global interrupt
		EXTI0_IRQHandler,					// EXTI Line0 interrupt
		EXTI1_IRQHandler,					// EXTI Line1 interrupt
		EXTI2_IRQHandler,					// EXTI Line2 interrupt
		EXTI3_IRQHandler,					// EXTI Line3 interrupt
		EXTI4_IRQHandler,					// EXTI Line4 interrupt
		DMA1_Channel1_IRQHandler,			// DMA1 Channel1 global interrupt
		DMA1_Channel2_IRQHandler,			// DMA1 Channel2 global interrupt
		DMA1_Channel3_IRQHandler,			// DMA1 Channel3 global interrupt
		DMA1_Channel4_IRQHandler,			// DMA1 Channel4 global interrupt
		DMA1_Channel5_IRQHandler,			// DMA1 Channel5 global interrupt
		DMA1_Channel6_IRQHandler,			// DMA1 Channel6 global interrupt
		DMA1_Channel7_IRQHandler,			// DMA1 Channel7 global interrupt
		ADC1_2_IRQHandler,					// ADC1 and ADC2 global interrupt
		USB_HP_CAN1_TX_IRQHandler,// USB_HP_CAN_TX_IRQHandler,			// USB high priority or CAN TX interrupts
		USB_LP_CAN1_RX0_IRQHandler,// USB_LP_CAN_RX0_IRQHandler,			// USB low priority or CAN RX0 interrupts
		CAN_RX1_IRQHandler,					// CAN RX1 interrupt
		CAN_SCE_IRQHandler,					// CAN SCE interrupt
		EXTI9_5_IRQHandler,					// EXTI Line[9:5] interrupts
		TIM1_BRK_IRQHandler,				// TIM1 break interrupt
		TIM1_UP_IRQHandler,					// TIM1 update interrupt
		TIM1_TRG_COM_IRQHandler,			// TIM1 trigger and commutation interrupts
		TIM1_CC_IRQHandler,					// TIM1 capture compare interrupt
		TIM2_IRQHandler,					// TIM2 global interrupt
		TIM3_IRQHandler,					// TIM3 global interrupt
		TIM4_IRQHandler,					// TIM4 global interrupt
		I2C1_EV_IRQHandler,					// I2C1 event interrupt
		I2C1_ER_IRQHandler,					// I2C1 error interrupt
		I2C2_EV_IRQHandler,					// I2C2 event interrupt
		I2C2_ER_IRQHandler,					// I2C2 error interrupt
		SPI1_IRQHandler,					// SPI1 global interrupt
		SPI2_IRQHandler,					// SPI2 global interrupt
		USART1_IRQHandler,					// USART1 global interrupt
		USART2_IRQHandler,					// USART2 global interrupt
		USART3_IRQHandler,					// USART3 global interrupt
		EXTI15_10_IRQHandler,				// EXTI Line[15:10] interrupts
		RTCAlarm_IRQHandler,				// RTC alarm through EXTI line interrupt
		USBWakeUp_IRQHandler,//USBWakeup_IRQHandler,				// USB wakeup from suspend through EXTI line interrupt
		TIM8_BRK_IRQHandler,				// TIM8 break interrupt
		TIM8_UP_IRQHandler,					// TIM8 update interrupt
		TIM8_TRG_COM_IRQHandler,			// TIM8 trigger and commutation interrupts
		TIM8_CC_IRQHandler,					// TIM8 capture compare interrupt
		ADC3_IRQHandler,					// ADC3 global interrupt
		FSMC_IRQHandler,					// FSMC global interrupt
		SDIO_IRQHandler,					// SDIO global interrupt
		TIM5_IRQHandler,					// TIM5 global interrupt
		SPI3_IRQHandler,					// SPI3 global interrupt
		UART4_IRQHandler,					// UART4 global interrupt
		UART5_IRQHandler,					// UART5 global interrupt
		TIM6_IRQHandler,					// TIM6 global interrupt
		TIM7_IRQHandler,					// TIM7 global interrupt
		DMA2_Channel1_IRQHandler,			// DMA2 Channel1 global interrupt
		DMA2_Channel2_IRQHandler,			// DMA2 Channel2 global interrupt
		DMA2_Channel3_IRQHandler,			// DMA2 Channel3 global interrupt
		DMA2_Channel4_5_IRQHandler,			// DMA2 Channel4 and DMA2 Channel5 global interrupts
		(void *)0xF108F85F   // hardcoded instruction:
		// 0x20000109 <__vector_table+265>: ldr.w pc, [pc, #-264] ; 0x20000004
		// This is for boot in RAM mode for  STM32F10x Medium Density devices.
		// loads the value at 0x2000004 into the PC register and starts running from it (reset handler).
};



/*
+=============================================================================+
| Reset_Handler() - first code after reset. Interrupts are disabled.
+=============================================================================+
*/
extern void _start();
void __attribute__((noreturn)) Reset_Handler(void)
{	// notice the lack of local variables - these would permanently reserve space on the stack
	// and I prefer to trade code memory (flash) for RAM
	// VTOR stuff happens automatically - depending on the linker, just load .elf
	// SCB->VTOR = (unsigned int) & g_ISR_Vectors;
	//asm(" bkpt ");
	// http://embdev.net/topic/185672:
	// A.Genchev: We reset stack pointer: basically this is *NOT* necessary, because we loose only 4 bytes stack memory - despite "noreturn" flag,
	// GCC has pushed one register (r7) into the stack.
	// To restore the lost 32 bits, we put in more bits in code. Also this code helps me when I debug from RAM.
	asm(" LDR r0, =__stack_start"); // Load stack start address into r0
	asm(" MSR msp, r0"); // r0 -> r13

	/* SCB's VTOR register to the correct interrupt-vector-table address in ram
	 * Vector_Table_Base is defined in misc.h as follows:
	#define NVIC_VectTab_RAM             ((uint32_t)0x20000000)
	#define NVIC_VectTab_FLASH           ((uint32_t)0x08000000)
	*/
	// This is necessary to work the interrupts:
	#ifdef VECT_TAB_SRAM
	    NVIC_SetVectorTable(NVIC_VectTab_RAM,0X0);
	#endif
	__Init_Data();
	SystemInit(); // // Setup STM32 system (clock, PLL and Flash configuration)
	//init_UART1(); // printf support
	//_start(); // c library start. absent/not linked in if "-nostdlib" switch used on linker
	main(); // starting main program

	while(1){} // no-return
}

/******************************************************************************
* END OF FILE
******************************************************************************/
