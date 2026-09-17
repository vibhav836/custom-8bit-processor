# Fibonacci machine-code listing

The following listing matches `programs/fibonacci.asm`.

| Address | Bytes | Assembly |
|---:|---|---|
| `00H` | `AB 00` | `MVI A,00H` |
| `02H` | `03` | `MOV B,A` |
| `03H` | `AB 01` | `MVI A,01H` |
| `05H` | `05` | `MOV C,A` |
| `06H` | `01` | `MOV A,B` |
| `07H` | `9F` | `ADD C` |
| `08H` | `ED 0F` | `JC 0FH` |
| `0AH` | `04` | `MOV B,C` |
| `0BH` | `05` | `MOV C,A` |
| `0CH` | `F0` | `OUT` |
| `0DH` | `EF 06` | `JMP 06H` |
| `0FH` | `BF` | `HLT` |

Machine-code byte stream:

```text
AB 00 03 AB 01 05 01 9F ED 0F 04 05 F0 EF 06 BF
```
