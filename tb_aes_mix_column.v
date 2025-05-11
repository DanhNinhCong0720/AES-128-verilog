`timescale 1ns/1ps
module tb_aes_mix_column ();
  reg [31:0]mixcolumn_in;
  wire [31:0]mixcolumn_out;
  
// initial input

initial 
  begin
      mixcolumn_in = 32'h876e46a6;
    #10;
      mixcolumn_in = 32'hdb135345;
    #10;
      mixcolumn_in = 32'hf20a225c;
    #10;
      mixcolumn_in = 32'h01010101;
    #10;
      mixcolumn_in = 32'hc6c6c6c6;
    #10;
      mixcolumn_in = 32'hd4d4d4d5;
      
      
      #100 $finish;
  end
  
  aes_mixcolumn
  aes_mixcolumn (
  .mixcolumn_in(mixcolumn_in),
  .mixcolumn_out(mixcolumn_out)
  );
  
endmodule 
