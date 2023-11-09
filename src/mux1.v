module mux1(
 input sel,
 input [31:0]A, B,
 output reg [31:0]Y
 );
 
 always @(*)
  begin 
   case(sel)
    1'b0: Y = A;
    1'b1: Y = B;
   endcase
  end

endmodule
