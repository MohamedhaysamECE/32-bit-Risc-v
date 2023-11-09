module Top_module(
 input clk,reset, 
 output [31:0]dataadr, WriteData,
 output MemWrite
 );
  
 wire [31:0]instr, ReadData;
 wire [31:0]PC;

////////////////  < Risc-V > //////////////////

 Risc_v R1( .clk(clk), .reset(reset), .instr(instr), .ReadData(ReadData),
 .PC(PC), .ALU_result(dataadr), .WriteData(WriteData), .MemWrite(MemWrite));

////////////////  < instruction memory > //////////////////

 ins_memory mem1( .A(PC), .Rd(instr));

////////////////  < data memory > //////////////////

 Data_memory mem2(.clk(clk), .we(MemWrite), .wd(WriteData), .A(dataadr), .Rd(ReadData));

endmodule


 
