# Instruction Set Reference

This is the instruction set used by the current custom 8-bit processor.

All opcodes are 8 bits. Register-to-register and control instructions are one byte. Instructions that need an immediate value or an 8-bit memory/jump address use a second byte.

## Opcode table

| Mnemonic | Binary opcode | Hex | Operands | Size | Operation |
|---|---|---:|---|---:|---|
| `MOV A,B` | `0000 0001` | `01` | — | 1 | `A <- B` |
| `MOV A,C` | `0000 0010` | `02` | — | 1 | `A <- C` |
| `MOV B,A` | `0000 0011` | `03` | — | 1 | `B <- A` |
| `MOV B,C` | `0000 0100` | `04` | — | 1 | `B <- C` |
| `MOV C,A` | `0000 0101` | `05` | — | 1 | `C <- A` |
| `MOV C,B` | `0000 0110` | `06` | — | 1 | `C <- B` |
| `ADD B` | `1000 1111` | `8F` | — | 1 | `A <- A + B` |
| `ADD C` | `1001 1111` | `9F` | — | 1 | `A <- A + C` |
| `SUB B` | `1100 1111` | `CF` | — | 1 | `A <- A - B` |
| `SUB C` | `1101 1111` | `DF` | — | 1 | `A <- A - C` |
| `XOR A,B` | `1111 1010` | `FA` | — | 1 | `A <- A XOR B` |
| `XOR A,C` | `1111 1001` | `F9` | — | 1 | `A <- A XOR C` |
| `ORA A,B` | `1111 1011` | `FB` | — | 1 | `A <- A OR B` |
| `ORA A,C` | `1111 1100` | `FC` | — | 1 | `A <- A OR C` |
| `AND A,B` | `1111 1101` | `FD` | — | 1 | `A <- A AND B` |
| `AND A,C` | `1111 1110` | `FE` | — | 1 | `A <- A AND C` |
| `MVI A,imm` | `1010 1011` | `AB` | 8-bit immediate | 2 | `A <- immediate` |
| `LDA addr` | `1010 1010` | `AA` | 8-bit address | 2 | `A <- RAM[addr]` |
| `STA addr` | `0101 0101` | `55` | 8-bit address | 2 | `RAM[addr] <- A` |
| `JMP addr` | `1110 1111` | `EF` | 8-bit address | 2 | Jump to `addr` |
| `JZ addr` | `1110 1100` | `EC` | 8-bit address | 2 | Jump if Zero flag is set |
| `JC addr` | `1110 1101` | `ED` | 8-bit address | 2 | Jump if Carry flag is set |
| `JNZ addr` | `1110 1110` | `EE` | 8-bit address | 2 | Jump if Zero flag is not set |
| `OUT` | `1111 0000` | `F0` | — | 1 | Send the current result to the output register/display |
| `HLT` | `1011 1111` | `BF` | — | 1 | Halt execution |

## Register transfers

The CPU has three 8-bit general-purpose registers:

- `A` — accumulator and main ALU register
- `B` — general-purpose register
- `C` — general-purpose register

Examples:

```asm
MOV A,B
MOV B,C
MOV C,A
```

## Arithmetic

Arithmetic instructions use the accumulator as one operand and write the result back to `A`.

```asm
ADD B      ; A = A + B
ADD C      ; A = A + C
SUB B      ; A = A - B
SUB C      ; A = A - C
```

## Logical operations

The logical decoder in the hardware generates separate control signals for the six implemented combinations:

```asm
AND A,B
AND A,C
ORA A,B
ORA A,C
XOR A,B
XOR A,C
```

## Immediate and memory operations

```asm
MVI A,05H      ; Put 05H directly into A
LDA 20H        ; Load A from memory address 20H
STA 20H        ; Store A at memory address 20H
```

Because the processor uses an 8-bit address, the RAM has 256 addressable byte locations.

## Branch instructions

```asm
JMP 20H        ; Unconditional jump
JZ  20H        ; Jump when Zero is set
JNZ 20H        ; Jump when Zero is clear
JC  20H        ; Jump when Carry is set
```

## I/O and halt

```asm
OUT            ; Display/output the current result
HLT            ; Stop the processor
```

## Flags

The hardware exposes three status indicators:

- Carry
- Zero
- Positive

The conditional branch instructions use the relevant status information. The detailed per-instruction flag-update rules can be expanded here as the ISA specification is refined.
