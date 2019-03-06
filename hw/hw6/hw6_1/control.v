/*
   CS/ECE 552, Spring '19
   Homework #6, Problem #1

   This module determines all of the control logic for the processor.
*/
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
                Jump,
                // Inputs
                OpCode,
                Funct
                );

   // inputs
   input [4:0]  OpCode;
   input [1:0]  Funct;

   // outputs
   output reg      err;
   output  reg     RegWrite, DMemWrite, DMemEn, ALUSrc2, PCSrc,
                PCImm, MemToReg, DMemDump, Jump;
   output reg [1:0] RegDst;
   output reg [2:0] SESel;

   /* YOUR CODE HERE */

   always @(OpCode or Funct)
    casex ({OpCode, Funct})
    7'b0100?_?? : begin err = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b01; SESel = 3'b01?; end // SUBI, ADDI
    7'b0101?_?? : begin err = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b01; SESel = 3'b000; end // ANDNI, XORI
    7'b101??_?? : begin err = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b01; SESel = 3'b???; end // ROLI, SLLI, RORI, SRLI
    7'b10000_?? : begin err = 0; RegWrite = 0; DMemWrite = 1; DMemEn = 1; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b??; SESel = 3'b01?; end //ST
    7'b10001_?? : begin err = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 1; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 1; DMemDump = 0; Jump = 0; RegDst = 2'b01; SESel = 3'b01?; end //LD
    7'b10011_?? : begin err = 0; RegWrite = 0; DMemWrite = 1; DMemEn = 1; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b??; SESel = 3'b01?; end //STU
    7'b11000_?? : begin err = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b10; SESel = 3'b10?; end // LBI (before R-type in case)
    7'b11???_?? : begin err = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 1; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b00; SESel = 3'b???; end // R-type
    7'b011??_?? : begin err = 0; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 1; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b??; SESel = 3'b10?; end // Branch
    7'b10010_?? : begin err = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b10; SESel = 3'b001; end // SLBI
    7'b00100_?? : begin err = 0; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 1; PCImm = 1; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b??; SESel = 3'b11?; end // J
    7'b00101_?? : begin err = 0; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 1; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 1; RegDst = 2'b??; SESel = 3'b10?; end // JR
    7'b00110_?? : begin err = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 1; PCImm = 1; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b11; SESel = 3'b11?; end // JAL
    7'b00111_?? : begin err = 0; RegWrite = 1; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 1; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 1; RegDst = 2'b11; SESel = 3'b10?; end // JALR
    7'b00000_?? : begin err = 0; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 1; Jump = 0; RegDst = 2'b??; SESel = 3'b???; end // HALT
    7'b00001_?? : begin err = 0; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b??; SESel = 3'b???; end // NOP
    7'b00010_?? : begin err = 0; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b??; SESel = 3'b???; end // SIIC
    default     : begin err = 0; RegWrite = 0; DMemWrite = 0; DMemEn = 0; ALUSrc2 = 0; PCSrc = 0; PCImm = 0; MemToReg = 0; DMemDump = 0; Jump = 0; RegDst = 2'b??; SESel = 3'b???; end // Default
    endcase

endmodule
