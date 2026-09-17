# Assembly Programming Guide

The processor uses a small custom assembly language built around the A, B and C registers.

## Registers

```text
A  Accumulator
B  General-purpose register
C  General-purpose register
```

## Immediate values

`MVI A,imm` places an 8-bit value directly into A.

```asm
MVI A,00H
MVI A,25H
MVI A,FFH
```

## Register movement

```asm
MOV A,B
MOV A,C
MOV B,A
MOV B,C
MOV C,A
MOV C,B
```

## Arithmetic

```asm
ADD B
ADD C
SUB B
SUB C
```

The accumulator is used as the main ALU destination.

## Logical operations

```asm
AND A,B
AND A,C
ORA A,B
ORA A,C
XOR A,B
XOR A,C
```

## Memory

```asm
LDA 20H
STA 20H
```

The processor uses 8-bit memory addresses, so valid addresses are `00H` through `FFH`.

## Branches

```asm
JMP 20H
JZ  20H
JNZ 20H
JC  20H
```

## Output and halt

```asm
OUT
HLT
```

`OUT` is opcode `F0H` and is used to send the current result to the output section.

## Example: Fibonacci

A useful pattern is to keep the current two Fibonacci values in B and C, use A for the addition, and output the result after updating the registers.

```asm
MVI A,00H
MOV B,A
MVI A,01H
MOV C,A

LOOP:
    MOV A,B
    ADD C
    JC END
    MOV B,C
    MOV C,A
    OUT
    JMP LOOP

END:
    HLT
```
