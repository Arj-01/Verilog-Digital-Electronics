
module gen_blok(f,a,b);  
 
 parameter N=16;

 input [N-1:0] a,b;
 output [N-1:0] f;

 genvar p;

 generate for (p=0;p<N;p=p+1)

     begin 
       
       xor xg (f[p],a[p],b[p]);

     end
endgenerate

endmodule
       

module testbench;

reg [15:0]x,y;

wire [15:0]out;

gen_blok g1 (.f(out),.a(x),.b(y));

initial 

   begin 

     $monitor ($time, "out=%b,x=%b,y=%b",out,x,y);

     x=16'h0000;y=16'h0000;

     #10 x=16'h0000; y=16'h1111;
     #10 x=16'hffff; y=16'h0ddd;
     #10 $finish;
     end
endmodule