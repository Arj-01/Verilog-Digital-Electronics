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

reg a,clear,clk;
wire e;

shiftreg sr (a,clk,clear,e);

initial 

 begin  
   
   $monitor ($time, "a=%b, clear =%b, clk = %b,e =%b", a,clear,clk,e);
  
    a=1; clk=0; clear=0;

    #5 clear=1;clk=1;

    repeat(10) #5 clk = ~clk;

   
   #30 $finish;

  
   end

   endmodule