# riscv_CPU
Use Verilog to implement a riscv CPU, from single cycle to pipeline.
## Single cycle diagram:
![riscv_CPU](docs/singlecycle.png)
## Dependency
iverilog: https://bleyer.org/icarus/
riscv-gnu-toolchain: https://github.com/riscv-collab/riscv-gnu-toolchain
## Getting started
Open tb/Top_tb.v and change the line:

$readmemh("./Sim/asm2hex/build/Function_you_want.hex", CPU.IMEM.Mem);

The simulation hexadecimal instruction input file is in: 

Sim/asm2hex/build/

Run:
```
source run_script.sh
```
This command will use icarus verilog to compile and simulate the files.

