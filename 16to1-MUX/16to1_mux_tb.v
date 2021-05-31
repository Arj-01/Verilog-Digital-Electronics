
`include "16to1_mux.v"                              

module testbench ;

reg [15:0]A;                                        // reg type variable ...cuz defined at LHS within (begin end) 
reg [3:0]S;                                           // reg type variable ...cuz defined at LHS within (begin end) 

wire O;

mux_16x1 M ( .out (O) ,.in(A), .sel(S));

initial

  begin 

    $dumpfile ("mux1.vcd");
    $dumpvars (0, testbench );

    $monitor ($time, "A=%h, S=%h, O=%b", A,S,O );       // monitor print values whenever any value defined within monitor changes.... other wise it wont print.... smart printer..
                                                        
    #5 A = 16'hA110; S=1;                                // $time print system's simulation time.
    #6 S=3;
    #7 S=4;
    #7 S=5;
    #7 S=8;
    #7 S=9;
    #5 $finish;
    end
  

endmodule



