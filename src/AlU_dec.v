module AlU_dec(
 input [1:0]ALUop,
 input [2:0]funct3,
 input funct7,
 input op5,
 output reg [2:0]ALU_control
 );
 wire [6:0]in;
 assign in = {ALUop,funct3,op5,funct7};
 
 always @(*)
  begin 
   casex(in)
    7'b00xxxxx: ALU_control = 3'b000;
    7'b01xxxxx: ALU_control = 3'b001;
    7'b1000000: ALU_control = 3'b000;
    7'b1000001: ALU_control = 3'b000;
    7'b1000010: ALU_control = 3'b000;
    7'b1000011: ALU_control = 3'b001;
    7'b10010xx: ALU_control = 3'b101;
    7'b10110xx: ALU_control = 3'b011;
    7'b10111xx: ALU_control = 3'b010;
    default: ALU_control = 3'bxxx;
   endcase
  end 
 
endmodule
