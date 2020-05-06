#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material. 
#
#*****************************************************************************

#------------------------------------------------------------------------------
# <Put a Description Here>
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#      <Put a description of the supported targets here>
## Platform Overrides:
#      <Put a description of the supported Overrides here
#
#------------------------------------------------------------------------------
INCLUDES = -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2/include/common -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2 -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2/include/msp432 -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2/include/CMSIS -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2
ifeq ($(PLATFORM),MSP432)
# Platform Overrides
SOURCES = interrupts_msp432p401r_gcc.c startup_msp432p401r_gcc.c system_msp432p401r.c main.c memory.c
OBJS=$(SOURCES:.c=.o)
PLATFORM = MSP432

# Architectures Specific Flags
LINKER_FILE = msp432p401r.lds
CPU = cortex-m4
ARCH = armv7e-m
SPECS = nosys.specs
thumb1 = thumb
abif = hard
puf = fpv4-sp-d16

# Compiler Flags and Defines
CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
TARGET = c1m2
LDFLAGS = -Wl,-Map=$(TARGET).map -T $(LINKER_FILE)
CFLAGS = -mcpu=$(CPU) -m$(thumb1) -march=$(ARCH) -mfloat-abi=$(abif) -mfpu=$(puf) --specs=$(SPECS) -Wall -Werror -g -O0 -std=c99
CPPFLAGs = -MD
endif
ifeq ($(PLATFORM),HOST)
INCLUDES = -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2/include/common -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2 -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2/include/msp432 -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2/include/CMSIS -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2
SOURCES = main.c memory.c
OBJS=$(SOURCES:.c=.o)
PLATFORM = HOST
TARGET = c1m2
CC = gcc
LDFLAGS = -Wl,-Map=$(TARGET).map
CFLAGS = -Wall -Werror -g -O0 -std=c99
CPPFLAGS = -MD
endif
%.i : %.c
	$(CC) $(CFLAGS) $< $(CPPFLAGS) -E -o $@ $(INCLUDES) -D$(PLATFORM)
%.asm : %.c
	$(CC) $(CFLAGS) $< $(CPPFLAGS) -S -o $@ $(INCLUDES) -D$(PLATFORM)
%.o : %.c
	$(CC)  $(CFLAGS) $< $(CPPFLAGS) -c -o $@ $(INCLUDES) -D$(PLATFORM)
.PHONY: compile-all
compile-all: %.o
%.o: $(SOURCES)
	$(CC) $(SOURCES) $(CFLAGS) $(CPPFLAGs) -c $< $(INCLUDES) -D$(PLATFORM)
.PHONY: build
build: $(TARGET).out
$(TARGET).out: $(OBJS)
	$(CC) $(OBJS) $(CFLAGS) $(LDFLAGS) -o $@ $(INCLUDES) -D$(PLATFORM)
.PHONY: clean
clean:
	rm -f *.o *.d *.asm *.i c1m2.out c1m2.map

