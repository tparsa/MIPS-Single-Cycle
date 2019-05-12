`timescale 1ns/1ns
module Window(input [1: 0] inWindow, input setWindow, rst, clk, output [1: 0] outWindow);
  
  reg [1: 0] window;
  
  always @(posedge clk, posedge rst) begin
    if(rst)
    begin
      window <= 2'b00;
      $display("FAK");
    end
    else if(setWindow)
      window <= inWindow;
    else
      window <= window;
  end
  
  assign outWindow = window;
  
endmodule