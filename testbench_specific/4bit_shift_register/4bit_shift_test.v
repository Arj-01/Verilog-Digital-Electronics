module shiftreg (A,clk,clear,E);

input clk,A,clear;
output reg E;

reg B,C,D;

always @(posedge clk or negedge clear)

 begin 
   
   if (!clear)
     
     begin
     B<=0;
      C<=0;
       D<=0;
        E<=0;
        end
    else
    begin 
     E<=D;
     D<=C;
     C<=B;
     B<=A;
     end
 end    

 endmodule


module testbench;

reg a,clr,clk;
wire e;

shiftreg sr (clk,clr,a,e);

initial 

 begin  
   
  clk=0; #2 clr =0; #5 clr=1;
   end

always #5 clk=~clk;

initial
  begin
   #2 
     a=1;
   #10 a=0;
   #10 a=1;
   #10 a=0;
   #10 a=1;

  end

  initial 

  begin
    $dumpfile("4bitreg.vcd");
    $dumpvars(0,testbench);
    #100 $finish;
  end

   endmodule




   