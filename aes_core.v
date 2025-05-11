module aes_core(
	clk,
 	reset_n, 
	start_in,
	en_or_de,
 	key_in,
	plain_text_in,
 	cipher_text_out,
	cipher_text_ready_out
	);

  input wire 		clk;
  input wire 		reset_n;
  input wire 		start_in;
  input wire   en_or_de;
  input wire  [127:0] 	key_in;
  input wire  [127:0] 	plain_text_in;
  output wire [127:0] 	cipher_text_out;
  output wire		cipher_text_ready_out;

  reg     [127:0] 	cipher_text_out_reg;
  reg 			          cipher_text_ready_out_reg;
  reg     [3:0] 	  round_reg;
  reg     [127:0] 	key_in_reg;
  reg     [127:0] 	plain_text_in_reg;
  
  reg     [127:0] 	key_in_reg_de [0:11];
  reg		[127:0] key_in_de;
  reg		[3:0] counter_de;
  
  reg [3:0] counter_round;
  reg       start_key_expand_reg;
  reg [127:0] cipher_in_de;
  reg         de_cipher_text_ready_out_reg;
  reg [127:0] de_cipher_text_out_reg;

  wire 			start_key_expand_w;
  wire 			key_expansion_ready_out_w;
  wire [127:0] 		key_expansion_out_w;
  wire [127:0] 		cipher_text_out_w;
  wire 			cipher_text_ready_out_w;
  wire 			start_encryption_w;
  
  wire    start_decryption_w;
  wire [127:0] 		de_cipher_text_out_w;
  wire 			de_cipher_text_ready_out_w;
  
 //---------------------------------------------------------------------------------------------
//  Architecture:	Controlling key_expander for decrypt
//---------------------------------------------------------------------------------------------
 always @(posedge clk or negedge reset_n)
  begin
    	if (!reset_n )
		begin
		start_key_expand_reg <=0;
		end
  else 
		start_key_expand_reg <= start_key_expand_w;
  end
 
 
 always @(posedge clk or negedge reset_n)
  begin
    	if (!reset_n )
		begin
		counter_de <= 0;
		end
  else if (start_key_expand_reg)
		begin
		key_in_reg_de[counter_de] <= key_in_reg;
		counter_de <= counter_de+1;
		end
  end
  
 always @(posedge clk or negedge reset_n)
	begin
		if (!reset_n )
		begin
		counter_round = 10;
		cipher_in_de <=0;
		de_cipher_text_ready_out_reg <= 0;
	  de_cipher_text_out_reg <= 0;
		end
	else if (counter_round == 0 && de_cipher_text_ready_out_w)
	begin	
		de_cipher_text_out_reg <= de_cipher_text_out_w;
		de_cipher_text_ready_out_reg <= de_cipher_text_ready_out_w;
	end
		
	else if (cipher_text_ready_out_reg)    
		  begin
		    counter_round = 10;
		    cipher_in_de <= plain_text_in;
		    key_in_de <= key_in_reg_de[counter_round];
		    de_cipher_text_out_reg <= 1'b0;
		    de_cipher_text_ready_out_reg <= 1'b0;
		  end
	else if (de_cipher_text_ready_out_w && counter_round > 0)
		begin
		  counter_round = counter_round - 1'b1;
		  key_in_de <= key_in_reg_de[counter_round];
		  cipher_in_de <= de_cipher_text_out_w;
		  de_cipher_text_ready_out_reg <= 0;
		end
		else
		  de_cipher_text_ready_out_reg <= 0;
	end
	   
//---------------------------------------------------------------------------------------------
//  Architecture:   Connecting to decrypt
//---------------------------------------------------------------------------------------------

  aes_decryption aes_de (
	.clk(clk),
  	.reset_n(reset_n), 
	.start_in(start_decryption_w),
	.round_in(counter_round),
  	.key_in(key_in_de),
	.plain_text_in(cipher_in_de),
  	.cipher_text_out(de_cipher_text_out_w),
	.cipher_text_ready_out(de_cipher_text_ready_out_w)
  );
  
//---------------------------------------------------------------------------------------------
//  Architecture:   Connecting to encrypt
//---------------------------------------------------------------------------------------------

  aes_encryption aes_en(
	.clk(clk),
  	.reset_n(reset_n), 
	.start_in(start_encryption_w),
	.round_in(round_reg),
  	.key_in(key_in_reg),
	.plain_text_in(plain_text_in_reg),
  	.cipher_text_out(cipher_text_out_w),
	.cipher_text_ready_out(cipher_text_ready_out_w)
  );

//---------------------------------------------------------------------------------------------
//  Architecture:   Connecting to key expander
//---------------------------------------------------------------------------------------------

  aes_key_expansion 
  key_expander
  (
	.clk(clk),
  	.reset_n(reset_n), 
	.start_in(start_key_expand_w),
	.rcon_in(round_reg),
  	.key_in(key_in_reg),
  	.key_expansion_out(key_expansion_out_w),
	.key_expansion_ready_out(key_expansion_ready_out_w)
  );
  
  

//---------------------------------------------------------------------------------------------
//  Architecture:	Controlling cipher text and  cipher text ready - ouptut signal
//---------------------------------------------------------------------------------------------
  	
  always @(posedge clk or negedge reset_n)
  begin
    	if (!reset_n )
    		begin
      round_reg <= 4'h0;
	  		cipher_text_out_reg <= 128'h0;
	  		cipher_text_ready_out_reg <= 1'b0;
    		end
	else if(start_in)
		begin
			cipher_text_out_reg <= 128'h0;
			cipher_text_ready_out_reg <= 1'b0;
			key_in_reg <= key_in;
			plain_text_in_reg <= plain_text_in;
			round_reg <= 4'h0; 
		end
	 else if(round_reg == 10 && cipher_text_ready_out_w)
		begin
			cipher_text_out_reg <= cipher_text_out_w;
			cipher_text_ready_out_reg <= cipher_text_ready_out_w;
		end
	else if(key_expansion_ready_out_w && round_reg < 10)
		begin
			key_in_reg <= key_expansion_out_w;
			plain_text_in_reg <= cipher_text_out_w;
			round_reg <= round_reg + 1 ;
			cipher_text_ready_out_reg <=0;
		end
	else
		  cipher_text_ready_out_reg <=0;
  end


 
  
//---------------------------------------------------------------------------------------------
//  Architecture:   Controlling start Key Expander and Encrypt
//---------------------------------------------------------------------------------------------

  assign start_key_expand_w = start_in | key_expansion_ready_out_w;
  assign start_encryption_w = start_in | key_expansion_ready_out_w;
  assign start_decryption_w = cipher_text_ready_out_reg | de_cipher_text_ready_out_w;
//---------------------------------------------------------------------------------------------
//  Architecture:   Connecting to output ports
//---------------------------------------------------------------------------------------------

  
  assign cipher_text_out = (en_or_de == 1'b1) ? cipher_text_out_reg : de_cipher_text_out_reg;
  assign cipher_text_ready_out = (en_or_de == 1'b1) ? cipher_text_ready_out_reg : de_cipher_text_ready_out_reg;

endmodule


