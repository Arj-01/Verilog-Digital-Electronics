
// hardware description of 16x1 mux using 4x1 mux then again degraded into 2x1;
//
//
//



// making 4x1 using 2x1 muxes

module mux_4x1 (out,in, sel);

input [3:0]in;
input [1:0]sel;

output out;

wire [1:0]t;

mux_2x1 M0 (t[0], in[3:2],sel[0] );                   // instantiation of module 
mux_2x1 M1 (t[1], in[1:0],sel[0] );                       // instantiation of module 
mux_2x1 M2 (out, t[1:0], sel[1] );                            // instantiation of module 

endmodule


// making 16x1 mux using 4x1 muxes

module mux_16x1 (out,in, sel);

input [15:0]in;
input [3:0]sel;

output out;

wire [3:0]t;

mux_4x1 M0 (t[0],in[15:12],sel[1:0]);               // instantiation of module 
mux_4x1 M1 (t[1], in[11:8],sel[1:0] );              // instantiation of module 
mux_4x1 M2 (t[2], in[7:4],sel[1:0] );               // instantiation of module 
mux_4x1 M3 (t[3], in[3:0],sel[1:0] );                    // instantiation of module 
mux_4x1 M4 (out, t[3:0], sel[3:2] );                         // instantiation of module 


endmodule


// end point hardware description of 2x1 mux.

module mux_2x1(out,in,sel);

input [1:0]in;
input sel;
output out;

wire [1:0]t;

and A (t[1],in[1], ~sel);
and B ( t[0],in[0], sel);
or C (out, t[1], t[0] );

endmodule