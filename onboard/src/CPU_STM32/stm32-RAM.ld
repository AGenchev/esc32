/******************************************************************************
* author: Freddie Chopin, http://www.freddiechopin.info/
* modified: Angel Genchev. 
	help used: http://www.hertaville.com/a-sample-linker-script.html
* file: stm32-RAM.ld
* last change: 2016-02-25
*
* chip: STM32F103C8T6
* compiler: arm-none-eabi-gcc (Yagarto) 4.7.1 or ARM supported GCC suite
*
* description:
* Linker script for STM32F103C8T6 chip (64kB Flash, 20kB SRAM).
******************************************************************************/

SEARCH_DIR(.);

/*
+=============================================================================+
| format configurations
+=============================================================================+
*/

OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm");
OUTPUT_ARCH(arm);


/*
+=============================================================================+
| Specify the executable entry point:
+=============================================================================+
*/

ENTRY(Reset_Handler);


/*
+=============================================================================+
| The linker script then defines the sections of the memory map that in to which it will 
| map the various sections of the object files. It does this in "Memory" section:
+=============================================================================+
*/

MEMORY
{
	FLASH (rx)      : ORIGIN = 0x08000000, LENGTH = 64K
  RAM (rwx)       : ORIGIN = 0x20000000, LENGTH = 20K
}

__rom_start = ORIGIN(FLASH);
__rom_size = LENGTH(FLASH);
__rom_end = __rom_start + __rom_size;

__ram_start = ORIGIN(RAM);
__ram_size = LENGTH(RAM);
__ram_end = __ram_start + __ram_size;

PROVIDE(__rom_start = __rom_start);
PROVIDE(__rom_size = __rom_size);
PROVIDE(__rom_end = __rom_end);

PROVIDE(__ram_start = __ram_start);
PROVIDE(__ram_size = __ram_size);
PROVIDE(__ram_end = __ram_end);

/*
+=============================================================================+
| stacks & heap sizes
+=============================================================================+
*/
/* Handler mode (core exceptions / interrupts) can use only main stack.
	Thread mode can use main stack (default) or process stack - selected in CONTROL special register.
	That's why, when we want one stack, we must go for the main stack.
*/
__main_stack_size = 1024;     /* Interrupt and normal level by default */
__process_stack_size = 0;     /* normal level stack - used only if enabled in startup.c */
_min_heap_size = 256;

PROVIDE(__main_stack_size = __main_stack_size);
PROVIDE(__process_stack_size = __process_stack_size);
__stack_size = __process_stack_size + __main_stack_size;

/* define beginning and ending of all stack. Because stack pointer counts backwards, we want to put the initial
		value at the end of RAM. Later we'd tell the LD linker that we want stack section at the end of RAM
*/

__stack_start = ORIGIN(RAM) + LENGTH(RAM);
__stack_end = __stack_start - __stack_size;
PROVIDE(__stack_end = __stack_end);
PROVIDE(__stack_size = __stack_size);
PROVIDE(__stack_start = __stack_start);
__heap_end = __stack_end - 4; 
PROVIDE(__heap_end = __heap_end); /* heap (forward) ends where stack(backward) ends */

/*
+=============================================================================+
| Define linker output sections/segments: 
+=============================================================================+
*/

SECTIONS
{
	/* We put the startup vectors first into RAM. Note: We could merge 'em in .text section */
	/* Notice: the table can have different name for your code. 
		Common names include: vectors, isr_vector, g_pfnVectors, etc.. */
  .g_ISR_Vectors :
  {
    . = ALIGN(4);
    __text_start = .; /* we use this to calculate all code size. Who needs this ? */
    /* The PROVIDE keyword may be used to define a symbol, such as etext if it is referenced but not defined in code.
    	if there is such symbol, the symbol is not redefined by the linker.  
    */
		PROVIDE(__text_start = __text_start);
    KEEP(*(.g_ISR_Vectors)) /* g_ISR_Vectors output section placed here */
    . = ALIGN(4);
  } > RAM
  
	/* The program code and other data - all the .text sections from the object files.  */
	.text :
	{
		. = ALIGN(4);
		*(.text .text.* .gnu.linkonce.t.*);
		. = ALIGN(4);
    *(.rodata)         /* .rodata sections (constants, strings, etc.) */
    *(.rodata*)        /* .rodata* sections (constants, strings, etc.) */
		*(.glue_7)         /* glue arm to thumb code */
    *(.glue_7t)        /* glue thumb to arm code */
		*(.gnu.linkonce.r.*);
		. = ALIGN(4);
		*(.ARM.extab* .gnu.linkonce.armextab.*);	/* exception unwinding information */
		. = ALIGN(4);
		*(.gcc_except_table);	/* information used for stack unwinding during exception */
		. = ALIGN(4);
		*(.eh_frame_hdr);			/* additional information about .ex_frame section */
		. = ALIGN(4);
		*(.eh_frame);					/* ** information used for stack unwinding during exception */
		
		
  /* The Sections named .init, .ctors, .preinit_array, and .init_array are to do with initialization of C/C++ objects, 
		 and sections .fini, .fini_array, and .dtors are for tear down. 
	*/  
		KEEP(*(.init));
		. = ALIGN(4);
		__preinit_array_start = .;
		KEEP(*(.preinit_array));
		. = ALIGN(4);
		__preinit_array_end = .;
		__init_array_start = .;
		KEEP(*(SORT(.init_array.*)));
		. = ALIGN(4);
		KEEP(*(.init_array));
		. = ALIGN(4);
		__init_array_end = .;
		KEEP(*(.fini));
		. = ALIGN(4);
		__fini_array_start = .;
		KEEP(*(.fini_array));
		. = ALIGN(4);
		KEEP(*(SORT(.fini_array.*)));
		. = ALIGN(4);
		__fini_array_end = .;
		
	/* .ctors */
        *crtbegin.o(.ctors)
        *crtbegin?.o(.ctors)
        *(EXCLUDE_FILE(*crtend?.o *crtend.o) .ctors)
        *(SORT(.ctors.*))
        *(.ctors)

 /* .dtors */
        *crtbegin.o(.dtors)
        *crtbegin?.o(.dtors)
        *(EXCLUDE_FILE(*crtend?.o *crtend.o) .dtors)
        *(SORT(.dtors.*))
        *(.dtors)

		. = ALIGN(4);
		__text_end = .;    /* define global symbols at end of code. Some code may want _etext, other __text_end */
		PROVIDE(__text_end = __text_end);
		_etext = .;        
	} > RAM


	/* http://stackoverflow.com/questions/9752000/exidx-start-and-exidx-end-what-do-they-do
		They are declared as extern variables and used in the gcc library. 
	*/
	.ARM.exidx :
	{
		__exidx_start = .;
		PROVIDE(__exidx_start = __exidx_start); 
		*(.ARM.exidx* .gnu.linkonce.armexidx.*);
		__exidx_end = .;
		PROVIDE(__exidx_end = __exidx_end);
	} > RAM				/* index entries for section unwinding */



/* section/segment for initialized data: */
/* .rodata constants goes here by default unless we define entry for them (but we put em in the .text section) */
/* The "AT" keyword basically means that this code will be put in *both* Flash and RAM via the load memory address (LMA) initializer code.
	The static and global variables of the .data section need to be stored in two different locations:
  1. VMA (virtual memory address): the run-time address where the compiled code expects the variables to be. 
  	This will be in RAM as signified by " > RAM".
  2. LMA (load memory address): the addresses to which the initialization data are stored by the linker. 
  	This will be in Flash as signified by the "AT".  The RAM address is called virtual memory address - VMA. 
*/
	.data :
	{
		. = ALIGN(4);
		__data_init_start = LOADADDR (.data);
		PROVIDE(__data_init_start = __data_init_start); /* We provide both symbols for different startup codes */
		__data_start = .;
		PROVIDE(__data_start = __data_start);
		. = ALIGN(4);
		*(.data .data.* .gnu.linkonce.d.*)	/* .data sections, .data.* sections .gnu.linkonce data */
		. = ALIGN(4);
		__data_end = .;
		PROVIDE(__data_end = __data_end);
	} > RAM

/* segment for uninitialized data. The stationery init code zeroes this area at startup: */
	.bss (NOLOAD):
	{
		. = ALIGN(4);
		__bss_start = .;
		PROVIDE(__bss_start = __bss_start);
		PROVIDE(__bss_start__ = __bss_start); /* other source, other name */

		. = ALIGN(4);
		*(.bss .bss.* .gnu.linkonce.b.*) /* bss and .gnu.linkonce BSS */
		. = ALIGN(4);
		*(COMMON);

		. = ALIGN(4);
		__bss_end = .;
		PROVIDE(__bss_end = __bss_end);
		PROVIDE(__bss_end__ = __bss_end); /* other source, other name */
	} > RAM AT > RAM
	
	
	/* STAB debug sections */

	.stab 				0 (NOLOAD) : { *(.stab) }
	.stabstr 			0 (NOLOAD) : { *(.stabstr) }
	
	/* DWARF debug sections.
	* Symbols in the DWARF debugging sections are relative to the beginning
	* of the section so we begin them at 0. */
	/* DWARF 1 */
	.debug				0 : { *(.debug) }
	.line				0 : { *(.line) }
	/* GNU DWARF 1 extensions */
	.debug_srcinfo		0 : { *(.debug_srcinfo) }
	.debug_sfnames		0 : { *(.debug_sfnames) }
	/* DWARF 1.1 and DWARF 2 */
	.debug_aranges		0 : { *(.debug_aranges) }
	.debug_pubnames		0 : { *(.debug_pubnames) }
	/* DWARF 2 */
	.debug_info			0 : { *(.debug_info .gnu.linkonce.wi.*) }
	.debug_abbrev		0 : { *(.debug_abbrev) }
	.debug_line			0 : { *(.debug_line) }
	.debug_frame		0 : { *(.debug_frame) }
	.debug_str			0 : { *(.debug_str) }
	.debug_loc			0 : { *(.debug_loc) }
	.debug_macinfo		0 : { *(.debug_macinfo) }
	/* SGI/MIPS DWARF 2 extensions */
	.debug_weaknames	0 : { *(.debug_weaknames) }
	.debug_funcnames	0 : { *(.debug_funcnames) }
	.debug_typenames	0 : { *(.debug_typenames) }
	.debug_varnames		0 : { *(.debug_varnames) }

	.note.gnu.arm.ident	0 : { KEEP(*(.note.gnu.arm.ident)) }
	.ARM.attributes		0 : { KEEP(*(.ARM.attributes)) }
	
/* The addresses of constructors and destructors of static objects are each stored in a different section in ELF executable. for the constructors there is a section called .CTORS and for the destructors there is the .DTORS section.
the compiler creates two auxillary functions __do_global_dtors_aux and __do_global_ctors_aux for calling the constructors and destructors of these static objects.
__do_global_ctors_aux function simply performs a walk on the .CTORS section, while the __do_global_dtors_aux does the same job only for the .DTORS section which contains the program specified destructors functions.
*/

	
	/* Remove information from the standard libraries */
  /DISCARD/ :
  {
    libc.a ( * )
    libm.a ( * )
    libgcc.a ( * )
    *(.note.GNU-stack)
  }
  
  
  /* The heap starts right after all data and continues on until the end of the stack.
	*/
	. = ALIGN(4);	
	.heap (NOLOAD):
       {
           __heap_start = .;
           PROVIDE(__heap_start = __heap_start);
           . = . + _min_heap_size; /* reserve some size ? */
           ASSERT ( ( . < __stack_end ), "Error: No room left for the heap");
           
       } > RAM
       

  /*
  Because the linker needs to specify memory sections in an upwards / growing fashion, we used the
   __stack_start label, which basically is assigned to the address 20005000 and the stack size to 
   determine the value of the _stack_end variable in the top of the script. This is used to decide
   where the stack section starts from the perspective of the linker.
  */
  /* . = __stack_end; Force section at specific location */
	.= ORIGIN(RAM) + LENGTH(RAM) - __stack_size;
	.stack (NOLOAD):
	{
		. += __stack_size;
		. = ALIGN(8);
		__act_stack_start = . ;
		ASSERT ( ( __act_stack_start <= __stack_start ), "Error: No room left for the stack");
	} > RAM AT > RAM

	 
}

PROVIDE(__text_size = __text_end - __text_start);
PROVIDE(__exidx_size = __exidx_end - __exidx_start);
PROVIDE(__data_size = __data_end - __data_start);
PROVIDE(__bss_size = __bss_end - __bss_start);
__heap_size = __heap_end - __heap_start;
PROVIDE(__heap_size = __heap_size);
/* Additional symbols - for other sbrk implementations */
__StackTop = ORIGIN(RAM) + LENGTH(RAM);
__StackLimit = __StackTop - SIZEOF(.stack);
PROVIDE(__stack = __StackTop);
/******************************************************************************
* END OF FILE
******************************************************************************/
