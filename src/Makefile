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
include sources.mk

#Platform Overrides
PLATFORM = $(shell PLATFORM)

#Linker File Provided
LINKER_FILE = ../msp432p401r.lds

# Specific Flags for Arcitectures
CPU = cortex-m4
ARCH = armv7e-m
SPECS= nosys.specs

#Defined Targets
TARGET = c1m2
TARGET_OUT = $(TARGET).out
TARGET_MAP = $(TARGET).map

#Architecture specific flags
ifeq ($(PLATFORM),MSP432)
	SRCS = $(SOURCES) interrupts_msp432p401r_gcc.c startup_msp432p401r_gcc.c system_msp432p401r.c 

# Architectures Specific Flags
	thumb1 = thumb
	abif = hard
	puf = fpv4-sp-d16

# Compiler Flags and Defines
	CC = arm-none-eabi-gcc
	LD = arm-none-eabi-ld
	LDFLAGS = $(INCLUDES:-I:-L) -Wl,-Map=$(TARGET_MAP) -T $(LINKER_FILE)
	CFLAGS = -mcpu=$(CPU) -m$(thumb1) -march=$(ARCH) -mfloat-abi=$(abif) -mfpu=$(puf) --specs=$(SPECS) -Wall -Werror -g -O0 -std=c99 $(INCLUDES) -D$(PLATFORM)
	CPPFLAGs = $(CFLAGS)
	SIZE_CMD = arm-none-eabi-size
	OBJDUMP_CMD = arm-none-eabi-objdump

else
	CC = gcc
	LD =ld
	LDFLAGS = $(INCLUDES:-I:-L) -Wl,-Map=$(TARGET_MAP) 
	CFLAGS = -Wall -Werror -g -O0 -std=c99 $(INCLUDES) -D$(PLATFORM)
	CPPFLAGS = $(CFLAGS)
	SRCS = $(SOURCES)
	SIZE_CMD = size
	OBJDUMP_CMD = objdump
endif

OBJS = $(SRCS:.c=.o)
#MAIN MACROS for compiling and building
%.i: %.c
	$(CC) $(CFLAGS) -E $< -o $@
%.asm: %.c
	$(CC) $(CFLAGS) -S $< -o $@
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

#PHONY MACROS
#Make objdump File
.PHONY: objdump
objdump: $(OBJDUMP_FILE)
	$(OBJDUMP_CMD) -S $<
#Copile-all without linking
.PHONY: compile-all
compile-all:
	for i in $(SRCS:.c=); do\
		$(CC) $(CFLAGS) -c $$i.c -o $$i.o;\
	done
#Dependencies
.PHONY: dep-all
dep-all:
	for i in $(SRCS:.c=); do\
		$(CC) $(CFLAGS) -M -MF $$i.d $$i.c;\
	done
#Build All
.PHONY: build
build: all
.PHONY: all
all: dep-all compile-all $(TARGET_OUT)

$(TARGET_OUT): $(OBJS)
	$(CC) $^ $(CFLAGS) $(LDFLAGS) -o $@
.PHONY: clean
clean:
	rm -f $(OBJS) $(SRCS:.c=.i) $(SRCS:.c=.asm) $(SRCS:.c=.d) $(TARGET_OUT) $(TARGET_MAP)

.PHONY: size
size: $(TARGET_OUT)
	$(SIZE_CMD) -Atd $<

