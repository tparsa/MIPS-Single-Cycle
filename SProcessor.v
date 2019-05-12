`timescale 1ns/1ns
module SProcessor(input rst, clk);
  
  wire memToReg, memRead, memWrite, writeReg, aluSrc, pcSrc, branchPcSrc, zero;
  wire [2: 0] aluOp;
  wire [1: 0] inWindow;
  wire [15: 0] instruction;
  
  DP dp(.rst(rst),
        .clk(clk),
        .memToReg(memToReg),
        .memRead(memRead),
        .memWrite(memWrite),
        .writeReg(writeReg),
        .aluSrc(aluSrc),
        .pcSrc(pcSrc),
        .branchPcSrc(branchPcSrc),
        .aluOp(aluOp),
        .inWindow(inWindow),
        .outInstruction(instruction),
        .zero(zero));
        
  controller cu(.instruction(instruction),
                .zero(zero),
                .memToReg(memToReg),
                .memRead(memRead),
                .memWrite(memWrite),
                .writeReg(writeReg),
                .aluSrc(aluSrc),
                .pcSrc(pcSrc),
                .branchPcSrc(branchPcSrc),
                .aluOp(aluOp),
                .outWindow(inWindow),
                .clk(clk),
                .rst(rst));
        
endmodule
  