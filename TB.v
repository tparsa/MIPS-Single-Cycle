`timescale 1ns/1ns
module TB();
    
  reg rst = 0, clk = 0;
  always #500 clk = ~clk;
  
  SProcessor sp(rst, clk);
  
  initial begin
    #20 rst = 1;
    #600 rst = 0;
    #48000 $stop;
  end
  
endmodule