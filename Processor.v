asdmodule SProcessor(input rst, clk);
  
  wire memToReg, memRead, memWrite, writeReg, aluSrc, pcSrc, branchPcSrc, zero;
  wire [2: 0] aluOp, inWindow;
  wire [15: 0] instruction;
  
  DP dp(.rst(rst),
        .clk(clk),
        .memToReg(memToReg),
        .memWrite(memWrite),
        .writeReg(writeReg),
        .aluSrc(aluSrc),
        .pcSrc(pcSrc),
        .branchPcSrc(branchPcSrc),
        .aluOp(aluOp),
        .inWindow(inWindow),
        .instruction(instruction),
        .zero(zero));
        
endmodule
