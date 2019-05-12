`timescale 1ns/1ns
module ALU(input [15: 0] a, b, input[2: 0] aluOperation, output reg [15: 0] aluResult, output zero);
  
  assign zero = (aluResult == 0);
  
  always @(*) begin
    aluResult = 16'b0;
    
    case(aluOperation)
      3'b000: aluResult = b;
      3'b001: aluResult = a + b;
      3'b010: aluResult = a - b;
      3'b011: aluResult = a & b;
      3'b100: aluResult = a | b;
      3'b101: aluResult = ~b;
      default: aluResult = 16'b0;
    endcase
    
  end
  
endmodule