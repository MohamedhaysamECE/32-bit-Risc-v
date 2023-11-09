module mux2(
 input [1:0]sel,
 input [31:0]A, B, C,
 output reg [31:0]Y
 );
 
 always @(*)
  begin 
   case(sel)
    2'b00: Y = A;
    2'b01: Y = B;
    2'b10: Y = C;
    2'b11: Y = 32'd0;
   endcase
  end

endmodule

/*module mux2_tb();
 reg [1:0]sel;
 reg [31:0]A, B, C;
 wire [31:0]Y;
 mux2 m1(.sel(sel),.A(A), .B(B), .C(C),.Y(Y));
 initial 
  begin 
   A=32'd20;
   B=32'd30;
   C=32'd40;
   sel = 2'b00;
   #10 sel = 2'b01;
   #10 sel = 2'b10;
   #10 sel = 2'b11;

  end
endmodule*/
