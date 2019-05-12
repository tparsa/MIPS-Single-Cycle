`timescale 1ns/1ns
module DataMemory(input [9: 0] address, input [15: 0] writeData, input clk, rst, memRead, memWrite, output [15: 0] readData);
  
  reg [15: 0] memory [0: 1023];
  
  integer i;
  always @(posedge rst) begin
    for (i = 0; i < 1024; i = i + 1)
      memory[i] = 16'b0;
  end
  
  assign readData = memRead ? memory[address] : 16'b0;
  initial begin
    #700;
    memory[500] = 16'b0000000000000001;
    memory[501] = 16'b0000000000000010;
    memory[502] = 16'b0000000000000011;
    memory[503] = 16'b0000000000000100;
    memory[504] = 16'b0000000000000101;
    memory[505] = 16'b0000000000000110;
    memory[506] = 16'b0000000000000111;
    memory[507] = 16'b0000000000001000;
    memory[508] = 16'b0000000000001001;
    memory[509] = 16'b0000000000001010;
  end
  always @(posedge clk) begin
    if(memWrite) 
      memory[address] <= writeData;
  end
  
endmodule
