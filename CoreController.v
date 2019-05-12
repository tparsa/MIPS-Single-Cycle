`timescale 1ns/1ns
module CoreCntroller(input [15: 0] instruction, output branch, memToReg, memRead, memWrite, writeReg, aluSrc, pcSrc, setWindow,
                 output [1: 0] inWindow, output [2: 0] aluOp);
  
  wire [3: 0] op = instruction[15: 12];
  wire [1: 0] ri = instruction[11: 10];
  wire [1: 0] rj = instruction[9: 8];
  wire [9: 0] adr10 = instruction[9: 0];
  wire [7: 0] adr8 = instruction[7: 0];
  
  assign branch = (op == 4'b0100);
  assign pcSrc = (op == 4'b0010);
  assign memToReg = (op == 4'b0000);
  assign memRead = memToReg;
  assign memWrite = (op == 4'b0001);
  assign writeReg = ((op == 4'b1000 && adr8[7: 6] == 2'b00) || op[3: 2] == 2'b11 || (op == 4'b0000 && instruction != 16'b0));
  assign aluSrc = (op[3: 2] == 2'b11);
  assign setWindow = (op == 4'b1000 && adr8[7] == 1'b1);
  assign inWindow = adr8[1: 0];
  
  assign aluOp = ((op == 4'b1000 && adr8[7] == 1'b0) ? (op == 4'b1000 && adr8[0] == 1'b1 ? 3'b000 :
                                                        op == 4'b1000 && adr8[1] == 1'b1 ? 3'b001 :
                                                        op == 4'b1000 && adr8[2] == 1'b1 ? 3'b010 :
                                                        op == 4'b1000 && adr8[3] == 1'b1 ? 3'b011 :
                                                        op == 4'b1000 && adr8[4] == 1'b1 ? 3'b100 :
                                                        op == 4'b1000 && adr8[5] == 1'b1 ? 3'b101 : 3'b000) :(op == 4'b1100 ? 3'b001:
                                                                                                             	op == 4'b1101 ? 3'b010:
                                                                                                              op == 4'b1110 ? 3'b011:
                                                                                                              op == 4'b1111 ? 3'b100:
                                                                                                              op == 4'b0100 ? 3'b010: 3'b000));
  
endmodule
