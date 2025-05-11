//-------------------------------------------------------------------------------------------------
//  File name	  	: testbench_aes_de.v
//  Project		: AES128
//  Author		    	: Do Quang Huy
//  Description		: Test Bench AES 
//  Referents	  	: Pham Hoai Luan.
//-------------------------------------------------------------------------------------------------

module tb_aes_de_core();

//---------------------------------------------------------------------------------------------
//  Registers
//---------------------------------------------------------------------------------------------

reg 		clk;
reg  	reset_n;
reg 		start_in_reg;
reg   en_or_de;
reg   [127:0]	key_in_reg;
reg   [127:0] 	cipher_text_in;

//---------------------------------------------------------------------------------------------
// 	Wire
//---------------------------------------------------------------------------------------------  

wire [127:0] plain_text_out;
wire plain_text_ready_out_w;

//---------------------------------------------------------------------------------------------
//  Architecture:   Controlling to input
//---------------------------------------------------------------------------------------------
initial
	begin
		clk=0;
		key_in_reg = 0;
		cipher_text_in = 0;
		reset_n=0;
		start_in_reg=0;
		en_or_de = 0;
		#5 reset_n=1; en_or_de = 0;

		#200;
 		key_in_reg = 128'h3000;
 		cipher_text_in = 128'h89bdf4c13a2aa67896d6b2a0f3e0ff4e;
 		#100;
 		start_in_reg = 1;
 		#20 
 		start_in_reg = 0;

 		
 	
	
//    #8000
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'hc608680c0eb8738b3508d11918de6de7)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
//      //
    
//		#8000
//		reset_n=0;
//		#10 reset_n=1;
// 		key_in_reg = 128'h5468617473206D79204B756E67204675;
// 		cipher_text_in = 128'h54776f204f6e65204e696e652054776f;
// 		start_in_reg =1;
//		#20
//		start_in_reg =0; 
//    #8200
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'hb626da7323d8ade6493d2baed790e089)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
//      //
		
// 	#8000
//		reset_n=0;
//		#10 reset_n=1;
// 		key_in_reg = 128'hb1111111111111111111111111111111;
// 		cipher_text_in = 128'h1fe726e80e7c19ce7905815e52061200;
// 		start_in_reg =1;
//		#20
//		start_in_reg =0; 
//    #8000
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'hc2222222222222222222222222222222)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
// //
// #8000
//		reset_n=0;
//		#10 reset_n=1;
// 		key_in_reg = 128'hc2222222222222222222222222222222;
// 		cipher_text_in = 128'hc61f7f1876a374dc81cecd0fb015b749;
// 		start_in_reg =1;
//		#20
//		start_in_reg =0; 
//    #8000
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'hd2222222222222222222222222222222)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
//      //
//      #8000
//		reset_n=0;
//		#10 reset_n=1;
// 		key_in_reg = 128'hc2222222222222222222222222222222;
// 		cipher_text_in = 128'hc61f7f1876a374dc81cecd0fb015b749;
// 		start_in_reg =1;
//		#20
//		start_in_reg =0; 
//    #8000
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'hd2222222222222222222222222222222)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
 
//    //
    
//		#8000
//		reset_n=0;
//		#10 reset_n=1;
// 		key_in_reg = 128'hd2222222222222222222222222222222;
// 		cipher_text_in = 128'h207f0ae07755d99ffc05f2cba87c96ed;
// 		start_in_reg =1;
//		#20
//		start_in_reg =0; 
//    #8000
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'he2222222222222222222222222222222)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
//    //
    
//		#8000
//		reset_n=0;
//		#10 reset_n=1;
// 		key_in_reg = 128'he1111111111111122222222222222222;
// 		cipher_text_in = 128'h7d08a8ad291f3eee19bdaae05bffcf7f;
// 		start_in_reg =1;
//		#20
//		start_in_reg =0; 
//    #8000
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'hf1111111111111122222222222222222)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
//     //
    
//		#8000
//		reset_n=0;
//		#10 reset_n=1;
// 		key_in_reg = 128'he1111111111111112222222222222222;
// 		cipher_text_in = 128'h13c0dfe9c6cafd44fc0c26bcbb6a3113;
// 		start_in_reg =1;
//		#20
//		start_in_reg =0; 
//    #8000
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'hf1111111111111112222222222222222)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
//     //
    
//		#8000
//		reset_n=0;
//		#10 reset_n=1;
// 		key_in_reg = 128'he1111111111111111222222222222222;
// 		cipher_text_in = 128'h5aeae6e0ec842fee9f7ed6c9789282cf;
// 		start_in_reg =1;
//		#20
//		start_in_reg =0; 
//    #8000
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'hf1111111111111111222222222222222)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
//     //
    
//		#8000
//		reset_n=0;
//		#10 reset_n=1;
// 		key_in_reg = 128'he1111111111111111122222222222222;
// 		cipher_text_in = 128'hc0b8df4cdcf58eed41537d4c88310e0a;
// 		start_in_reg =1;
//		#20
//		start_in_reg =0; 
//    #8000
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'hf1111111111111111122222222222222)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
//    //
    
//		#8000
//		reset_n=0;
//		#10 reset_n=1;
// 		key_in_reg = 128'he1111111111111111112222222222222;
// 		cipher_text_in = 128'h0ab8e527b3aabbe8145a7195c00b339e;
// 		start_in_reg =1;
//		#20
//		start_in_reg =0; 
//    #8000
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'hf1111111111111111112222222222222)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
//     //
    
//		#8000
//		reset_n=0;
//		#10 reset_n=1;
// 		key_in_reg = 128'he1111111111111111111222222222222;
// 		cipher_text_in = 128'h86edcad2d30b90b28f289c8de8aee6ad;
// 		start_in_reg =1;
//		#20
//		start_in_reg =0; 
//    #8000
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'hf1111111111111111111222222222222)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
//     //
    
//		#8000
//		reset_n=0;
//		#10 reset_n=1;
// 		key_in_reg = 128'he1111111111111111111112222222222;
// 		cipher_text_in = 128'h41c2239cde307567dc00c43209a46f34;
// 		start_in_reg =1;
//		#20
//		start_in_reg =0; 
//    #8000
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'hf1111111111111111111112222222222)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
//    //
    
//		#8000
//		reset_n=0;
//		#10 reset_n=1;
// 		key_in_reg = 128'he1111111111111111111111122222222;
// 		cipher_text_in =128'h0edfdda397df1d5da33ebde33b2804d9;
// 		start_in_reg =1;
//		#20
//		start_in_reg =0; 
//    #2300
//     $display("--------------------------------");
//     $display(" key_in = %h ",key_in_reg);
//     $display(" cipher_text_in = %h ",cipher_text_in);
//     if(plain_text_out == 128'hf1111111111111111111111122222222)
//      begin
//        $display(" plain_text_out = plain_text_out_expect = %h ",plain_text_out);
//        $display("---plain_text is correct---");
        
//      end
//    else
//      begin
//        $display(" plain_text_out <> plain_text_out_expect ");
//        $display("---plain_text is incorrect---");
//      end
      
//  //////////////////////////////////////    
	end
always 
#5  clk =  ~ clk; 

aes_core 
de(
	.clk(clk),
 	.reset_n(reset_n), 
	.start_in(start_in_reg),
	.en_or_de(en_or_de),
 	.key_in(key_in_reg),
	.plain_text_in(cipher_text_in),
 	.cipher_text_out(plain_text_out),
	.cipher_text_ready_out(plain_text_ready_out_w)
);

endmodule

