module full_adder(a,b,c,sum,count);

input a,b,c;
output sum,count;

wire t1,t2,t3;


xor x1(t1,a,b), x2(sum,t1,c);
and a1(t3,t1,c), a2(t2,a,b);
or o1 (cout, t3, t2);

endmodule;

// now will use above concept to generate multiple ripple adder using generate block/keyboard;

module gen_block(a,b,c_in,sum,c_out);

parameter N=16;

input [N-1:0]a,b;
input c_in;
output [N-1:0]sum;
output c_out;

wire [N:0] carry;


assign carry[0] = c_in;
assign carry[N] = c_out;

genvar i;


generate for (i=0;i<N;i=i+1)

   begin 
     wire t1,t2,t3;

     xor x1(t1,a[i],b[i]), x2(sum[i],t1,carry[i]);
     and a1(t3,t1,carry[i]), a2(t2,a[i],b[i]);
     or o1 (carry[i+1], t3, t2);
  
  end

endgenerate

endmodule


// testbench


module testbench;

reg [15:0]x,y;

wire [15:0]sum;
wire cin,cout;

gen_block b1 (x,y,cin,sum,cout);

initial 

   begin
      $monitor ($time , "sum=%b, cout=%b",sum,cout);
      cin=0;
      x=16'h1111;y=16'h1111;

      #10 $finish;
   end

endmodule