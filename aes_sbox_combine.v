//  File name	  : sbox_combi.v
//  Project		   : AES128
//  Author		    : Do Quang Huy 
//  Referents	  : none.

//Any arbitrary polynomial can be represented by bx + c where
//b is upper half term and c is the lower half term. Therefore, 
//from here, a binary number in Galois Field q can be spilt to qHx + qL. 
//For instance, if q = {1011} 2, it can be represented as
//{10} 2x + {11} 2, where qH is {10} 2 and qL = {11} 2. qH and qL can be
//further decomposed to {1} 2x + {0} 2 and {1} 2x + {1} 2 respectively.


module sbox_combi (
  en_or_de,
  sbox_in,
  sbox_out
  );
  
  input wire en_or_de;
  input wire [7:0]sbox_in;
  output wire [7:0]sbox_out;
  
  wire [7:0] a, c, d;
  
  inv_aff_tran ins0 (sbox_in, a);
  mul_inv_module ins1 (en_or_de?sbox_in:a, c);
  aff_tran ins2 (c, d);
  assign sbox_out = en_or_de ? d : c;
  
  endmodule
  
  ///mapping
  module  map (a,map);
  input wire [7:0] a;
  output wire [7:0] map;
	
	 
	 assign map[7] = a[7]^a[5];
	 assign map[6] = a[7]^a[6]^a[4]^a[3]^a[2]^a[1];
	 assign map[5] = a[7]^a[5]^a[3]^a[2];
	 assign map[4] = a[7]^a[5]^a[3]^a[2]^a[1];
	 assign map[3] = a[7]^a[6]^a[2]^a[1];
	 assign map[2] = a[7]^a[4]^a[3]^a[2]^a[1];
	 assign map[1] = a[6]^a[4]^a[1];
	 assign map[0] = a[6]^a[1]^a[0];
		
	  endmodule //end map
  
  /// inv_mapping
  module inv_map (a, inv_map);
	input wire [7:0] a;
	output wire [7:0] inv_map;
	
	 assign inv_map[7] = a[7]^a[6]^a[5]^a[1];
	 assign inv_map[6] = a[6]^a[2];
	 assign inv_map[5] = a[6]^a[5]^a[1];
	 assign inv_map[4] = a[6]^a[5]^a[4]^a[2]^a[1];
	 assign inv_map[3] = a[5]^a[4]^a[3]^a[2]^a[1];
	 assign inv_map[2] = a[7]^a[4]^a[3]^a[2]^a[1];
	 assign inv_map[1] = a[5]^a[4];
	 assign inv_map[0] = a[6]^a[5]^a[4]^a[2]^a[0];
	
  endmodule /// end mapping
	  

 //// squaring op
 module square_op (q, square_op);
   input wire [3:0]q;
   output wire [3:0] square_op;
   
	assign square_op[3] = q[3];
	assign square_op[2] = q[3]^q[2];
	assign square_op[1] = q[2]^q[1];
	assign square_op[0] = q[3]^q[1]^q[0];
   
 endmodule  //end square_op
 
 /////  multi with constant lamda
 module mul_cons_lamda (q, mul_cons_lamda);
   input wire [3:0] q;
   output wire [3:0] mul_cons_lamda;
   
	assign mul_cons_lamda[3] = q[2]^q[0];
	assign mul_cons_lamda[2] = q[3]^q[2]^q[1]^q[0];
	assign mul_cons_lamda[1] = q[3];
	assign mul_cons_lamda[0] = q[2];
	  
	endmodule  ///end multi lamda
 
 //// multi with constant phi
 module mul_cons_phi (a,mul_cons_phi);
   input wire [1:0] a;
   output wire [1:0] mul_cons_phi;
   
	assign mul_cons_phi[1] = a[1]^a[0];
	assign mul_cons_phi[0] = a[1];
	endmodule  /// end multi phi
 
 /////  multi in GF(2^2)
 module mul_GF2_2 (a,b,mul_GF2_2);
   input wire [1:0] a;
   input wire [1:0] b;
   output wire [1:0] mul_GF2_2;
   
	assign mul_GF2_2 [1] = (a[1]&b[1]) ^ (a[0]&b[1]) ^ (a[1]&b[0]);
	assign mul_GF2_2 [0] = (a[1]&b[1]) ^ (a[0]&b[0]);
   
 endmodule  // end multi in GF2^2
 
 ///// multi in GF2^4
 module mul_GF2_4 (a,b,mul_GF2_4);
   input wire [3:0] a;
   input wire [3:0]b;
   output wire [3:0] mul_GF2_4;
	
	wire [1:0] d, e, f, g, h, i;
	
   mul_GF2_2 ins7 (a[3:2], b[3:2], d);
	
	assign e = a[3:2] ^ a[1:0];
	assign f = b[3:2] ^ b[1:0];
	mul_GF2_2 ins8 (e, f, g);
	mul_GF2_2 ins9 (a[1:0], b[1:0], h);
	mul_cons_phi ins10 (d, i);
	assign mul_GF2_4[3:2] = g ^ h;
	assign mul_GF2_4[1:0] = i ^ h;
 endmodule  //end multi in GF2^4
 
 ///// multi inv in GF2^4
 module mul_inv (a,mul_inv);
   input wire [3:0] a;
   output wire [3:0] mul_inv;
   
	assign mul_inv[3] = a[3] ^ a[3]&a[2]&a[1] ^ a[3]&a[0] ^ a[2];
	assign mul_inv[2] = a[3]&a[2]&a[1] ^ a[3]&a[2]&a[0] ^ a[3]&a[0] ^ a[2]&a[1] ^ a[2];
	assign mul_inv[1] = a[3] ^ a[3]&a[2]&a[1] ^ a[3]&a[1]&a[0] ^ a[2]&a[0] ^ a[2] ^ a[1];
	assign mul_inv[0] = a[3]&a[2]&a[1] ^ a[3]&a[2]&a[0] ^ a[3]&a[1]&a[0] ^ a[3]&a[0] ^ a[3]&a[1] ^ a[2] ^ a[2]&a[1] ^ a[2]&a[1]&a[0] ^ a[1] ^ a[0];
   
 endmodule  /// end multi inv
 
 ////// multicative inversion module
 module mul_inv_module (a, mul_inv_module);
   input wire [7:0] a;
   output wire [7:0] mul_inv_module;
	
   wire [7:0] q;
	wire [3:0] r, s, t, u, v, w;
	map ins3 (a, q);
	square_op ins4 (q[7:4], r);
	mul_cons_lamda ins5 (r, s);
	
	mul_GF2_4 ins6 (q[7:4]^q[3:0], q[3:0], t);
	
	mul_inv ins11 ( {t^s}, u);
	
	mul_GF2_4 ins12 (u, q[7:4], v);
	mul_GF2_4 ins13 (u, q[7:4]^q[3:0], w);
	
	inv_map ins14 ({v,w}, mul_inv_module);
	
	

 endmodule  ////end multi inversion module
 
 //// aff_tranform
 module aff_tran (a, aff_tran);
   input wire [7:0] a;
   output wire [7:0] aff_tran;
   
	assign aff_tran [7] = a[7]^a[6]^a[5]^a[4]^a[3]^1'b0;
	assign aff_tran [6] = a[2]^a[6]^a[5]^a[4]^a[3]^1'b1;
	assign aff_tran [5] = a[1]^a[2]^a[5]^a[4]^a[3]^1'b1;
	assign aff_tran [4] = a[0]^a[1]^a[2]^a[4]^a[3]^1'b0;
	assign aff_tran [3] = a[7]^a[0]^a[1]^a[2]^a[3]^1'b0;
	assign aff_tran [2] = a[7]^a[6]^a[0]^a[1]^a[2]^1'b0;
	assign aff_tran [1] = a[7]^a[6]^a[5]^a[0]^a[1]^1'b1;
	assign aff_tran [0] = a[7]^a[6]^a[5]^a[4]^a[0]^1'b1;
	 
   
 endmodule  // end aff_tran
 
 ///// inv_aff_tran
 module inv_aff_tran (a, inv_aff_tran);
 input wire [7:0] a;
 output wire [7:0] inv_aff_tran;
   
	assign inv_aff_tran[7] = a[6]^a[4]^a[1]^1'b0;
	assign inv_aff_tran[6] = a[5]^a[3]^a[0]^1'b0;
	assign inv_aff_tran[5] = a[7]^a[4]^a[2]^1'b0;
	assign inv_aff_tran[4] = a[6]^a[3]^a[1]^1'b0;
	assign inv_aff_tran[3] = a[5]^a[2]^a[0]^1'b0;
	assign inv_aff_tran[2] = a[7]^a[4]^a[1]^1'b1;
	assign inv_aff_tran[1] = a[6]^a[3]^a[0]^1'b0;
	assign inv_aff_tran[0] = a[7]^a[5]^a[2]^1'b1;
   
 endmodule  /// end inv_aff_tran
 
 
 
 
 

