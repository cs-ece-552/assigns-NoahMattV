/*
   CS/ECE 552, Spring '19
   Homework #6, Problem #1

   This module determines all of the control logic for the processor.
*/
module alu_control (/*AUTOARG*/
                // Outputs
                aluFunc,
                invA,
                invB,
                sign,
                Cin,
                err,
                // Inputs
                OpCode,
                Funct
                );

   // inputs
   input [4:0]  OpCode;
   input [1:0]  Funct;

   // outputs
   output reg [3:0] aluFunc;
   output reg err, sign, invB;

   output invA, Cin;

   /* YOUR CODE HERE */
   assign invA = 1'b0;
   assign Cin = 1'b0;


   always @(OpCode or Funct)
    casex ({OpCode, Funct})
    7'b00011_?? : begin err = 0; aluFunc=4'b????; sign = 1'b?; invB = 0; end // Error
    7'b01000_?? : begin err = 0; aluFunc=4'b1000; sign = 1'b1; invB = 0; end // SUBI
    7'b01001_?? : begin err = 0; aluFunc=4'b0000; sign = 1'b1; invB = 0; end // ADDI
    7'b01010_?? : begin err = 0; aluFunc=4'b0001; sign = 1'b1; invB = 1; end // ANDNI
    7'b01011_?? : begin err = 0; aluFunc=4'b0011; sign = 1'b1; invB = 0;end // XORI
    7'b10100_?? : begin err = 0; aluFunc=4'b0100; sign = 1'b1; invB = 0;end // ROLI
    7'b10101_?? : begin err = 0; aluFunc=4'b0101; sign = 1'b1; invB = 0;end // SLLI
    7'b10110_?? : begin err = 0; aluFunc=4'b0110; sign = 1'b1; invB = 0;end // RORI
    7'b10111_?? : begin err = 0; aluFunc=4'b0111; sign = 1'b1; invB = 0;end // SRLI
    7'b1000?_?? : begin err = 0; aluFunc=4'b0000; sign = 1'b1; invB = 0;end //ST, LD
    7'b10011_?? : begin err = 0; aluFunc=4'b0000; sign = 1'b1; invB = 0;end //STU
    7'b11000_?? : begin err = 0; aluFunc=4'b0000; sign = 1'b1; invB = 0;end // LBI (before R-type in case)
    7'b11001_?? : begin err = 0; aluFunc=4'b1101; sign = 1'b1; invB = 0;end // BTR
    7'b11011_00 : begin err = 0; aluFunc=4'b0000; sign = 1'b1; invB = 0;end // R-type ADD
    7'b11011_01 : begin err = 0; aluFunc=4'b1000; sign = 1'b1; invB = 0;end // R-type SUB
    7'b11011_10 : begin err = 0; aluFunc=4'b0011; sign = 1'b1; invB = 0;end // R-type XOR
    7'b11011_11 : begin err = 0; aluFunc=4'b0001; sign = 1'b1; invB = 1;end // R-type ANDN
    7'b11010_00 : begin err = 0; aluFunc=4'b0100; sign = 1'b1; invB = 0;end // R-type ROL
    7'b11010_01 : begin err = 0; aluFunc=4'b0101; sign = 1'b1; invB = 0;end // R-type SLL
    7'b11010_10 : begin err = 0; aluFunc=4'b0110; sign = 1'b1; invB = 0;end // R-type ROR
    7'b11010_11 : begin err = 0; aluFunc=4'b0111; sign = 1'b1; invB = 0;end // R-type SRL
    7'b001??_?? : begin err = 0; aluFunc=4'b0000; sign = 1'b1; invB = 0;end // J, JR, JAL, JALR
    7'b011??_?? : begin err = 0; aluFunc=4'b0000; sign = 1'b1; invB = 0;end // Branch
    7'b10010_?? : begin err = 0; aluFunc=4'b0010; sign = 1'b1; invB = 0;end // SLBI
    7'b11111_?? : begin err = 0; aluFunc=4'b0000; sign = 1'b1; invB = 0;end // SEQ, SLT, SLE, SCO
    7'b111??_?? : begin err = 0; aluFunc=4'b1000; sign = 1'b1; invB = 0;end // SEQ, SLT, SLE, SCO
    7'b00000_?? : begin err = 0; aluFunc=4'b0000; sign = 1'b0; invB = 0;end // HALT
    7'b00001_?? : begin err = 0; aluFunc=4'b0000; sign = 1'b0; invB = 0;end // NOP
    7'b00010_?? : begin err = 0; aluFunc=4'b0000; sign = 1'b0; invB = 0;end // SIIC
    default     : begin err = 0; aluFunc=4'b0000; sign = 1'b0; invB = 0;end // Default
    endcase

endmodule
