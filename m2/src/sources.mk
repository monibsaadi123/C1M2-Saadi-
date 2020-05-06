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

# Add your Source files to this variable
SOURCES = interrupts_msp432p401r_gcc.c startup_msp432p401r_gcc.c system_msp432p401r.c main.c memory.c
# Add your include paths to this variable
INCLUDES = -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2/include/common -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2 -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2/include/msp432 -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2/include/CMSIS -I/home/ecee/MonibSaadi_Coursera_ES_C1_A2/m2 

