//-------------------------------------------------------------------------------------------------
//  File name	  : testbench_aes.v
//  Project		   : AES128
//  Author		    : Do Quang Huy & Nguyen Minh Duc
//  Description	: Test Bench AES
//  Referents	  : none.
//-------------------------------------------------------------------------------------------------
`timescale 1ns/1ps
module tb_aes_de_core();

//---------------------------------------------------------------------------------------------
//  Registers
//---------------------------------------------------------------------------------------------

reg 		clk;
reg  	reset_n;
reg 		start_in;
reg   en_or_de;
reg   [127:0]	key_in;
reg   [127:0] 	cipher_text_in;
reg   [127:0] result [0:2999];

//---------------------------------------------------------------------------------------------
// 	Wire
//---------------------------------------------------------------------------------------------  

wire [127:0] plain_text_out;
wire plain_text_ready_out_w;

//---------------------------------------------------------------------------------------------
//  Architecture:   Read input from file
//---------------------------------------------------------------------------------------------
initial
  begin 
    $readmemh("F:/study/Project_2/AES_128_ModelSim/result.txt",result);
  end
//---------------------------------------------------------------------------------------------
//  Architecture:   Controlling to input
//---------------------------------------------------------------------------------------------
integer i;
initial
	begin
	  for(i=0;i<2997;i=i+3)
		  begin
		    clk=0;
		    reset_n=0;
		    en_or_de = 0;
		    #5 reset_n=1;
        #20;
		      key_in = result[i];	 
		      cipher_text_in = result[i+2];
 		      start_in = 1;
 		    #20 start_in = 0;
        #4000
      //$display(" key_in = %h ",key_in_reg);
      //$display(" cipher_text = %h ",cipher_text_in);
      //$display(" plain_text_expect = %h", result[i+1]);
      //$display(" plain_text =  %h ",plain_text_out);
      $display("--------------------------------");
     $display(" key_in = %h ",key_in);
     $display(" cipher_text = %h ",cipher_text_in);
     $display(" plain_text_expect = %h", result[i+1]);
    if(plain_text_out == result[i+1])
      begin
        $display(" plain_text_out = plain_text_expect = %h ",plain_text_out);
        $display("---plain_text_out is correct---");
        
      end
    else
      begin
        $display(" plain_text_out <> plain_text_expect ");
        $display("---plain_text_out is incorrect---");
      end
      end
      #3000;   
	end	
always 
#10  clk =  ~ clk; 

aes_core 
aes_core(
	.clk(clk),
 	.reset_n(reset_n), 
	.start_in(start_in),
	.en_or_de(en_or_de),
 	.key_in(key_in),
	.plain_text_in(cipher_text_in),
 	.cipher_text_out(plain_text_out),
	.cipher_text_ready_out(plain_text_ready_out)
);

endmodule