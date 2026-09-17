# Memory and Common Bus

## Shared 8-bit bus

The CPU uses one common 8-bit bus for both data and address transfers.

There are not separate permanent address and data buses. The same bus is reused at different points in the instruction cycle.

Only one source is allowed to drive the bus at a time.

## Program Counter to RAM

The normal memory-address path is:

```text
Program Counter
      |
      v
Common Bus
      |
      v
Memory Address Register
      |
      v
RAM address input
```

The RAM returns data on the same common bus.

```text
RAM data output
      |
      v
Common Bus
      |
      +----> Instruction Register
      |
      +----> A/B/C registers
      |
      +----> other destinations
```

## RAM

The active program memory in the current setup is a 256-byte RAM.

```text
Address width : 8 bits
Memory size   : 256 bytes
Address range : 00H - FFH
Data width    : 8 bits
```

The program is loaded into RAM and executed from there.

## Memory-addressed instructions

`LDA`, `STA` and `JMP` need a specific 8-bit address. The processor therefore uses the MAR as the register that holds the address used by RAM.

Because the RAM needs time to react to an address change in the Logisim implementation, an empty wait cycle is inserted where required.

## ROM

A ROM block is also present in the hardware schematic. The current program-execution setup described for this repository uses RAM for the program. The exact role of the ROM can be documented separately if the design is extended later.
