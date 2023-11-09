module Data_memory(
 input clk,
 input we,
 input [31:0]wd, A,
 output [31:0]Rd 
 );
 reg [31:0] memory[255:0];
 always @(posedge clk)
  begin 
   if(we)
    memory[A] <= wd;
  end
 assign Rd = memory[A];


endmodule

module Data_memory_tb();
 reg clk,we;
 reg [31:0]wd, A;
 wire [31:0]Rd ;

Data_memory d1(clk,we,wd, A,Rd);

  initial
  begin
   we = 1; #5;
   we = 0;
  end 

 always
  begin
   clk = 0; #5;
   clk = 1; #5;
  end
 initial
 A = 32'd60;

endmodule
