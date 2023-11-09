module reg_file(
 input clk, we3,
 input [4:0]A1,
 input [4:0]A2,
 input [4:0]A3,
 input [31:0]wd3,
 output [31:0]Rd1, Rd2
 );
 
 reg [31:0] memory[31:0];
 
 always @(posedge clk)
   if(we3)
    memory[A3] <= wd3;
 
 assign Rd1 = (A1 != 0)? memory[A1] : 32'd0;
 assign Rd2 = (A2 != 0)? memory[A2] : 32'd0;


endmodule
