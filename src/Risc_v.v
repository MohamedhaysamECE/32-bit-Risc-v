module Risc_v(
 input clk,reset, 
 input [31:0]instr, ReadData,
 output [31:0]PC,
 output [31:0]ALU_result, WriteData,
 output MemWrite
 );


 wire PCsrc;
 wire RegWrite, ALUsrc;
 wire [1:0]ImmSrc, ResultSrc;
 wire [2:0]ALU_control;
 wire Zero_flag;


////////////////  < control unit > //////////////////


 control_unit con1(.op(instr[6:0]), .funct3(instr[14:12]), .funct7(instr[30]), .Zero_flag(Zero_flag), .PCsrc(PCsrc),
 .ResultSrc(ResultSrc), .MemWrite(MemWrite), .ALUsrc(ALUsrc), .ImmSrc(ImmSrc), .RegWrite(RegWrite), .ALU_control(ALU_control));

////////////////  < data path > //////////////////

 Data_path D1( .clk(clk),.reset(reset),
 .PCsrc(PCsrc), .ResultSrc(ResultSrc), .RegWrite(RegWrite), .ALUsrc(ALUsrc), .ImmSrc(ImmSrc), .ALU_control(ALU_control),
 .instr(instr), .ReadData(ReadData), .PC(PC), .ALU_result(ALU_result), .WriteData(WriteData), .Zero_flag(Zero_flag));

 endmodule 
