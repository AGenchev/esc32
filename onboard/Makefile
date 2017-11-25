# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at: http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# File: Makefile.
# For KL25Z GCC demo (baremetal) Copyright (c) 12.2013, Martin Kojtal (0xc0170)
# Modified for STM32F1xxx by Angel Genchev

#CPU = cortex-m0plus
CPU = cortex-m3
INSTRUCTION_MODE = thumb

# DEBUG_IN_RAM: Gele: = 0 for RAM, 1 - for flash
RUN_FROM_FLASH = 1

FOLDER_NAME = CPU_STM32

#
# Define linker script file here
#
ifeq ($(RUN_FROM_FLASH), 0)
LINKER_NAME = stm32-RAM
FULL_PRJ = $(PROJECT)_ram
else
LINKER_NAME = stm32-FLASH
FULL_PRJ = $(PROJECT)_rom
endif


# STM32 specific defines !!! - set the external clock frequency 
HSE_VALUE = 8000000L
DEFINES = HSE_VALUE=$(HSE_VALUE) 
USE_STDPERIPH_DRIVER = -DUSE_STDPERIPH_DRIVER
# Uncomment the appropriate device type and startup file
#DEVICE_TYPE = STM32F10X_LD
#STARTUP_FILE = stm32f10x_ld
DEVICE_TYPE = STM32F10X_MD
#STARTUP_FILE = stm32f10x_md
#DEVICE_TYPE = STM32F10X_HD
#STARTUP_FILE = stm32f10x_hd
#DEVICE_TYPE = STM32F10X_LD_VL
#STARTUP_FILE = stm32f10x_ld_vl
#DEVICE_TYPE = STM32F10X_MD_VL
#STARTUP_FILE = stm32f10x_md_vl
#DEVICE_TYPE = STM32F10X_HD_VL
#STARTUP_FILE = stm32f10x_hd_vl
#DEVICE_TYPE = STM32F10X_XL
#STARTUP_FILE = stm32f10x_xl
#DEVICE_TYPE = STM32F10X_CL
#STARTUP_FILE = stm32f10x_cl


# toolchain specific
TOOLCHAIN = arm-none-eabi-
CC = $(TOOLCHAIN)gcc
CXX = $(TOOLCHAIN)g++
AS = $(TOOLCHAIN)gcc -x assembler-with-cpp
LD = $(TOOLCHAIN)gcc
OBJCP = $(TOOLCHAIN)objcopy
AR = $(TOOLCHAIN)ar

# application specific
TARGET = main
TARGET_EXT = elf
LD_SCRIPT = src/$(FOLDER_NAME)/$(LINKER_NAME).ld
DEFINES += -DTOOLCHAIN_GCC_ARM -DNDEBUG -DCMSIS

# directories: 
OUT_DIR = build

INCLUDE_DIRS =  src  src/$(FOLDER_NAME)  /opt/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include
INCLUDE_DIRS += src/common  src/common/stdlib src/lib/STM32F10x_StdPeriph_Driver 
INCLUDE_DIRS += src/lib/STM32F10x_StdPeriph_Driver/inc  src/lib/CMSIS_CM3
INCLUDE_DIRS += src/lib/Baselibc/include  
# gcc includes. We must specify these when we have put "-nostdinc" compiler switch:
INCLUDE_DIRS += /opt/gcc-arm-none-eabi-5_4-2016q3/arm-none-eabi/include /opt/gcc-arm-none-eabi-5_4-2016q3/lib/gcc/arm-none-eabi/5.4.1/include
# app headers directories (remove comment and add more files)
INCLUDE_DIRS +=./STM32_USB-FS-Device_Driver
INCLUDE_DIRS += src/RF  src/RF_FEC  src/Peripheral_IO  src/USB 
# USB HID Keyboard hdr:
INCLUDE_DIRS += src/lib/STM32_USB-FS-Device_Lib

SRC_DIRS =  src  src/$(FOLDER_NAME) src/common  src/common/stdlib
# ../cmsis ../cmsis/$(FOLDER_NAME)
# app source directories (remove comment and add more files)
SRC_DIRS += src/lib  src/RF  src/RF_FEC  src/Peripheral_IO  src/USB
# USB HID Keyboard src:
SRC_DIRS +=  src/lib/STM32_USB-FS-Device_Lib
# [OPTIONAL] Uncomment to use the firmware library
FWLIB = src/lib/STM32F10x_StdPeriph_Driver/libstm32fw.a
#CLIB  = src/lib/Baselibc/libc.a
# [OPTIONAL] Uncomment following to enable peripheral drivers (instead of direct register access)
# [OPTIONAL] Uncomment to use the USB library
#USBLIB = src/lib/STM32_USB-FS-Device_Driver/libstm32usb.a
# .a library folders go here:
LIBRARY_DIRS = -L src/lib/STM32F10x_StdPeriph_Driver\
 -L src/lib/STM32_USB-FS-Device_Driver\
 -L src/lib/Baselibc
 

# link libraries: maths library LIBM = -lm, LIBGCC = -lgcc, LIBC= -lc, 
# libgcc: GCC generates calls to this library automatically, whenever it needs to perform some operation that is too complicated to emit inline code for. 
# Most of the routines in libgcc handle arithmetic operations that the target processor cannot perform directly. This includes integer multiply and divide on some machines, and all floating-point and fixed-point operations on other machines. libgcc also includes routines for exception handling, and a handful of miscellaneous operations. 
# also: https://gcc.gnu.org/onlinedocs/gcc-4.3.2/gcc/Other-Builtins.html#Other-Builtins

# http://stackoverflow.com/questions/39858015/stm32-gcc-arm-none-eabi-gcc-links-printf-even-though-it-is-not-used

#LIBS  = -lm -lgcc -lc -lnosys
LIBS  = -lm     
# add libstm32fw.a :
LIBS += -lstm32fw


INCLUDE_DIRS_F = -I. $(patsubst %, -I%, $(INCLUDE_DIRS))

ifeq ($(strip $(OUT_DIR)), )
	OBJ_FOLDER =
else
	OBJ_FOLDER = $(strip $(OUT_DIR))/
endif

DEFINES = -D$(DEVICE_TYPE) -DHSE_VALUE=$(HSE_VALUE) $(USE_STDPERIPH_DRIVER)

ifeq ($(RUN_FROM_FLASH), 0)
DEFINES += -DRUN_FROM_FLASH=0 -DVECT_TAB_SRAM
else
DEFINES += -DRUN_FROM_FLASH=1
endif

export DEFINES

#COMPILER_OPTIONS  = -g -ggdb -Os -Wall -fno-strict-aliasing   
# -Wall -- This enables all the warnings about constructions that some users consider questionable, 
# and that are easy to avoid. 
# -Wextra -- This enables some extra warning flags
COMPILER_OPTIONS  = -mcpu=$(CPU) -m$(INSTRUCTION_MODE) -mfpu=vfp -mfloat-abi=soft -O1 -ggdb -g2  -Wall 
COMPILER_OPTIONS += -fno-strict-aliasing -finline -finline-functions-called-once
COMPILER_OPTIONS += -ffunction-sections -fdata-sections -fno-exceptions -fno-delete-null-pointer-checks
# -nostdinc option requires all include dirs to be specified !
COMPILER_OPTIONS += -fmessage-length=0  -nostdinc -fno-builtin -fno-dwarf2-cfi-asm  -fno-common -fmessage-length=0
COMPILER_OPTIONS += -MMD -MP $(DEFINES)  
# Write dependency information @ "./build"; defaults are the same, but here it's explicitly said: 
COMPILER_OPTIONS += -MF build/$(@F).d

DEPEND_OPTS = -MF $(OBJ_FOLDER)$(@F:.o=.d)

# Flags - incl floating point support -mfpu=vfp -std=c99
CFLAGS = $(COMPILER_OPTIONS) $(DEPEND_OPTS) $(INCLUDE_DIRS_F) -std=gnu99 -Wall -c  

CXXFLAGS = $(COMPILER_OPTIONS) $(DEPEND_OPTS) $(INCLUDE_DIRS_F) -std=gnu++98 -c

ASFLAGS = $(COMPILER_OPTIONS) $(INCLUDE_DIRS_F) -c 

# Linker options
# interesting article: http://www.muppetlabs.com/~breadbox/software/tiny/teensy.html
#LD_OPTIONS = -mcpu=$(CPU) -m$(INSTRUCTION_MODE) -Os -T $(LD_SCRIPT) $(INCLUDE_DIRS_F)
LD_OPTIONS = -mcpu=$(CPU) -m$(INSTRUCTION_MODE) -O2 -T $(LD_SCRIPT) $(INCLUDE_DIRS_F) $(LIBRARY_DIRS) 
LD_OPTIONS += -specs=nano.specs  -specs=nosys.specs  
#use this if %f is used, by default it's commented
#LD_OPTIONS += -u _printf_float -u _scanf_float
# -nostartfiles: Do not use the standard system startup files when linking: 
# The standard system libraries are used normally, unless -nostdlib or -nodefaultlibs is used. 
# Note: we don't get linked if we disable stdlib... 
LD_OPTIONS += -Wl,--cref,-Map=$(OBJ_FOLDER)$(TARGET).map,--gc-sections -nostdlib -nodefaultlibs
#,--print-gc-sections - prints what function sections get removed
# -nostdlib leads to _start(); function missing and to program not fit in FLASH region error


OBJCPFLAGS = -O ihex

ARFLAGS = cr

RM = rm -rf

USER_OBJS =
C_SRCS =
S_SRCS =
C_OBJS =
S_OBJS =

# compile all source/object files inside SRC_DIRS
C_SRCS := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
C_OBJS := $(patsubst %.c,$(OBJ_FOLDER)%.o,$(notdir $(C_SRCS)))

CPP_SRCS := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.cpp))
CPP_OBJS := $(patsubst %.cpp,$(OBJ_FOLDER)%.o,$(notdir $(CPP_SRCS)))

S_SRCS := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.s))
S_OBJS := $(patsubst %.s,$(OBJ_FOLDER)%.o,$(notdir $(S_SRCS)))

VPATH := $(SRC_DIRS)

$(OBJ_FOLDER)%.o : %.c
	@echo 'Building file: $(@F)'
	@echo 'Invoking: MCU C Compiler'
	$(CC) $(CFLAGS) $< -o $@
	@echo 'Finished building: $(@F)'
	@echo ' '

$(OBJ_FOLDER)%.o : %.cpp
	@echo 'Building file: $(@F)'
	@echo 'Invoking: MCU C++ Compiler'
	$(CXX) $(CXXFLAGS) $< -o $@
	@echo 'Finished building: $(@F)'
	@echo ' '

$(OBJ_FOLDER)%.o : %.s
	@echo 'Building file: $(@F)'
	@echo 'Invoking: MCU Assembler'
	$(AS) $(ASFLAGS) $< -o $@
	@echo 'Finished building: $(@F)'
	@echo ' '

# call create_outputdir, then $(FWLIB) == src/lib/STM32F10x_StdPeriph_Driver/libstm32fw.a
# I moved print_info on the next row in order to guarantee the correct order of operations:
all: create_outputdir $(FWLIB) $(OBJ_FOLDER)$(TARGET).$(TARGET_EXT) 
	$(MAKE) print_info	

create_outputdir:
	$(shell mkdir $(OBJ_FOLDER) 2>/dev/null)

# Tool invocations
$(OBJ_FOLDER)$(TARGET).$(TARGET_EXT): $(LD_SCRIPT) $(C_OBJS) $(CPP_OBJS) $(S_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Linker $(LD), options:' $(LD_OPTIONS)
	$(LD) $(LD_OPTIONS) $(CPP_OBJS) $(C_OBJS) $(S_OBJS) $(LIBS) -o $(OBJ_FOLDER)$(TARGET).$(TARGET_EXT)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	@echo 'Removing entire out directory'
	$(RM) $(TARGET).$(TARGET_EXT) $(TARGET).bin $(TARGET).map $(OBJ_FOLDER)*.* $(OBJ_FOLDER)
	@echo ' '
# execute the makefiles specified w "clean" parameter: 
# but we commented out it - for faster build times
#	@cd src/lib/STM32F10x_StdPeriph_Driver && $(MAKE) clean
#	@cd src/lib/STM32_USB-FS-Device_Driver && $(MAKE) clean

print_info:
	@echo 'Printing size'
	arm-none-eabi-size --totals $(OBJ_FOLDER)$(TARGET).$(TARGET_EXT)
	arm-none-eabi-objcopy -O srec $(OBJ_FOLDER)$(TARGET).$(TARGET_EXT) $(OBJ_FOLDER)$(TARGET).s19
# we use -j to set the sections it must preserve https://answers.launchpad.net/gcc-arm-embedded/+question/261132
# it seems that (NOLOAD) for .bss solved the 512M .bin problem
#	arm-none-eabi-objcopy  -j .isr_vector -j .text -j .flash_protect -O binary -v $(OBJ_FOLDER)$(TARGET).$(TARGET_EXT) $(OBJ_FOLDER)$(TARGET).bin
	arm-none-eabi-objcopy -O binary -v $(OBJ_FOLDER)$(TARGET).$(TARGET_EXT) $(OBJ_FOLDER)$(TARGET).bin
	arm-none-eabi-objdump -D $(OBJ_FOLDER)$(TARGET).$(TARGET_EXT) > $(OBJ_FOLDER)$(TARGET).lst
	arm-none-eabi-nm $(OBJ_FOLDER)$(TARGET).$(TARGET_EXT) > $(OBJ_FOLDER)$(TARGET)-symbol-table.txt
	@echo ' '
#	@echo 'Printing allocation table:'
#	arm-none-eabi-nm  $(OBJ_FOLDER)$(TARGET).$(TARGET_EXT)

.PHONY: all clean print_info

# fwlib

.PHONY: fwlib
fwlib: $(FWLIB)

$(FWLIB): $(wildcard src/lib/STM32F10x_StdPeriph_Driver/*.h)\
 $(wildcard src/lib/STM32F10x_StdPeriph_Driver/inc/*.h)\
 $(wildcard src/lib/common/*.h)
	@cd src/lib/STM32F10x_StdPeriph_Driver && $(MAKE)

# usblib

.PHONY: usblib
usblib: $(USBLIB)

$(USBLIB): $(wildcard src/lib/STM32_USB-FS-Device_Driver/inc*.h)
	@cd src/lib/STM32_USB-FS-Device_Driver && $(MAKE)

