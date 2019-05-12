`timescale 1ns/1ns
module RegFile(input [1: 0] readWriteReg, readReg, activeWnd, input [15: 0] writeData, input writeReg, clk, rst, 
                output [15:0] readData1, readData2);

  reg [15: 0] registers [0: 7];
 /* initial begin
    #700;
    registers[1] = 2;
    registers[2] = 3;
  end*/
  
  assign readData1 = registers[{activeWnd, 1'b0} + {1'b0, readWriteReg}];
  assign readData2 = registers[{activeWnd, 1'b0} + {1'b0, readReg}];
  
  integer i;
  
  always @(posedge clk, posedge rst) begin
    if(rst) begin
      for(i = 0; i < 8; i = i + 1)
        registers[i] = 16'b0;
    end
    else begin
      $display("here");
      if(writeReg)
      begin
        $display("there");
        registers[{activeWnd, 1'b0} + {1'b0, readWriteReg}] <= writeData;
      end
    end
      
  end
                
endmodule
  