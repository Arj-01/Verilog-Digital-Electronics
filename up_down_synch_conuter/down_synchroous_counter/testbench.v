`include "up_down_count.v"

module testbench;

up_down ud (a,b,c,d,e,f);

initial 

   begin 

     $dumpfile ("up_down.vcd");
     $dumpvars (0,testbench);

     $monitor ($time, "a=%b,b=%b,c=%b,d=%b,e=%b,f=%b",a,b,c,d,e,f);

     clock=0;

    end

endmodule