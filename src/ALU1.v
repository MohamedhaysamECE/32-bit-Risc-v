module ALU1(
 input [31:0]srcA, srcB,
 input [2:0]ALU_control,
 output reg [31:0]ALU_result,
 output Zero_flag
 );

 always @(*)
  begin 
   case(ALU_control)
   3'b000: ALU_result = srcA + srcB;
   3'b001: ALU_result = srcA - srcB;
   3'b010: ALU_result = srcA & srcB;
   3'b011: ALU_result = srcA | srcB;
   3'b101: begin 
            if(srcA < srcB)
             ALU_result = 1;
            else
             ALU_result = 0;
           end
   default: ALU_result = 32'd0;
   endcase 
  end
 assign Zero_flag = (ALU_result == 0)? 32'd1:32'd0;
endmodule
