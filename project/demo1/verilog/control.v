/*
   CS/ECE 552, Spring '19
   Homework #6, Problem #1

   This module determines all of the control logic for the processor.
*/

// Added SetSelect 3/11/2019 9:06 PM
module control (/*AUTOARG*/
                // Outputs
                err,
                RegDst,
                SESel,
                RegWrite,
                DMemWrite,
                DMemEn,
                ALUSrc2,
                PCSrc,
                PCImm,
                MemToReg,
                DMemDump,
                JumpRegEn,
                JumpAll,
                SetSelect,
                RegZ,
                SLBI, LBI,
                // Inputs
                OpCode,
                Funct
                );

   // inputs
   input [4:0]  OpCode;
   input [1:0]  Funct;

   // outputs
   output reg      err;
   output reg     RegWrite, DMemWrite, DMemEn, ALUSrc2, PCSrc, RegZ, SLBI, LBI;
   output reg     PCImm, MemToReg, DMemDump, JumpRegEn, JumpAll;
   output reg [1:0] RegDst;
   output reg [2:0] SESel;
   output reg [2:0] SetSelect;

   /* YOUR CODE HERE */

   //TODO: Add RegZ and Branch


   always @(OpCode or Funct)
    casex ({OpCode, Funct})
    7'b00011_?? : begin err = 0; JumpAll = 0; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b00; SESel = 3'b000; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end // Error
    7'b0100?_?? : begin err = 0; JumpAll = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 1; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b01; SESel = 3'b010; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end // SUBI, ADDI
    7'b0101?_?? : begin err = 0; JumpAll = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 1; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b01; SESel = 3'b000; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end // ANDNI, XORI
    7'b101??_?? : begin err = 0; JumpAll = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 1; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b01; SESel = 3'b000; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end // ROLI, SLLI, RORI, SRLI
    7'b10000_?? : begin err = 0; JumpAll = 0; RegWrite = 0; DMemWrite = 1; DMemEn = 1; ALUSrc2 = 1; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b00; SESel = 3'b010; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end //ST
    7'b10001_?? : begin err = 0; JumpAll = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 1; ALUSrc2 = 1; PCSrc = 0; PCImm = 0; MemToReg = 1; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b01; SESel = 3'b010; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end //LD
    7'b10011_?? : begin err = 0; JumpAll = 0; RegWrite = 1; DMemWrite = 1; DMemEn = 1; ALUSrc2 = 1; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b10; SESel = 3'b010; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end //STU
    7'b11000_?? : begin err = 0; JumpAll = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 1; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b10; SESel = 3'b100; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 1; end // LBI (before R-type in case)
    7'b11???_?? : begin err = 0; JumpAll = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b00; SESel = 3'b000; SetSelect = (OpCode [2:0]); RegZ = 0; SLBI = 0; LBI = 0; end // R-type
    7'b011??_?? : begin err = 0; JumpAll = 0; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 1; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b00; SESel = 3'b100; SetSelect = 3'b000; RegZ = 1; SLBI = 0; LBI = 0; end // Branch
    7'b10010_?? : begin err = 0; JumpAll = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 1; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b10; SESel = 3'b001; SetSelect = 3'b000; RegZ = 0; SLBI = 1; LBI = 0; end // SLBI
    7'b00100_?? : begin err = 0; JumpAll = 1; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 1; PCImm = 1; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b00; SESel = 3'b110; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end // J
    7'b00101_?? : begin err = 0; JumpAll = 1; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 1; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 1; RegDst = 2'b00; SESel = 3'b100; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end // JR
    7'b00110_?? : begin err = 0; JumpAll = 1; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 1; PCImm = 1; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b11; SESel = 3'b110; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end // JAL
    7'b00111_?? : begin err = 0; JumpAll = 1; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 1; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 1; RegDst = 2'b11; SESel = 3'b100; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end // JALR
    7'b00000_?? : begin err = 0; JumpAll = 0; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 1; JumpRegEn = 0; RegDst = 2'b00; SESel = 3'b000; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end // HALT
    7'b00001_?? : begin err = 0; JumpAll = 0; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b00; SESel = 3'b000; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end // NOP
    7'b00010_?? : begin err = 0; JumpAll = 0; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b00; SESel = 3'b000; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end // SIIC
    default     : begin err = 0; JumpAll = 0; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; JumpRegEn = 0; RegDst = 2'b00; SESel = 3'b000; SetSelect = 3'b000; RegZ = 0; SLBI = 0; LBI = 0; end // Default
    endcase

endmodule
