 iverilog -o Topmodule.vvp  ./src/defines.v ./tb/Top_tb.v ./src/Top.v ./src/mem_reg_library.v  ./src/decoder.v ./src/ALU.v 
 vvp Topmodule.vvp
 gtkwave waveform.vcd