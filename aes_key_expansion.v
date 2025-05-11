module aes_key_expansion(
	clk,
  	reset_n, 
	start_in,
	rcon_in,
  	key_in,

  	key_expansion_out,
	key_expansion_ready_out
);
  
  parameter STEP_IDLE			=	4'd0;
  parameter STEP_INIT   		= 	4'd1;
  parameter STEP_ROT_SUB_WORD	=	4'd2;
  parameter STEP_RCON			=	4'd3;
  parameter STEP_XOR			=	4'd4;

  input wire 		clk;
  input wire 		reset_n;
  input wire  [3:0] 	rcon_in;
  input wire		start_in;
  input wire  [127:0] 	key_in;
  output wire [127:0] 	key_expansion_out;
  output wire		key_expansion_ready_out;

  reg     [127:0] 	key_expansion_reg;
  reg     [31:0] 	key_column_temp_reg;
  reg     [2:0] 	state_step_reg;
  reg 		  	key_expansion_done_reg; 
  
  wire [7 : 0] wi_0_w,wi_1_w,wi_2_w,wi_3_w; 
  wire [7 : 0] rcon_out_w;

//---------------------------------------------------------------------------------------------
//  Architecture:   Connecting to sbox
//---------------------------------------------------------------------------------------------
  sbox_combi 
  sbox_wi_0 
  (
  .en_or_de(1'b1),
  //.enable(clk),
	.sbox_in(key_column_temp_reg[7:0]),
	.sbox_out(wi_0_w)
  );

  sbox_combi
  sbox_wi_1 
  (
  .en_or_de(1'b1),
  //.enable(clk),
	.sbox_in(key_column_temp_reg[15:8]),
	.sbox_out(wi_1_w)
  );

  sbox_combi
  sbox_wi_2 
  (
  .en_or_de(1'b1),
  //.enable(clk),
	.sbox_in(key_column_temp_reg[23:16]),
	.sbox_out(wi_2_w)
  );

  sbox_combi 
  sbox_wi_3 
  (
  .en_or_de(1'b1),
  //.enable(clk),
	.sbox_in(key_column_temp_reg[31:24]),
	.sbox_out(wi_3_w)
  );

//---------------------------------------------------------------------------------------------
//  Architecture:   Connecting to sbox
//---------------------------------------------------------------------------------------------

  aes_rcon rcon 
  (
	.rcon_in(rcon_in + 4'h1),
	.rcon_out(rcon_out_w)
  );

//---------------------------------------------------------------------------------------------
//  Architecture:	Controlling Key expansion and  Key expansion ready - ouptut signal
//---------------------------------------------------------------------------------------------
  
  always @(posedge clk or negedge reset_n)
  begin
 	 if (!reset_n )
    		begin
	  		state_step_reg = STEP_IDLE; 
   			key_expansion_reg = 128'h0;
    		end
    	else
    		begin
			case(state_step_reg)
				STEP_IDLE:
					begin
						key_expansion_done_reg = 1'b0;
						if (rcon_in == 0)
						  key_expansion_reg = key_in;
						if((start_in == 1'b1 && rcon_in < 9) ||(start_in == 1'b1 && rcon_in == 10) )
								state_step_reg = STEP_INIT;
						else
						    state_step_reg = STEP_IDLE;
					end
				STEP_INIT:
				begin
				  key_column_temp_reg = key_in[31 : 0];			
					state_step_reg = STEP_ROT_SUB_WORD;
				end
				STEP_ROT_SUB_WORD:
					begin
     					  key_column_temp_reg = {wi_2_w,wi_1_w,wi_0_w,wi_3_w};
						 state_step_reg = STEP_RCON;
					end
				STEP_RCON:
					begin
       					key_column_temp_reg[31:24] = key_column_temp_reg[31:24] ^ rcon_out_w;
						state_step_reg = STEP_XOR;
					end
				STEP_XOR:
					begin
          					key_column_temp_reg        = key_column_temp_reg ^ key_in[127 : 96];
          					key_expansion_reg[127:96]  = key_column_temp_reg;
          					key_column_temp_reg        = key_column_temp_reg ^ key_in[95 : 64];
          					key_expansion_reg[95:64]   = key_column_temp_reg;
          					key_column_temp_reg        = key_column_temp_reg ^ key_in[63 : 32];
          					key_expansion_reg[63:32]   = key_column_temp_reg;	
          					key_column_temp_reg        = key_column_temp_reg ^ key_in[31 : 0];		
						   key_expansion_reg[31:0]    = key_column_temp_reg;
						   key_expansion_done_reg     = 1'b1;
						state_step_reg = STEP_IDLE;
					end


    			endcase
    		end
  end
  
//    always @ (posedge clk)
//    begin
//      if(key_expansion_ready_out == 1) begin
//        key_in   <= key_expansion_out;
//        start_in <= key_expansion_ready_out;
//        rcon_in  <= rcon_in +1;
//      end
//      else begin
//          key_in   <= key_in;
//          start_in <= 1'b0;
//      end
//    end

 //---------------------------------------------------------------------------------------------
 //  Architecture:   Connecting to output ports
 //---------------------------------------------------------------------------------------------

  assign key_expansion_out = key_expansion_reg;
  assign key_expansion_ready_out = key_expansion_done_reg;
	
  endmodule

