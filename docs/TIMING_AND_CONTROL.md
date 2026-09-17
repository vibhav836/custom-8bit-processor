# Timing and Control

## Fixed 9-cycle instruction timing

Every instruction in the current processor takes 9 clock cycles.

The control unit and microcode counter step through these cycles and generate the required bus and register control signals.

## Common fetch cycles

| Clock | Control action | Description |
|---|---|---|
| C1 | `PC OUT`, `MAR IN` | Current PC value is placed on the common bus and captured by MAR |
| C2 | No data transfer | Wait cycle for the Logisim RAM to respond to the new address |
| C3 | `RAM OUT`, `IR IN` | The instruction byte is placed on the bus and captured by IR |
| C4-C9 | Instruction dependent | Execution of the decoded instruction |

### Why is C2 empty?

The empty cycle is a practical timing requirement of the Logisim memory model used in this implementation. Whenever RAM has to respond to a newly selected address, the design gives it a wait cycle before reading the memory output.

This same idea applies to other operations that require RAM to move to a specific address.

## Program Counter behavior

The PC is not continuously incremented while an instruction is being executed. The processor holds the PC during the instruction sequence and handles its update through the control logic after the relevant instruction cycles are complete.

For `LDA`, `STA` and `JMP`, the address is handled through the MAR during execution rather than immediately changing the PC during the early part of the instruction.

The important point is that the PC is not changed halfway through the fetch process.

## Micro-operation model

A simplified instruction sequence is:

```text
C1  PC -> MAR
C2  WAIT
C3  RAM -> IR
C4  instruction step
C5  instruction step
C6  instruction step
C7  instruction step
C8  instruction step
C9  instruction step / finish
```

The exact signals in C4-C9 depend on the instruction.

## Example: logical instruction

A register ALU operation can be thought of as:

```text
Fetch instruction
      |
      v
Decode opcode
      |
      v
Select B or C
      |
      v
ALU performs operation with A
      |
      v
Store result back in A
```

The real Logisim design implements these steps using the control signals visible in the control unit and ALU schematics.

## Control philosophy

The processor is deliberately built around explicit control signals. Instead of a single hidden instruction-execution block, the design exposes the individual enables needed to put a register on the bus, capture the bus, select an ALU operation and control memory access.
