
// testbench for the FIFO //
//`include "FIFO.v "
module FIFO_testbench;

reg clock;               // inputs
reg read;                // ''
reg write;
reg enable;
reg reset;
reg [15:0] data_In;

//all outputs
wire [15:0] data_Out;   
wire isEmpty;
wire isFull;
//Mentioning the unit under test

FIFO FIFO_data (clock, data_In, read, write, enable, data_Out, reset, isEmpty, isFull); 

// procedural block 1 for initializing the input data//

initial

begin

clock= 1'b1;
data_In = 16'h0000; 
read= 1'b0;
write = 1'b0;
enable = 1'b0;     // enable zero no functioning 
reset = 1'b1;      // reset the values 

  #10; 
  enable  = 1'b1;   // high enable circuit will start the functioning 
  reset  = 1'b1;   
  #10;
  reset  = 1'b0;
  write  = 1'b1;
  data_In  = 16'hAAAA;   // first write data 
  #10;
  data_In  = 16'h0001;   // second write data
  #10;
  data_In  = 16'h0002;   // third write data
  #10;
  data_In  = 16'h0003;   // forth 
  #10;
  data_In  = 16'h0004;   // fifth 
   #10;
  data_In  = 16'h0005;   // sixth 
   #10;
  data_In  = 16'h0006;   // seventh
   #10;
  data_In  = 16'h0007;   // eight
   #10;
   data_In  = 16'h0008;  // ninth
   #10;
   data_In  = 16'h0009;  // tenth


  ////// till now we have inserted 10 data values that is the maximum
  ////// capacity defined by us to explain the code.
  // till this point fifo is full hence it will stop writing and start reading the data
  // from the beginning that is the first data.
  // reading of the data will start

   #10;
   data_In=16'h0000;
   read=1'b1;
   write=1'b0;
   
   
  end

 // procedural block 2 for clock  // 

  initial 

  begin 
    repeat(40)                     // repetition of the clock 35 times
     #5 clock = ~clock;            
  end
 
 // everything can be read from the wavefroms i am attaching 

endmodule


// testbench ending //