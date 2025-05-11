`timescale 1ns/1ps
module tb_aes_inv_mixcolumn ();
  reg [31:0]inv_mixcolumn_in;
  wire [31:0]inv_mixcolumn_out;
  
// initial input

initial 
  begin
      inv_mixcolumn_in = 32'h8e4da1bc;
    #10;
      inv_mixcolumn_in = 32'h00000000;
    #10;
      inv_mixcolumn_in = 32'h4d7ebdf8;
    #10;
      inv_mixcolumn_in = 32'h01010101;
    #10;
      inv_mixcolumn_in = 32'h9fdc589d;
      
      #100 $finish;
  end
  
  aes_inv_mixcolumn
  aes_inv_mixcolumn (
  .inv_mixcolumn_in(inv_mixcolumn_in),
  .inv_mixcolumn_out(inv_mixcolumn_out)
  );
  
endmodule 