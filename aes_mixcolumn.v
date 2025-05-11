module aes_mixcolumn(
	mixcolumn_in,
	mixcolumn_out
);

  input  wire [31:0] mixcolumn_in;
  output wire [31:0] mixcolumn_out;

//----------------------------------------------------------------
//  Architecture:  Controlling the value output
//----------------------------------------------------------------

assign mixcolumn_out[31:24] = {mixcolumn_in[30:24], 1'b0} ^ (8'h1b & {8{mixcolumn_in[31]}})  
			      ^ (({mixcolumn_in[22:16], 1'b0} ^ (8'h1b & {8{mixcolumn_in[23]}})) ^ mixcolumn_in[23:16])
			      ^ mixcolumn_in[15:8]
			      ^ mixcolumn_in[7:0];
assign mixcolumn_out[23:16] = mixcolumn_in[31:24]
			      ^	({mixcolumn_in[22:16], 1'b0} ^ (8'h1b & {8{mixcolumn_in[23]}}))  
			      ^ (({mixcolumn_in[14:8], 1'b0} ^ (8'h1b & {8{mixcolumn_in[15]}})) ^ mixcolumn_in[15:8])
			      ^ mixcolumn_in[7:0];
assign mixcolumn_out[15:8]  = mixcolumn_in[31:24]
			      ^ mixcolumn_in[23:16]
			      ^	({mixcolumn_in[14:8], 1'b0} ^ (8'h1b & {8{mixcolumn_in[15]}}))  
			      ^ (({mixcolumn_in[6:0], 1'b0} ^ (8'h1b & {8{mixcolumn_in[7]}})) ^ mixcolumn_in[7:0]);
assign mixcolumn_out[7:0] = (({mixcolumn_in[30:24], 1'b0} ^ (8'h1b & {8{mixcolumn_in[31]}})) ^ mixcolumn_in[31:24])
			      ^ mixcolumn_in[23:16]
			      ^ mixcolumn_in[15:8]
			      ^	({mixcolumn_in[6:0], 1'b0} ^ (8'h1b & {8{mixcolumn_in[7]}}));

endmodule 


