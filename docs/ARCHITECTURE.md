# CPU Architecture

## Overview

This project is an 8-bit processor built in Logisim. The design is made from registers, logic gates, multiplexers, RAM/ROM blocks and control logic instead of relying on a pre-built CPU component.

The processor uses a shared 8-bit bus for both data and addresses. Only one source is allowed to drive the bus at a time. This makes the control unit responsible for carefully sequencing every transfer.

## Main components

### A Register / Accumulator

The A register is the accumulator and the main working register for the ALU. Arithmetic and logical instructions use A as the destination for their result.

### B Register

An 8-bit general-purpose register used as a second working register and ALU operand.

### C Register

An 8-bit general-purpose register used as another working register and ALU operand.

### ALU

The ALU performs the implemented arithmetic and logical operations. It is connected to the A, B and C register datapath and to the flag register.

Implemented ALU operations include:

- Addition with B or C
- Subtraction with B or C
- AND with B or C
- OR with B or C
- XOR with B or C

### Program Counter (PC)

The PC holds the address associated with program execution. The current implementation uses an 8-bit address, giving 256 possible memory locations.

The PC output is routed onto the common bus and can be loaded into the Memory Address Register.

### Memory Address Register (MAR)

The MAR holds the address presented to RAM. During instruction fetch, the current PC value is transferred to the MAR.

### Instruction Register (IR)

The IR holds the instruction fetched from memory while the control unit and instruction decoder determine what has to happen next.

### Instruction Decoder

The instruction decoder converts the instruction opcode into the control conditions needed by the control logic. There are also dedicated decoding sections for logical instructions such as AND, OR and XOR.

### Control Unit

The control unit generates the control signals that move data around the shared bus and enable register loads, ALU operations, memory access and program sequencing.

### Microcode Counter

The microcode counter sequences the control steps of an instruction. The current processor uses a fixed 9-clock instruction cycle.

### Flag Register

The hardware provides three visible status flags:

- Carry
- Zero
- Positive

### Output Register and Displays

The output subsystem includes an output register and a set of displays. The displays are not limited to program output: they also show the current contents of the major processor registers so the internal state can be watched while the CPU is running.

The visible register/status information includes A, B, C, MAR, IR, PC, output data and the status flags.

## Memory organization

The current program execution path uses a 256-byte RAM. With an 8-bit address, the address range is:

```text
00H - FFH
```

The processor design also contains a ROM block in the hardware schematic. The program for the current working setup is loaded into RAM.

## Shared bus

The same physical 8-bit bus is used for both address and data transfers. It is a single common bus rather than separate permanent address and data buses.

Only one source is allowed to drive the bus at a time.

Typical transfers look like:

```text
PC  -> BUS -> MAR
RAM -> BUS -> IR
B   -> BUS -> A
C   -> BUS -> A
A   -> BUS -> B/C
ALU -> BUS -> destination
```

This is also why the control logic has to generate one precise set of enables for each micro-operation.

## Program fetch path

The fetch path is:

```text
PC -> MAR -> RAM -> IR
```

The first three clock cycles are common to instruction fetch:

1. `PC OUT -> MAR IN`
2. Empty/wait cycle
3. `RAM OUT -> IR IN`

The empty second cycle is intentional in this Logisim implementation because the RAM needs a cycle to respond after its address input changes.
