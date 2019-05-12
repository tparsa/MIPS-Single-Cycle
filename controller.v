`timescale 1ns/1ns
module controller(input [15: 0] instruction, input zero, output memToReg, memRead, memWrite, writeReg, aluSrc, pcSrc, branchPcSrc,
                  output [2: 0] aluOp, output [1: 0] outWindow, input clk, rst);
  wire [1: 0] inWindow;
  CoreCntroller ccu(instruction,  branch, memToReg, memRead, memWrite, writeReg, aluSrc, pcSrc, setWindow, inWindow, aluOp);
  Window wind(.inWindow(inWindow),
              .clk(clk),
              .rst(rst),
              .setWindow(setWindow),
              .outWindow(outWindow));
  assign branchPcSrc = (branch & zero);
              
endmodule
