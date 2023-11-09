module Top_module_tb();
 
 reg clk,reset;
 wire [31:0]dataadr,WriteData;
 wire MemWrite;

 Top_module T1( .clk(clk),.reset(reset) ,.dataadr(dataadr), .WriteData(WriteData), .MemWrite(MemWrite));
 
 initial
  begin
   reset = 1; #5;
   reset = 0;
  end 

 always
  begin
   clk = 0; #5;
   clk = 1; #5;
  end
 /*instruction memory contents
 machine code   the assimbly code
 00500113       addi x2, x0, 5
 00c00193       addi x3, x0,12
 ff718393       addi x7, x3, -9
 0023e233       or x4, x7, x2
 0041f2b3       and x5, x3, x4
 004282b3       add x5, x5, x4
 02728663       beq x5, x7, end
 0041a233       slt x4, x3, x4
 00020463       beq x4, x0, around
 00000293       addi x5, x0, 0
 0023a233       around: slt x4, x7, x2
 005203b3       add x7, x4, x5
 402383b3       sub x7, x7, x2
 0471a223       sw x7, 68(x3)
 05002103       lw x2, 80(x0)
 008001ef       jal x3, end
 00100113       addi x2, x0, 1
 00310133       end: add x2, x2, x3
 04202a23       sw x2, 84(x0)*/

endmodule
