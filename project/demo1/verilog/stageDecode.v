// decode stage
module stageDecode (CTRL_err, RF_err, RegWrite_out, WriteReg_out, DMemWrite, DMemEn, ALUSrc2, PCSrc, PCImm,
                    MemToReg, DMemDump, JumpRegEn, JumpAll, ReadData1, ReadData2, NextPC,
                    SetSelect, SEImm, Inst, SLBI, LBI, RegZ,
                    WriteData, WriteReg_in, RegWrite_in, clk, rst);

output [15:0] ReadData1, ReadData2;
output [15:0] SEImm;
output [2:0] SetSelect;
output [2:0] WriteReg_out; // register to be written to when this inst goes through writeback
output CTRL_err, RF_err, RegWrite_out, DMemWrite, DMemEn, ALUSrc2, PCSrc, PCImm, MemToReg;
output DMemDump, JumpRegEn, JumpAll, ALUSrc2, RegZ, SLBI, LBI;

input [15:0] WriteData, Inst, NextPC;
input [2:0] WriteReg_in;
input RegWrite_in;
input clk, rst;

wire [1:0] RegDst; // 00 - [4:2], 01 - [7:5], 10 - [10:8], 11 - Register $7
wire [2:0] SESel;
wire [15:0] JumpPC;

// controller
control ctrl(.err(CTRL_err), .RegDst(RegDst[1:0]), .SESel(SESel[2:0]),
             .RegWrite(RegWrite_out), .DMemWrite(DMemWrite),
             .ALUSrc2(ALUSrc2), .PCSrc(PCSrc), .PCImm(PCImm), .DMemDump(DMemDump),
             .MemToReg(MemToReg), .JumpRegEn(JumpRegEn), .DMemEn(DMemEn),.JumpAll(JumpAll),
             .SetSelect(SetSelect[2:0]), .RegZ(RegZ), .SLBI(SLBI), .LBI(LBI),
             .OpCode(Inst[15:11]), .Funct(Inst[1:0]));

assign WriteReg_out = RegDst[1] ? ( RegDst[0] ? (3'b111) : (Inst[10:8])) : //11, 10
                                  (RegDst[0] ? (Inst[7:5]) : (Inst[4:2])); //01, 00


assign JumpPC = RegDst[1] ? (RegDst[0] ? NextPC[15:0] : WriteData[15:0]) : WriteData[15:0];


// register file
rf rf0(.readData1(ReadData1[15:0]), .readData2(ReadData2[15:0]), .err(RF_err),
       .readReg1Sel(Inst[10:8]), .readReg2Sel(Inst[7:5]), .writeRegSel(WriteReg_in[2:0]),
       .writeData(JumpPC), .writeEn(RegWrite_in), .clk(clk), .rst(rst));

// sign extend for jump and imm Inst[10:0] --> 16-bit
/*always @(Inst)
casex (SESel[2:0])
  3'b000: begin SEImm[15:0] = ({5'b00000, Inst[10:0]}); end // Zero-Extend 5 bits
  3'b001: begin SEImm[15:0] = ({8'b00000000, Inst[7:0]}); end // Zero-Extend 8 bits
  3'b01X: begin SEImm[15:0] = ({{5{Inst[10]}}, Inst[10:0]}); end // Sign-Extend 5 bits
  3'b10X: begin SEImm[15:0] = ({{8{Inst[7]}}, Inst[7:0]}); end // Sign-Extend 8 bits
  3'b11X: begin SEImm[15:0] = ({{11{Inst[4]}}, Inst[4:0]}); end // Sign-Extend 11 bits
  default: begin SEImm[15:0] = 16'h0000; end// Set Imm to 0 TODO: we actually must throw an error per the rules.
endcase
*/
assign SEImm[15:0] = SESel[2] ? (SESel[1] ? ({{5{Inst[10]}}, Inst[10:0]}) : ({{8{Inst[7]}}, Inst[7:0]})) : //11X, 10X
				(SESel[1] ? ({{11{Inst[4]}}, Inst[4:0]}) : (SESel[0] ? ({8'b00000000, Inst[7:0]}) : ({11'h000, Inst[4:0]})));   //01X, //001, //000                                                  //0






endmodule
