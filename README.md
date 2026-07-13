# tetris-cpu

A custom **32-bit CPU implementing the MIT Beta ISA**, built on an FPGA to run a game of Tetris. This repository contains the **hardware** half of the project: the processor, VGA display controller, and memory system, written in Verilog/Lucid.

> **This is 1 of 2 repositories.** The Tetris game itself is written in Beta assembly and lives in a separate repo:
> **➡️ [niclukman/tetris_asm](https://github.com/niclukman/tetris_asm)** — the assembly source that runs *on* this CPU.
>
> You need both halves for the full project: this repo builds the machine, the other repo is the program it runs.

## Overview

This is a from-scratch implementation of the [MIT Beta](https://en.wikipedia.org/wiki/Beta_(instruction_set_architecture)) — a 32-bit RISC instruction set — synthesized onto an FPGA and extended with a VGA output path so it can render Tetris in real time.

Key characteristics:

- **32-bit Beta ISA** CPU implemented in hardware
- Runs at a **25 MHz** clock
- **640×480 VGA output** at a **60 Hz** refresh rate
- **Time-domain multiplexing** of the memory bus so the CPU and the VGA display controller can both access shared memory without contention — the CPU executes game logic while the display reads the framebuffer, interleaved within each cycle window

## Repository structure

| Path | Description |
|------|-------------|
| `source/` | Verilog/Lucid source for the CPU, VGA controller, and supporting modules |
| `constraint/` | FPGA pin and I/O constraints |
| `timing.xdc` | Xilinx timing constraints (clock definitions, timing closure) |
| `beta.alp` | Alchitry Labs V2 project file |

## Toolchain

- **[Alchitry Labs V2](https://alchitry.com/)** for building and flashing
- **Xilinx Vivado** (invoked by Alchitry Labs) for synthesis and place-and-route
- **Target board:** Alchitry Au (Xilinx Artix-7)

## Loading the game

The CPU runs the program from **[niclukman/tetris_asm](https://github.com/niclukman/tetris_asm)**, assembled with the [natalieagus/beta-assembler](https://github.com/natalieagus/beta-assembler). That produces two hex files — `tetris.hex` (instruction memory) and `tetris_data.hex` (data memory). These are loaded into this design's instruction and data memory via `$readmemh`.


## Related

- **Game / software:** [niclukman/tetris_asm](https://github.com/niclukman/tetris_asm)
