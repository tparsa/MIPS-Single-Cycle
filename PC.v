`timescale 1ns/1ns
module PC(input clk, rst, input [15: 0] inPC, output reg[15: 0] outPC);
  
  always @(posedge clk, posedge rst) begin
    if(rst) 
      outPC <= 16'b0;
    else 
      outPC <= inPC;
  end
  
endmodule