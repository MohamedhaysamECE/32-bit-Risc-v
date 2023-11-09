# 32-bit-Risc-v
A single-cycle processor, also known as a single-cycle CPU or a single-cycle datapath,it is a type of processor design where each instruction is executed in a single clock cycle,all instructions take the same amount of time to execute, regardless of their complexity or the number of operations involved.

## Components 

*State elements (Instruction memory ,data memory ,register file , program counter :These elements include the memories and the architectural state (the program counter and registers))
*Data path 
*Control unit


### Instruction set: 

*R-type instructions: add, sub, and, or, slt

*Memory instructions: Iw, sw

*Branches: beq


### How does it work: 

We divide our microarchitectures into two interacting parts: the data- path and the control unit. The datapath operates on words of data. It contains structures such as memories, registers, ALUS, and multiplexers. We are implementing the 32-bit RISC-V (RV321) architecture, so we use a 32-bit datapath. The control unit receives the current instruction from the datapath and tells the datapath how to execute that instruction.
Specifically, the control unit produces multiplexer select, register enable,and memory write signals to control the operation of the datapath.
