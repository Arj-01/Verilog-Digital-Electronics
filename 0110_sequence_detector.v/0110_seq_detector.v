module seq_dec(clock, x, z);

input clock, x;

output reg z;

reg [0:2] state;

parameter s0=1'b1, s1=1'b0, s2=2'b01, s3=3'b011;

always @ (posedge clock)

 case (state)
   
   s0: state<=x ? s0 : s1;
   s1 : state<=x ? s2 :s1;
   s2 : state<=x ? s3:s1;
   s3 : state<=x ? s0:s1;
   
   

   default : state<=s0;

  

   endcase

always @(state)
 
 case (state)
   
   s3 : z= x ? 0:1;

   default: z=0;

   endcase
  

  endmodule


  /// testbench

  module testbench;

  reg clk, x;

  output z;

  seq_dec s1 (clk, x, z);

  initial 

  begin
   clk=1'b0;
   x=0;
   
   end
   always #5 clk=~clk;


   initial
    begin
       #12 x=1'b0; 
       #10 x=0;
       #10 x=1;
       #10 x=1;
       #10 x=0;
       #10 x=0;
       #10 x=1;
        
      
    end
   
 initial 

  begin
    
    $monitor ($time, "x=%b, z=%b,clk=%b", x,z,clk);
    $dumpfile ("0110.vcd");
    $dumpvars (0,testbench);
    #105
     $finish;
  end
   
   endmodule