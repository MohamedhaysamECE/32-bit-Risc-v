module flip_flop1(
 input clk,reset, 
 input [31:0]d,
 output reg [31:0]q
 );
 
 always @(posedge clk, posedge reset)
  begin
   if(reset)
    q <= 0;
   else
    q <= d;
  end
 initial
  q = 32'd0;

endmodule
