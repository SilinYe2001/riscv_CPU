module Top_tb;
   reg clk, rst;
   reg exit;
   wire halt;
   

   // Single Cycle CPU instantiation
   SingleCycleCPU CPU (halt, clk,rst);

   // Clock Period = 10 time units
   always
     #5 clk = ~clk;

   always @(posedge clk)
     if (halt)
       exit = 1;
   
   initial begin
      $dumpfile("waveform.vcd");
      $dumpvars(0, Top_tb);

      // Clock and reset steup
      #0 rst = 1; clk = 0; exit =0;
      #0 rst = 0;
      #0 rst = 1;

      // Load program
      #0 $readmemh("lui_auipc_mem.hex", CPU.IMEM.Mem);  // insrtuction memory input
     //#0 $readmemh("mem_in.hex", CPU.DMEM.Mem);  // data memory input
      //#0 $readmemh("regs_in.hex", CPU.RF.Mem);  //register file input 

      // Feel free to modify to inspect whatever you want
      #0 $monitor($time,, "PC=%08x IR=%08x halt=%x exit=%x", CPU.PC, CPU.InstWord, halt, exit);

      // Exit???
      wait(exit);
      
      // Dump registers
      #0 $writememh("regs_out.hex", CPU.RF.Mem);

      // Dump memory
      #0 $writememh("mem_out.hex", CPU.DMEM.Mem);

      $finish;      
   end
   

endmodule // tb

