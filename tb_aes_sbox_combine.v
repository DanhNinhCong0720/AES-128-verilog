`timescale 1ns/1ps;
module tb_sbox ();
  reg enc;
  reg [7:0]sbox_in;
  wire [7:0]sbox_out;
  
// initial input
initial 
  begin
    enc = 1;
    #5;
      sbox_in = 8'h00;
    #5
    $display("--------------------------------");
    $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'h63)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
      end
    #5;
      sbox_in = 8'h01;
      #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'h7c)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
      end
      
    #5;
      sbox_in = 8'h02;
      #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'h77)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
      end
    #5;
      sbox_in = 8'h03;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'h7b)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
      end  
    #5;
      sbox_in = 8'h04;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'hf2)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
      end
    #5;
      sbox_in = 8'h05;
    
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'h6b)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
      end
    #5;
      sbox_in = 8'h06;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'h6f)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
      end
    #5;
      sbox_in = 8'h07;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'hc5)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
      end
    #5;
      sbox_in = 8'h08;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'h30)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
      end
    #5;
      sbox_in = 8'h09;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'h01)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
      end
    #5;
      sbox_in = 8'h0a;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'h67)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
        end
    #5;
      sbox_in = 8'h0b;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'h2b)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
        end
    #5;
      sbox_in = 8'h0c;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'hfe)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
        end
    #5;
      sbox_in = 8'h0d;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'hd7)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
        end
    #5;
      sbox_in = 8'h0e;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'hab)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
        end
    #5;
      sbox_in = 8'h0f;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'h76)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
        end
    #5;
      sbox_in = 8'h10;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'hca)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
        end
    #5;
      sbox_in = 8'h20;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'hb7)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
        end
    #5;
      sbox_in = 8'h30;
    #5
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'h04)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---");
        end
    #5;
      sbox_in = 8'h40;
    #5;
    $display("--------------------------------");
     $display(" sbox_in = %h ",sbox_in);
    if(sbox_out == 8'h09)
      begin
        $display(" sbox_out = sbox_expected = %h ",sbox_out);
        $display("---sbox_out is correct---");
        
      end
    else
      begin
        $display(" sbox_out <> sbox_expected ");
        $display("---sbox_out is incorrect---"); 
        end
        
      #1000 $finish;
  end
  
  sbox_combi
  ins2 (
  .en_or_de(enc),
  .sbox_in(sbox_in),
  .sbox_out(sbox_out)
  );
  
endmodule 