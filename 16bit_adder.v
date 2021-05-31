module bit16_adder
(

in1, in2, out, carry

);

input [15:0]in1,in2;

output [15:0] out;
output carry;

wire [2:0] c_out;


bit4_adder A0 (in1[3:0],in2[3:0],out[3:0], 1'b0, c_out[0]);
bit4_adder A1 (in1[7:4],in2[7:4],out[7:4], c_out[0], c_out[1]);
bit4_adder A2 (in1[11:8],in2[11:8],out[11:8],c_out[1], c_out[2]);
bit4_adder A3 (in1[15:12],in2[15:12],out[15:12],c_out[2], carry);



endmodule



module bit4_adder 
 (
     in1, in2, out, c_in, c_out
 );

 input [3:0]in1, in2; input c_in;
 output [3:0] out;    output c_out;

 wire c1,c2,c3;
 
  
   f_adder h1 (in1[0], in2[0], out[0],c_in, c1);
   f_adder h2 (in1[1], in2[1], out[1],c1, c2);
   f_adder h3 (in1[2], in2[2], out[2],c2, c3);
   f_adder h4 (in1[3], in2[3], out[3],c3, c_out);

 endmodule

 

 module f_adder
 (
 
 in1, in2, y, c_in, c_out

 );

 input in1, in2, c_in;
 output y, c_out;

wire t1,t2,t3;

xor n1 (t1,in1, in2), n2(y,t1,c_in);
and a1 (t2, c_in, t1), a2 (t3,in1,in2);
or (c_out, t2,t3);

endmodule




 
























