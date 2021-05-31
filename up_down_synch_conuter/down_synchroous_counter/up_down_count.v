module up_down (d_in,clock,clr,mode,count,ld);

input [7:0]d_in;
input clock, clr,mode,ld;
output reg [7:0] count;



always @ (posedge clock)

  begin
   

    if (mode)
      
      count = count+1;

    else if (ld)

      count = d_in;

    else if(clr)
       
       count =0;

    else 
       count= count -1;

  end

endmodule 