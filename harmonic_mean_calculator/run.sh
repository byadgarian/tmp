#!/bin/bash

#Program Name: Harmonic Mean
#Student Name: Brian Y
#Student E-mail: ***

#Delete unused files if present
rm *.o
rm *.out

echo "Compile main.c using the gcc compiler standard 2011..."
gcc -g -c -m64 -Wall -no-pie -o main.o main.c -std=c11

echo "Assemble control.asm..."
nasm -dwarf -f elf64 -o control.o control.asm

echo "Compile isfloat.cpp using the g++ compiler standard 2017..."
g++ -c -m64 -Wall -fno-pie -no-pie -o isfloat.o isfloat.cpp -std=c++17

echo "Assemble fill.asm..."
nasm -dwarf -f elf64 -o fill.o fill.asm

echo "Compile display.cpp using the g++ compiler standard 2017..."
g++ -g -c -m64 -Wall -fno-pie -no-pie -o display.o display.cpp -std=c++17

echo "Assemble harmonic.asm..."
nasm -dwarf -f elf64 -o harmonic.o harmonic.asm

echo "Link the object files using the g++ linker standard 2017..."
g++ -g -m64 -fno-pie -no-pie -o output.out -std=c++17 main.o control.o isfloat.o fill.o display.o harmonic.o

echo "Run the program..."
#gdb ./output.out
./output.out

echo "The program will terminate..."