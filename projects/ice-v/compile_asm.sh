#!/bin/bash

# Based on FemtoRV compile scripts https://github.com/BrunoLevy/learn-fpga/tree/master/FemtoRV

./risc-v/bin/riscv64-unknown-elf-as.exe -march=rv32i -mabi=ilp32 -o build/code.o $1

./risc-v/bin/riscv64-unknown-elf-ld.exe -m elf32lriscv -b elf32-littleriscv -Tconfig_asm.ld --no-relax -o build/code.elf build/code.o

./risc-v/bin/riscv64-unknown-elf-objcopy.exe -O verilog build/code.elf build/code.hex

./risc-v/bin/riscv64-unknown-elf-objcopy.exe -O binary build/code.elf build/code.bin
./risc-v/bin/riscv64-unknown-elf-objdump.exe -D -b binary -m riscv build/code.bin 