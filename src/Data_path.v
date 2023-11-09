module Data_path(
 input clk,reset,
 input PCsrc,
 input RegWrite, ALUsrc,
 input [1:0]ImmSrc,ResultSrc,
 input [2:0]ALU_control,
 input [31:0]instr, ReadData,
 output [31:0]PC,
 output [31:0]ALU_result, WriteData,
 output Zero_flag
 );
 
 wire [31:0]srcA, srcB, PCNext,PCPlus4;
 wire [31:0]PCTarget, ImmExt, Result;

////////////////  < register file > //////////////////

 reg_file reg1(.clk(clk), .we3(RegWrite), .A1(instr[19:15]),.A2(instr[24:20]),.A3(instr[11:7]),
 .wd3(Result), .Rd1(srcA), .Rd2(WriteData));
  
////////////////  < ALU > //////////////////

 ALU1 A1(.srcA(srcA), .srcB(srcB), .ALU_control(ALU_control),
 .ALU_result(ALU_result), .Zero_flag(Zero_flag));

////////////////  < Extend unit> //////////////////

 extend E1(.instr(instr), .ImmScr(ImmSrc), .ImmExt(ImmExt));

 mux1 M1(.sel(ALUsrc), .A(WriteData), .B(ImmExt), .Y(srcB));


 ////////////////  < Pc counter > //////////////////


 flip_flop1 f1(.clk(clk), .reset(reset), .d(PCNext),.q(PC));

 adderplus4 A2(.A(PC), .Y(PCPlus4));

 adder1 A3( .A(PC), .B(ImmExt), .Y(PCTarget));
 
 mux1 M2(.sel(PCsrc), .A(PCPlus4), .B(PCTarget), .Y(PCNext));
 
 mux2 M3(.sel(ResultSrc), .A(ALU_result), .B(ReadData), .C(PCPlus4), .Y(Result));
 


endmodule
