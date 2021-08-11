
// code starting


module FIFO(
clock, data_In, read, write, enable, data_Out, reset, isEmpty, isFull
    );
//defining input and output

input clock, read,write, enable, reset;               // inputs 1 bit each 
// 16 bits data input

input [15:0] data_In;                            
output isEmpty, isFull;

//16 bit output to read the data
output reg [15:0] data_Out;
reg [15:0] FIFO [0:9];

//we need to know about when FIFO is full or Empty for that we require counters
reg [3:0] Count = 0;
reg [3:0] readCount = 0;
reg [3:0] writeCount = 0;

//defining whether the FIFO is empty or full
assign isEmpty = (Count==0)?1'b1:1'b0;
assign isFull = (Count==10)?1'b1:1'b0;

//starting
always @ (posedge clock)
begin
if(enable==0); //enable should be 1 for the functioning of the fifo, incase fifo's enable is 0 it wont read/write;

else begin
// working of reset
      if(reset)
        begin
        readCount=0;    // reseting the readcount
        writeCount=0;    // reseting the writecount
        end



// if read is high and count of stored data is not zero then it will start reading the data stored in the fifo/queue 

      else if(read==1'b1 && Count!=0) 
         begin
         data_Out = FIFO[readCount];             // setting the data_out using the pointer where it is pointing
         readCount = readCount+1;                // we may call it as a pointer which will be incremented and using this we can access the next stored data for reading purpose.
         end




//if write is high and data count is less than ten (which is the max limit of data count we defined here) then it will start writing the data;
      else if(write==1'b1 && Count<10)
          begin
          FIFO[writeCount]=data_In;             // filling the fifos using the data_in provided by the user/machine;
          writeCount= writeCount+1;            // we may call it as a pointer which will be incremented and using this we can access the next place for writing purpose;
          end   
       else;
       end



// if any of writecount/readcount becomes 10 it will again get back to its usual working// 
if(writeCount==10) writeCount=0;
else if(readCount==10) readCount=0;
else;


// count value can be noted by taking the difference between the write access pointer and read access pointer;


if(readCount > writeCount) begin
  Count = readCount-writeCount;
  end
else if(readCount<writeCount) begin
  Count=writeCount-readCount;
  end
else;
end
endmodule
   



// ending the code//
