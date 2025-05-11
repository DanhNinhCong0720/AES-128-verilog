`timescale 1ns/1ps
module tb_key_expansion();
reg 	Clk;
reg  	Rst_n;
reg 	Start_in;
reg	[3:0]    Rcon_in;
reg [127:0]	Key_in;

wire [127:0] Key_expansion_out;
wire Key_expansion_ready_out;
initial
begin
Clk=0;
Rst_n=0;
#5 Rst_n=1;
#20;
 Rcon_in=0;
 Key_in=128'h5468617473206D79204B756E67204675;
 Start_in=1;
 #10 Start_in=0;
 /*#250;
 Rcon_in=1;
 Key_in=128'h5468617473206D79204B756E67204675;
 Start_in=1;
 #10 Start_in=0;
 #250;
 Rcon_in=2;
 Start_in=1;
 Key_in=128'hE232FCF191129188B159E4E6D679A293;
 #10 Start_in=0;
  #250;
 Rcon_in=3;
 Start_in=1; 
 Key_in=128'h56082007C71AB18F76435569A03AF7FA;
 #10 Start_in=0;
  #250;
 Rcon_in=4; 
 Start_in=1;
 Key_in=128'hD2600DE7157ABC686339E901C3031EFB;
 #10 Start_in=0;
  #250;
 Rcon_in=5; 
 Start_in=1;
 Key_in=128'hA11202C9B468BEA1D75157A01452495B;
 #10 Start_in=0;
  #250;
 Rcon_in=6; 
 Start_in=1;
 Key_in=128'hB1293B3305418592D210D232C6429B69;
 #10 Start_in=0;
  #250;
 Rcon_in=7; 
 Start_in=1;
 #10 Start_in=0;
  #250;
 Rcon_in=8; 
 Start_in=1;
 #10 Start_in=0;
   #250;
 Rcon_in=9; 
 Start_in=1;
 #10 Start_in=0;
  #250;
 Rcon_in=10; 
 Start_in=1;
 #10 Start_in=0;*/
end
always 
#10  Clk =  ~ Clk; 
always @ (posedge Clk)
  if(Key_expansion_ready_out == 1)
      begin
	Key_in   <= Key_expansion_out;
	Start_in <= Key_expansion_ready_out;
	Rcon_in  <= Rcon_in +1;
	end
	else
	  begin
	  Key_in   <= Key_in;
	  Start_in <= 1'b0;
end
aes_key_expansion 
key_expansion(
	.clk(Clk),
  	.reset_n(Rst_n), 
	.start_in(Start_in),
	.rcon_in(Rcon_in),
  	.key_in(Key_in),
  	.key_expansion_out(Key_expansion_out),
	.key_expansion_ready_out(Key_expansion_ready_out)
);
endmodule

