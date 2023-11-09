module control_unit(
 input [6:0]op,
 input [2:0]funct3,
 input funct7,
 input Zero_flag,
 output PCsrc,
 output [1:0]ResultSrc,
 output MemWrite,
 output ALUsrc,
 output [1:0]ImmSrc,
 output RegWrite,
 output [2:0]ALU_control
 );
 wire Branch, Jump;
 wire [1:0]ALUop;

 main_dec dec1(.op(op),.branch(Branch),.ResultSrc(ResultSrc),.MemWrite(MemWrite),
 .ALUsrc(ALUsrc),.ImmSrc(ImmSrc),.RegWrite(RegWrite),.ALUop(ALUop),.Jump(Jump));

 AlU_dec dec2(.ALUop(ALUop),.funct3(funct3),
 .funct7(funct7),.op5(op[5]),.ALU_control(ALU_control));

 assign PCsrc = (Zero_flag & Branch)| Jump;
 
endmodule


module control_unit_tb();
 reg [6:0]op;
 reg[2:0]funct3;
 reg funct7;
 wire [1:0]ResultSrc;
 wire MemWrite;
 wire ALUSrc;
 wire [1:0]ImmSrc;
 wire RegWrite;
 wire [2:0]ALU_control;


 control_unit con1(.op(op), .funct3(funct3), .funct7(funct7), .ResultSrc(ResultSrc), .MemWrite(MemWrite),
 .ALUSrc(ALUSrc), .ImmSrc(ImmSrc), .RegWrite(RegWrite), .ALU_control(ALU_control));


 initial
  begin
    op = 7'b0000011;  //alu control =000
   #10 op = 7'b0100011;  ////alu control =000
   #10 op = 7'b0110011; funct3 = 3'b000; funct7 = 1'b0; //alu control =000
   #10 op = 7'b0110011; funct3 = 3'b000; funct7 = 1'b1;//alu control =001
   #10 op = 7'b0110011; funct3 = 3'b010; funct7 = 1'bx;//alu control =101
   #10 op = 7'b0110011; funct3 = 3'b110; funct7 = 1'bx;//alu control =011
   #10 op = 7'b0110011; funct3 = 3'b111; funct7 = 1'bx;//alu control =010
   #10 op = 7'b1100011;  //alu control =001
   #10 op = 7'b0010011; //alu control =xxx
   #10 op = 7'b1101111; //alu control =xxx
  end
endmodule
