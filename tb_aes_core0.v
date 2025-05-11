`timescale 1ns / 1ps
module tb_aes_core();

reg 		clk;
reg  		reset_n;
reg 		start_in_reg;
reg   en_or_de;
reg   [127:0]	key_in_reg;
reg   [127:0] 	plain_text_in_reg;

wire [127:0] cipher_text_out_w;
wire cipher_text_ready_out_w;
	
//---------------------------------------------------------------------------------------------
//  Architecture:   Controlling to input
//---------------------------------------------------------------------------------------------

	initial
	begin
		clk=0;
		reset_n=0;
		en_or_de=1;
		#5 reset_n=1;

		#20;
 		key_in_reg = 128'h0023456789abcdeffedcba9876543210;
 		plain_text_in_reg = 128'h0123456789abcdeffedcba9876543210;
 		start_in_reg = 1;
 		#10 start_in_reg = 0;
    
    #2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hb19133e32e0f47eadd98cfafbf25587d)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
		#3000
 		key_in_reg = 128'h5468617473206D79204B756E67204675;
 		plain_text_in_reg = 128'h54776F204F6E65204E696E652054776F;
 		start_in_reg =1;
		#20
		start_in_reg =0; 
    #2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h29c3505f571420f6402299b31a02d73a)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
		#3000
 		key_in_reg = 128'hE8E9EAEBEDEEEFF0F2F3F4F5F7F8F9FA;
 		plain_text_in_reg = 128'h014BAF2278A69D331D5180103643E99A;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h6743c3d1519ab4f2cd9a78ab09a511bd)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
//
		#3000
 		key_in_reg = 128'hA1234567890123456789012345678901;
 		plain_text_in_reg = 128'h1234567890123456789012345678901b;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hff676fc0ad26db8257a8e0e9737ceeb1)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      		#3000
 		key_in_reg = 128'hb1111111111111111111111111111111;
 		plain_text_in_reg = 128'hc2222222222222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h1fe726e80e7c19ce7905815e52061200)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
     // 
      #3000
 		key_in_reg = 128'hc2222222222222222222222222222222;
 		plain_text_in_reg = 128'hd2222222222222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hc61f7f1876a374dc81cecd0fb015b749)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
 #3000
 		key_in_reg = 128'hd2222222222222222222222222222222;
 		plain_text_in_reg = 128'he2222222222222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h207f0ae07755d99ffc05f2cba87c96ed)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
     #3000
 		key_in_reg = 128'hd2222222222222222222222222222222;
 		plain_text_in_reg = 128'he2222222222222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h207f0ae07755d99ffc05f2cba87c96ed)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he2222222222222222222222222222222;
 		plain_text_in_reg = 128'hf2222222222222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h1fa301b8d091efbb41a480b49c700f2f)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1222222222222222222222222222222;
 		plain_text_in_reg = 128'hf1222222222222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hcbba2c12dc4d185b7ac60ce5ee548af7)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1122222222222222222222222222222;
 		plain_text_in_reg = 128'hf1122222222222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h3fe2079b049a9a8da35c041a24dc7a0a)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
        //
      #3000
 		key_in_reg = 128'he1112222222222222222222222222222;
 		plain_text_in_reg = 128'hf1112222222222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h974ac3f425eb301b007054ae51d49e71)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
     //
      #3000
 		key_in_reg = 128'he1111222222222222222222222222222;
 		plain_text_in_reg = 128'hf1111222222222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'he34a844e8aa442854aeb3f5256440c07)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111122222222222222222222222222;
 		plain_text_in_reg = 128'hf1111122222222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h99c28777706daafa1bae6a0293160b5d)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end 
      //
      #3000
 		key_in_reg = 128'he1111112222222222222222222222222;
 		plain_text_in_reg = 128'hf1111112222222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hba9f3860fc6702e25236a88a3e6034cc)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111222222222222222222222222;
 		plain_text_in_reg = 128'hf1111111222222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h26184f2ee1cee03852c3440afb7a5315)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111122222222222222222222222;
 		plain_text_in_reg = 128'hf1111111122222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h9f39fbb90fc5a4454297ac71b18b9c36)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111112222222222222222222222;
 		plain_text_in_reg = 128'hf1111111112222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h11494b1a6b9082754349a6b82803e852)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
          //
      #3000
 		key_in_reg = 128'he1111111111222222222222222222222;
 		plain_text_in_reg = 128'hf1111111111222222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h2db581b3602f3c5249393d58bdf20f88)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
         //
      #3000
 		key_in_reg = 128'he1111111111122222222222222222222;
 		plain_text_in_reg = 128'hf1111111111122222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h6569c149e4b036110a60dd7d089c33ec)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111112222222222222222222;
 		plain_text_in_reg = 128'hf1111111111112222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h141f407ff9b194e432e0dfad871dfff3)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111222222222222222222;
 		plain_text_in_reg = 128'hf1111111111111222222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h034216b58d792d0db09df7a01dbfb55c)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111111122222222222222222;
 		plain_text_in_reg = 128'hf1111111111111122222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h7d08a8ad291f3eee19bdaae05bffcf7f)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111122222222222222222;
 		plain_text_in_reg = 128'hf1111111111111122222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h7d08a8ad291f3eee19bdaae05bffcf7f)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111112222222222222222;
 		plain_text_in_reg = 128'hf1111111111111112222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h13c0dfe9c6cafd44fc0c26bcbb6a3113)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
        //
      #3000
 		key_in_reg = 128'he1111111111111111222222222222222;
 		plain_text_in_reg = 128'hf1111111111111111222222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h5aeae6e0ec842fee9f7ed6c9789282cf)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
         //
      #3000
 		key_in_reg = 128'he1111111111111111122222222222222;
 		plain_text_in_reg = 128'hf1111111111111111122222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hc0b8df4cdcf58eed41537d4c88310e0a)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111112222222222222;
 		plain_text_in_reg = 128'hf1111111111111111112222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h0ab8e527b3aabbe8145a7195c00b339e)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111222222222222;
 		plain_text_in_reg = 128'hf1111111111111111111222222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h86edcad2d30b90b28f289c8de8aee6ad)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111122222222222;
 		plain_text_in_reg = 128'hf1111111111111111111122222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h421a6c0bd0d880821bdd09be0389442a)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111111111111112222222222;
 		plain_text_in_reg = 128'hf1111111111111111111112222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h41c2239cde307567dc00c43209a46f34)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111222222222;
 		plain_text_in_reg = 128'hf1111111111111111111111222222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h33bf1eb69e8cd91677939a702b94af2d)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
        //
      #3000
 		key_in_reg = 128'he1111111111111111111111122222222;
 		plain_text_in_reg = 128'hf1111111111111111111111122222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h0edfdda397df1d5da33ebde33b2804d9)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111111111111111112222222;
 		plain_text_in_reg = 128'hf1111111111111111111111112222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h140839377716f7bc5ab9724ae09cf63f)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111111222222;
 		plain_text_in_reg = 128'hf1111111111111111111111111222222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h558df5db21a135f0fb90c5b2586f4827)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111111122222;
 		plain_text_in_reg = 128'hf1111111111111111111111111122222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h13920d5a6cd88cd688e94bc3920f3918)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111111122222;
 		plain_text_in_reg = 128'hf1111111111111111111111111122222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h13920d5a6cd88cd688e94bc3920f3918)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
            #3000
           key_in_reg = 128'he1111111111111111111111111112222;
           plain_text_in_reg = 128'hf1111111111111111111111111112222;
           start_in_reg = 1;
           #20
          start_in_reg = 0; 
           #2000
           $display("--------------------------------");
           $display(" key_in = %h ",key_in_reg);
           $display(" plain_text = %h ",plain_text_in_reg);
          if(cipher_text_out_w == 128'hcd98a1eda4a8a15b19a79dd6297e7d3e)
            begin
              $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
              $display("---cipher_text_out is correct---");
              
            end
          else
            begin
              $display(" cipher_text_out <> cipher_text_out_expected ");
              $display("---cipher_text_out is incorrect---");
            end
            //
      #3000
 		key_in_reg = 128'he1111111111111111111111111111222;
 		plain_text_in_reg = 128'hf1111111111111111111111111111222;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h395c4db8a94d5b32c82a662c23caee66)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
          //
      #3000
 		key_in_reg = 128'he1111111111111111111111111111122;
 		plain_text_in_reg = 128'hf1111111111111111111111111111122;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hb561296adfe7d1bfd49fe35e2a84af17)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
         //
      #3000
 		key_in_reg = 128'he1111111111111111111111111111112;
 		plain_text_in_reg = 128'hf1111111111111111111111111111112;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'he526fc1b34379b81a55cf331a0648305)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1333333333333333333333333333333;
 		plain_text_in_reg = 128'hf1333333333333333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h402359d290512eca8a96bcc1e5d164f0)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
        //
      #3000
 		key_in_reg = 128'he1133333333333333333333333333333;
 		plain_text_in_reg = 128'hf1133333333333333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hfef2a7984c07afba6201910b82480ee8)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1113333333333333333333333333333;
 		plain_text_in_reg = 128'hf1113333333333333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h230a035ae46368728c0a9123b08b6ff9)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111333333333333333333333333333;
 		plain_text_in_reg = 128'hf1111333333333333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h655575d0a33a9174caab84d631eb6a51)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111133333333333333333333333333;
 		plain_text_in_reg = 128'hf1111133333333333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h639f5bee39088aab6a157887abd3e10a)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111113333333333333333333333333;
 		plain_text_in_reg = 128'hf1111113333333333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h86e934bf646e90a3b882ba3381e1e122)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111333333333333333333333333;
 		plain_text_in_reg = 128'hf1111111333333333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h529636a5da3cd308b041fdd5cdfb8d2d)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111133333333333333333333333;
 		plain_text_in_reg = 128'hf1111111133333333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h5656df193df840b1e60d24283cbadbb7)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
        //
      #3000
 		key_in_reg = 128'he1111111113333333333333333333333;
 		plain_text_in_reg = 128'hf1111111113333333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hdcb836a658a57e161f70a90dd0cd0bf7)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111333333333333333333333;
 		plain_text_in_reg = 128'hf1111111111333333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h282c3689e3666be94a03dd1d8b6f0c8f)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000;
 		key_in_reg = 128'he1111111111333333333333333333333;
 		plain_text_in_reg = 128'hf1111111111333333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h282c3689e3666be94a03dd1d8b6f0c8f)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111133333333333333333333;
 		plain_text_in_reg = 128'hf1111111111133333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hA93A9A4E3E61E304EDF410ABF4F5C683)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111113333333333333333333;
 		plain_text_in_reg = 128'hf1111111111113333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h8CAF0F84C026BB0889B70C173A784757)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
        //
      #3000
 		key_in_reg = 128'he1111111111111333333333333333333;
 		plain_text_in_reg = 128'hf1111111111111333333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hC4A4237E91F3EA95C2B672D012358BB4)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
        //
      #3000
 		key_in_reg = 128'he1111111111111133333333333333333;
 		plain_text_in_reg = 128'hf1111111111111133333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h71a580ebbba45c0c184a4f155b144248)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end  //
      #3000
 		key_in_reg = 128'he1111111111111133333333333333333;
 		plain_text_in_reg = 128'hf1111111111111133333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h71a580ebbba45c0c184a4f155b144248)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
        //
      #3000
 		key_in_reg = 128'he1111111111111113333333333333333;
 		plain_text_in_reg = 128'hf1111111111111113333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h4840dc332f4413ef62693432a237ab7f)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111111111333333333333333;
 		plain_text_in_reg = 128'hf1111111111111111333333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hc33971be12fff786ed7b9aac81d4b15c)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
        //
      #3000
 		key_in_reg = 128'he1111111111111111133333333333333;
 		plain_text_in_reg = 128'hf1111111111111111133333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hdc9a5d76e8ee16697d650efbfe729488)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111113333333333333;
 		plain_text_in_reg = 128'hf1111111111111111113333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'he7af808d63d9222f3d78847d26875502)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111333333333333;
 		plain_text_in_reg = 128'hf1111111111111111111333333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h8999dbf87a27673abf2f7029af8fea60)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111111111111133333333333;
 		plain_text_in_reg = 128'hf1111111111111111111133333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h5f67b86cc2723f70c737bcf1f07319ca)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111111111111113333333333;
 		plain_text_in_reg = 128'hf1111111111111111111113333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h7b8f88c7d0cadee8bfa085364afccd12)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
        //
      #3000
 		key_in_reg = 128'he1111111111111111111111333333333;
 		plain_text_in_reg = 128'hf1111111111111111111111333333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hf736dcc3a1eaa95f583f8ed9aa7e8e74)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111111111111111133333333;
 		plain_text_in_reg = 128'hf1111111111111111111111133333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'ha6df28f582a22f3d1e57eb5a78ca595d)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111113333333;
 		plain_text_in_reg = 128'hf1111111111111111111111113333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hb2a3b459c35d0bd441d2fa035a457e11)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111111333333;
 		plain_text_in_reg = 128'hf1111111111111111111111111333333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h0d430b3779ccb21895116c08733f9566)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111111111111111111133333;
 		plain_text_in_reg = 128'hf1111111111111111111111111133333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'ha5f015c0cfa39e6ad12aaef386ee0df8)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111111113333;
 		plain_text_in_reg = 128'hf1111111111111111111111111113333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hc201c0d91b6222651d405aeadb540343)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
        //
      #3000
 		key_in_reg = 128'he1111111111111111111111111111333;
 		plain_text_in_reg = 128'hf1111111111111111111111111111333;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'ha02f88c189e994336f815886f1b6a1cf)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111111111133;
 		plain_text_in_reg = 128'hf1111111111111111111111111111133;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h3a5d6f4b3f39563fe713c606e60fef5b)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111111111113;
 		plain_text_in_reg = 128'hf1111111111111111111111111111113;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h7a7f23c8301704456dac76947ab74dc1)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he4444444444444444444444444444444;
 		plain_text_in_reg = 128'hf4444444444444444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hddb9d37e03a6ebd6dce0c3c53f815bef)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1444444444444444444444444444444;
 		plain_text_in_reg = 128'hf1444444444444444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h4f0930c6dd9df6dd18790d717ed451a8)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1144444444444444444444444444444;
 		plain_text_in_reg = 128'hf1144444444444444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h8a655424128d762b983a8e63516d4757)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1114444444444444444444444444444;
 		plain_text_in_reg = 128'hf1114444444444444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h4847b0492a215e3f0fec25dba0a5e66b)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111444444444444444444444444444;
 		plain_text_in_reg = 128'hf1111444444444444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hf35657e6ef1fcb047c5d7c25aa6384ea)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111144444444444444444444444444;
 		plain_text_in_reg = 128'hf1111144444444444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hb4d53b1e60be7510ff2fd059f31f49d8)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
        //
      #3000
 		key_in_reg = 128'he1111114444444444444444444444444;
 		plain_text_in_reg = 128'hf1111114444444444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hc356014c53ff2d13e80e187d9eeaef01)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111444444444444444444444444;
 		plain_text_in_reg = 128'hf1111111444444444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h38a00ad2796afc23413120bc76c60aba)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111144444444444444444444444;
 		plain_text_in_reg = 128'hf1111111144444444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h7a8c8ec49803a432366add7c12d240ee)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111114444444444444444444444;
 		plain_text_in_reg = 128'hf1111111114444444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hd58168b93f06d60805513b1c47f6cc74)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
           //
      #3000
 		key_in_reg = 128'he1111111111444444444444444444444;
 		plain_text_in_reg = 128'hf1111111111444444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'habef4daac6aec04b080223c0a964cc00)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111144444444444444444444;
 		plain_text_in_reg = 128'hf1111111111144444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h5f0806ddf996bc361fc5c31be8a97ce9)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111114444444444444444444;
 		plain_text_in_reg = 128'hf1111111111114444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h6ce2bdfcd51caf69830af74f269da6b4)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111444444444444444444;
 		plain_text_in_reg = 128'hf1111111111111444444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h193f5c4bd90b327e946768dd635fde04)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111111144444444444444444;
 		plain_text_in_reg = 128'hf1111111111111144444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hc03b26be9d661fe490805a3fcb88dd46)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111114444444444444444;
 		plain_text_in_reg = 128'hf1111111111111114444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h6097cfef9b30bb45b23c3f370b6ed165)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111444444444444444;
 		plain_text_in_reg = 128'hf1111111111111111444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h03eda8c94470d6a12fc095bc808228ad)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end//
      #3000
 		key_in_reg = 128'he1111111111111111444444444444444;
 		plain_text_in_reg = 128'hf1111111111111111444444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h03eda8c94470d6a12fc095bc808228ad)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111144444444444444;
 		plain_text_in_reg = 128'hf1111111111111111144444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h31f49b2a371b552fe7df01cc602375e8)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111114444444444444;
 		plain_text_in_reg = 128'hf1111111111111111114444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h7d184a564a75c937c347f43f57a9c732)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111111111111444444444444;
 		plain_text_in_reg = 128'hf1111111111111111111444444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hff4ba2ba4bb382695abb70c39ad44b01)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111111111111144444444444;
 		plain_text_in_reg = 128'hf1111111111111111111144444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hb2ffa1c0dd15d38842c2492023a542fc)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111114444444444;
 		plain_text_in_reg = 128'hf1111111111111111111114444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h949a63e958621a037b19ef999692f78b)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111444444444;
 		plain_text_in_reg = 128'hf1111111111111111111111444444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h06e448a7432b241a46e507ed0b22a93e)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111144444444;
 		plain_text_in_reg = 128'hf1111111111111111111111144444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h3d529030016d5ded8a7daaafeb603f62)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111114444444;
 		plain_text_in_reg = 128'hf1111111111111111111111114444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h1bf766d5cb2ab0a21d429e883d6f8c49)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
        end
         //
      #3000
 		key_in_reg = 128'he1111111111111111111111111444444;
 		plain_text_in_reg = 128'hf1111111111111111111111111444444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'he96eec4f2ec5a15bba748c8542a7686f)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111111144444;
 		plain_text_in_reg = 128'hf1111111111111111111111111144444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'ha3e8fa29353a1a9fb56a287a3e0ebed2)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111111114444;
 		plain_text_in_reg = 128'hf1111111111111111111111111114444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h216a8825a9a03d10c30337829eaa5abf)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
      //
      #3000
 		key_in_reg = 128'he1111111111111111111111111111444;
 		plain_text_in_reg = 128'hf1111111111111111111111111111444;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h7349947973bef1a28525caa6f0cb8eb8)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111111111111111111111144;
 		plain_text_in_reg = 128'hf1111111111111111111111111111144;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'hfc21a1d21b709161747a6253a95648c7)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
       //
      #3000
 		key_in_reg = 128'he1111111111111111111111111111114;
 		plain_text_in_reg = 128'hf1111111111111111111111111111114;
 		start_in_reg = 1;
 		#20
		start_in_reg = 0; 
 		#2000
     $display("--------------------------------");
     $display(" key_in = %h ",key_in_reg);
     $display(" plain_text = %h ",plain_text_in_reg);
    if(cipher_text_out_w == 128'h428f24b826928526c4644ff7140fdac4)
      begin
        $display(" cipher_text_out = cipher_text_out_expected = %h ",cipher_text_out_w);
        $display("---cipher_text_out is correct---");
        
      end
    else
      begin
        $display(" cipher_text_out <> cipher_text_out_expected ");
        $display("---cipher_text_out is incorrect---");
      end
    
    
    
    
    
    
    
      
  //////////////////////////////////////    
	end
always 
	#10  clk =  ~ clk; 

aes_core 
aes_en(
	.clk(clk),
  	.reset_n(reset_n), 
	.start_in(start_in_reg),
	.en_or_de(en_or_de),
  	.key_in(key_in_reg),
	.plain_text_in(plain_text_in_reg),
  	.cipher_text_out(cipher_text_out_w),
	.cipher_text_ready_out(cipher_text_ready_out_w)
);

endmodule

