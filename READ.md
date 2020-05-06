This folder contains files to compile a c program for MSP432 microcontroller and a host machine running linux. The two folders, src and inlcude contain necessary files. The src folder contains a MakeFile for build automation. This file contains several gcc commands.
Examples:
make main.i PLATFORM=MSP432
Above command will generate a preprocessed file

make main.asm PLATFORM=HOST
Above command will generate an assembly file for the c program

make main.o PLATFORM=MSP432
ABove command will generate object file

make compile-all PLATFORM=MSP432
above command will generate object files and dependency files for all the c files

make build PLATFORM=HOST
above command will generate .out , .o , .map files for host enviroment
