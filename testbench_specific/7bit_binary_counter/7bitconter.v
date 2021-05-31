module counter(reset, clk, count) ;
input reset, clk;

parameter N=7;

output reg [0:N] count;




always @(negedge clk or negedge reset)

  begin
     if (!reset)

      count<=0;

      else

      count<=count+1;

  end
 
endmodule







module testbench2;

reg clk,rst;
parameter N=7;
wire [7:0] count;

counter c1 (rst,clk,count);

initial clk=0;

always #1 clk=~clk;

initial 

begin
  
   rst=0;

   #4 rst =1;

   #20 rst =0;

   #30 rst =1;

   #10 $finish;

end



initial 

    begin 
     
     $monitor ($time , "count=%d",count);

     $dumpfile ("test_counter.vcd");
     $dumpvars (0,testbench2);

    end

    endmodule 



// another way of writing testbench..

module testbench;

reg clk,rst;
parameter N=7;
wire [7:0] count;

counter c1 (rst,clk,count);

initial 
  begin
    
    rst=0;
    clk=0;

    #5 rst =1;
  end

  always #5 clk=~clk;

  initial 

    begin 
     
     $monitor ($time , "count=%d",count);

     $dumpfile ("test_counter.vcd");
     $dumpvars (0,testbench);

     #100 $finish;

    end

    endmodule 