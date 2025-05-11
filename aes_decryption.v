//-------------------------------------------------------------------------------------------------
//  File name	  : aes_encyption.v
//  Project	  : AES128
//  Author		  : Do Quang Huy
//  Description	  : AES Encyption
//-------------------------------------------------------------------------------------------------
module aes_decryption(
	clk,
  	reset_n, 
	start_in,
  	key_in,
	round_in,
	plain_text_in,
  	cipher_text_out,
	cipher_text_ready_out
);

//-----------------------------------------------------------------
//Parameters
//================================================================
  
  parameter STEP_IDLE			=	3'd0;
  parameter STEP_INIT   		=	3'd1;
  parameter STEP_ADD_ROUND_KEY_INITIAL	=	3'd2;
  parameter STEP_SUB_SHIFT		=	3'd3;
  parameter STEP_MIX_COLUMN		=	3'd4;
  parameter STEP_ADD_ROUND_KEY		=	3'd5;
  parameter STEP_DONE   =3'd6;

//---------------------------------------------------------------------------------------------
//  Ports
//---------------------------------------------------------------------------------------------
  
  input wire 		clk;
  input wire 		reset_n;
  input wire 		start_in;
  input wire   [127:0] 	key_in;
  input wire   [127:0] 	plain_text_in;
  input wire   [3:0] 	round_in;

  output wire  [127:0] 	cipher_text_out;
  output wire		cipher_text_ready_out;

//---------------------------------------------------------------------------------------------
//  Registers
//---------------------------------------------------------------------------------------------

  reg 	   [127:0] 	cipher_text_reg;
  reg      [31:0]   cipher_column_0_temp_reg,cipher_column_1_temp_reg,cipher_column_2_temp_reg,cipher_column_3_temp_reg;
  reg      [2:0] 	state_step_reg;
  reg 		  	cipher_text_done_reg;

//---------------------------------------------------------------------------------------------
// 	Wire
//---------------------------------------------------------------------------------------------  
  
  wire [7:0] w0_w[0:3];
  wire [7:0] w1_w[0:3];
  wire [7:0] w2_w[0:3];
  wire [7:0] w3_w[0:3];
  
  wire [31:0] mixcolum_0_w;
  wire [31:0] mixcolum_1_w;
  wire [31:0] mixcolum_2_w;
  wire [31:0] mixcolum_3_w;

//---------------------------------------------------------------------------------------------
//  Architecture:   Connecting to sbox
//---------------------------------------------------------------------------------------------
 
  sbox_combi
  sbox_w10 
  (
  .en_or_de(1'b0),
  // .enable(clk),
	.sbox_in(cipher_column_0_temp_reg[7:0]),
	.sbox_out(w0_w[0])
  );
  
  sbox_combi 
  sbox_w11 
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_0_temp_reg[15:8]),
	.sbox_out(w0_w[1])
  );

  sbox_combi 
  sbox_w12 
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_0_temp_reg[23:16]),
	.sbox_out(w0_w[2])
  );

  sbox_combi 
  sbox_w13 
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_0_temp_reg[31:24]),
	.sbox_out(w0_w[3])
  );
  
  sbox_combi 
  sbox_w20 
  (
  .en_or_de(1'b0),
  //.enable(clk),
 	.sbox_in(cipher_column_1_temp_reg[7:0]),
	.sbox_out(w1_w[0])
  );

  sbox_combi 
  sbox_w21 
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_1_temp_reg[15:8]),
	.sbox_out(w1_w[1])
  );
  
  sbox_combi 
  sbox_w22 
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_1_temp_reg[23:16]),
	.sbox_out(w1_w[2])
  );

  sbox_combi 
  sbox_w23 
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_1_temp_reg[31:24]),
	.sbox_out(w1_w[3])
  );
  
  sbox_combi
  sbox_w30 
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_2_temp_reg[7:0]),
	.sbox_out(w2_w[0])
  );
  sbox_combi 
  sbox_w31 
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_2_temp_reg[15:8]),
	.sbox_out(w2_w[1])
  );
  
  sbox_combi
  sbox_w32 
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_2_temp_reg[23:16]),
	.sbox_out(w2_w[2])
  );
 
  sbox_combi
  sbox_w33 
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_2_temp_reg[31:24]),
	.sbox_out(w2_w[3])
  );
  
  sbox_combi 
  sbox_w40 
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_3_temp_reg[7:0]),
	.sbox_out(w3_w[0])
  );

  sbox_combi
  sbox_w41
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_3_temp_reg[15:8]),
	.sbox_out(w3_w[1])
  );

  sbox_combi
  sbox_w42 
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_3_temp_reg[23:16]),
	.sbox_out(w3_w[2])
  );

  sbox_combi 
  sbox_w43 
  (
  .en_or_de(1'b0),
  //.enable(clk),
	.sbox_in(cipher_column_3_temp_reg[31:24]),
	.sbox_out(w3_w[3])
  );

//---------------------------------------------------------------------------------------------
//  Architecture:   Connecting to inv_mixcolumn
//---------------------------------------------------------------------------------------------

  aes_inv_mixcolumn 
  mixcolumn0
  (
	.inv_mixcolumn_in(cipher_column_0_temp_reg),
	.inv_mixcolumn_out(mixcolum_0_w)
  );

  aes_inv_mixcolumn 
  mixcolumn1
  (
	.inv_mixcolumn_in(cipher_column_1_temp_reg),
	.inv_mixcolumn_out(mixcolum_1_w)
  );

  aes_inv_mixcolumn 
  mixcolumn2
  (
	.inv_mixcolumn_in(cipher_column_2_temp_reg),
	.inv_mixcolumn_out(mixcolum_2_w)
  );

  aes_inv_mixcolumn 
  mixcolumn3
  (
	.inv_mixcolumn_in(cipher_column_3_temp_reg),
	.inv_mixcolumn_out(mixcolum_3_w)
  );


   
  
//---------------------------------------------------------------------------------------------
//  Architecture:	Controlling cipher text and  cipher text ready - ouptut signal
//---------------------------------------------------------------------------------------------
  	
  always @(posedge clk or negedge reset_n)
  begin
    	if (!reset_n )
    		begin
	  		state_step_reg <= STEP_IDLE; 
    		cipher_text_reg <= 128'h0;
	  		cipher_text_done_reg <= 1'b0;
    		end
    	else
    		begin
			case(state_step_reg)
				STEP_IDLE:
					begin
						cipher_text_done_reg <= 1'b0;
						if((start_in && round_in >= 0) ||(start_in && round_in == 15))
								state_step_reg <= STEP_INIT;
							else
							  state_step_reg <= STEP_IDLE;
					end
				STEP_INIT:
					begin
						cipher_column_0_temp_reg <= plain_text_in[127 : 96];
						cipher_column_1_temp_reg <= plain_text_in[95 : 64];
						cipher_column_2_temp_reg <= plain_text_in[63 : 32];
						cipher_column_3_temp_reg <= plain_text_in[31 : 0];
						if(round_in == 0)
								state_step_reg <= STEP_ADD_ROUND_KEY_INITIAL;
						else
								state_step_reg <= STEP_ADD_ROUND_KEY;
					end
				STEP_ADD_ROUND_KEY_INITIAL:
					begin
						cipher_text_reg[127 : 96] <= cipher_column_0_temp_reg ^ key_in[127 : 96];
						cipher_text_reg[95 : 64]  <= cipher_column_1_temp_reg ^ key_in[95 : 64];
						cipher_text_reg[63 : 32]  <= cipher_column_2_temp_reg ^ key_in[63 : 32];
						cipher_text_reg[31 : 0]   <= cipher_column_3_temp_reg ^ key_in[31 : 0];
						cipher_text_done_reg <= 1'b1;
						state_step_reg <= STEP_DONE ;
					end
				STEP_SUB_SHIFT:
					begin
						cipher_text_reg[127 : 96] <= {w0_w[3],w3_w[2],w2_w[1],w1_w[0]};
						cipher_text_reg[95 : 64]  <= {w1_w[3],w0_w[2],w3_w[1],w2_w[0]};
						cipher_text_reg[63 : 32]  <= {w2_w[3],w1_w[2],w0_w[1],w3_w[0]};
						cipher_text_reg[31 : 0]   <= {w3_w[3],w2_w[2],w1_w[1],w0_w[0]};
						cipher_text_done_reg <= 1'b1;
						state_step_reg <= STEP_IDLE;
					end
				STEP_MIX_COLUMN:
					begin
        				cipher_column_0_temp_reg <= mixcolum_0_w;
						cipher_column_1_temp_reg <= mixcolum_1_w;
						cipher_column_2_temp_reg <= mixcolum_2_w;
						cipher_column_3_temp_reg <= mixcolum_3_w;			
						state_step_reg <= STEP_SUB_SHIFT;

					end
				STEP_ADD_ROUND_KEY:
					begin
						cipher_column_0_temp_reg <= cipher_column_0_temp_reg ^ key_in[127 : 96];
						cipher_column_1_temp_reg <= cipher_column_1_temp_reg ^ key_in[95 : 64];
						cipher_column_2_temp_reg <= cipher_column_2_temp_reg ^ key_in[63 : 32];
						cipher_column_3_temp_reg <= cipher_column_3_temp_reg ^ key_in[31 : 0];
						if(round_in == 10)
								state_step_reg <= STEP_SUB_SHIFT;
						else
								state_step_reg <= STEP_MIX_COLUMN;
					end
                STEP_DONE:
                    begin
                        state_step_reg <= STEP_IDLE;
                        cipher_text_reg <= 128'h0;
                        cipher_text_done_reg <= 1'b0;        
                    end
				
    			endcase
      		end
  end
 
 //---------------------------------------------------------------------------------------------
 //  Architecture:   Connecting to output ports
 //---------------------------------------------------------------------------------------------

  assign cipher_text_out = cipher_text_reg;
  assign cipher_text_ready_out = cipher_text_done_reg;

  endmodule


