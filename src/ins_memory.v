module ins_memory(
 input [31:0]A,
 output [31:0]Rd
 );
 reg [31:0] memory[255:0];
 
 initial
  begin 
  memory[0] = 32'h000500113;
  memory[4] = 32'h00c00193;
  memory[8] = 32'hff718393;
  memory[12] = 32'h0023e233;
  memory[16] = 32'h0041f2b3;
  memory[20] = 32'h004282b3;
  memory[24] = 32'h02728663;
  memory[28] = 32'h0041a233;
  memory[32] = 32'h00020463 ;
  memory[36] = 32'h00000293;
  memory[40] = 32'h0023a233;
  memory[44] = 32'h005203b3 ;
  memory[48] = 32'h402383b3 ;
  memory[52] = 32'h0471a223 ;
  memory[56] = 32'h05002103 ;
  memory[60] = 32'h008001ef;
  memory[64] = 32'h00100113;
  memory[68] = 32'h00310133;
  memory[72] = 32'h04202a23;
 //$readmemh("memfile.txt",memory); 
 end

 assign Rd = memory[A];
endmodule
