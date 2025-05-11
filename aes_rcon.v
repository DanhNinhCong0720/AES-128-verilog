//-------------------------------------------------------------------------------------------------
//  File name	  	: aes_rcon.v
//  Project		: AES128
//  Author		: Do Quang Huy
//  Description		: Round Contants 
//
//  Referents		: Pham Hoai Luan.
//-------------------------------------------------------------------------------------------------


module aes_rcon(
	rcon_in,
	rcon_out
);

//---------------------------------------------------------------------------------------------
//  Ports
//---------------------------------------------------------------------------------------------

  input  wire [3:0] rcon_in;
  output wire [7:0] rcon_out;

//---------------------------------------------------------------------------------------------
//  Wires
//---------------------------------------------------------------------------------------------
  
 wire [7:0] rcon [0:15];

//----------------------------------------------------------------
//  Architecture:  Controlling the value output
//----------------------------------------------------------------
  
  assign rcon_out = rcon[rcon_in];

//----------------------------------------------------------------
// Architecture:  Controlling the value rcon
//----------------------------------------------------------------

  assign rcon[4'h0] = 8'h00;
  assign rcon[4'h1] = 8'h01;
  assign rcon[4'h2] = 8'h02;
  assign rcon[4'h3] = 8'h04;
  assign rcon[4'h4] = 8'h08;
  assign rcon[4'h5] = 8'h10;
  assign rcon[4'h6] = 8'h20;
  assign rcon[4'h7] = 8'h40;
  assign rcon[4'h8] = 8'h80;
  assign rcon[4'h9] = 8'h1b;
  assign rcon[4'ha] = 8'h36;
  assign rcon[4'hb] = 8'h6c;
  assign rcon[4'hc] = 8'hd8;
  assign rcon[4'hd] = 8'hab;
  assign rcon[4'he] = 8'h4d;
  assign rcon[4'hf] = 8'h9a;

  endmodule


