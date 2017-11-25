# Compile the STM32F10x Standard Peripheral Library

TARGET_ARCH = -mcpu=cortex-m3 -mthumb

# Auto inline: The -finline-functions-called-once switch makes gcc to consider all 
# static functions called once for inlining into their caller even if they are not marked inline.

TARGET_OPTS = -O2 -finline -finline-functions-called-once
WARNINGS = -Wall -W -Wshadow -Wwrite-strings -Winline
INCLUDE_DIRS = -I inc -I ../../CPU_STM32 -I ../CMSIS_CM3 -I .
# http://thiemonagel.de/2010/01/no-strict-aliasing/, http://blog.regehr.org/archives/1307 
# following prevents badly written code from breaking due to C compiler strict-aliasing optimization 
# which may ignore assignment to a variable pointed by different type of pointer when there is not 
# successive read access
F_NO_STRICT_ALIASING = -fno-strict-aliasing

COMPILE_OPTS = $(WARNINGS) $(TARGET_OPTS) $(MESSAGES) $(F_NO_STRICT_ALIASING) $(INCLUDE_DIRS) $(DEFINES)
# The following allow the linker later to optimize out the unused code as per
# http://stackoverflow.com/questions/4274804/query-on-ffunction-section-fdata-sections-options-of-gcc
# when linker called with -Wl,--gc-sections flags: 
COMPILE_OPTS += -ffunction-sections -fdata-sections


CC = arm-none-eabi-gcc
CFLAGS = $(COMPILE_OPTS)

AS = $(CC) -x assembler-with-cpp -c $(TARGET_ARCH)
ASFLAGS = $(COMPILE_OPTS)

AR = arm-none-eabi-ar
ARFLAGS = cr

LIB_OUT = libstm32fw.a

LIB_OBJS = $(sort \
 $(patsubst %.c,%.o,$(wildcard src/*.c)) \
 $(patsubst %.s,%.o,$(wildcard src/*.s)))


.PHONY: all
all: $(LIB_OUT)

$(LIB_OUT): $(LIB_OBJS)
	$(AR) $(ARFLAGS) $@ $(LIB_OBJS)

$(LIB_OBJS): $(wildcard *.h) $(wildcard inc/*.h)

.PHONY: clean
clean:
	-rm -f $(LIB_OBJS) $(LIB_OUT)
