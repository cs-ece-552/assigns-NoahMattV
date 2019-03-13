/* $Author: karu $ */
/* $LastChangedDate: 2009-03-04 23:09:45 -0600 (Wed, 04 Mar 2009) $ */
/* $Rev: 45 $ */
module proc (/*AUTOARG*/
   // Outputs
   err,
   // Inputs
   clk, rst
   );

   input clk;
   input rst;

   output err;

   // None of the above lines can be modified

   // OR all the err ouputs for every sub-module and assign it as this
   // err output

   // As desribed in the homeworks, use the err signal to trap corner
   // cases that you think are illegal in youinst, NextPC, PCOverflow, BranchPC, PCSrc, createdump, clk, rstr statemachines


   /* your code here */

   //wires to pass instruction values bewteen Fetch and Decode stages
   wire PCOverflow, CTRL_err, RF_err, dump;
   wire [15:0] inst, NextPC, BranchPC, data_in; // NextPC is PC + 2
   //wires to pass control and data values bewteen Decode and Execute stages
   wire [15:0] ReadData1_DtoX, ReadData2_DtoX, SEImm;
   wire [2:0] WriteReg_DtoX, SetSelect_DtoX;
   wire RegWrite_DtoX, DMemWrite_DtoX, DMemEn_DtoX, ALUSrc2_DtoX, PCSrc_DtoX;
   wire PCImm_DtoX, MemToReg_DtoX, DMemDump_DtoX, JumpRegEn_DtoX, JumpAll_DtoX;
   wire RegZ_DtoX, SLBI_DtoX, LBI_DtoX;
   //wires to pass control and data values bewteen Execute and Memory stages
   wire [15:0] ALUResult_XtoM, ReadData2_XtoM;
   wire [2:0] WriteReg_XtoM,  SetSelect_XtoM;
   wire [3:0] ALUFlags_XtoM;
   wire DMemWrite_XtoM, DMemEn_XtoM, DMemDump_XtoM, RegWrite_XtoM, MemToReg_XtoM;
   //wires to pass control and data values bewteen mem and writeback stages
   wire [15:0] ALUResult_MtoW, DMemOutData_MtoW;
   wire [2:0] WriteReg_MtoW;
   wire MemToReg_MtoW, RegWrite_MtoW;
   //wires to pass reg control and data values bewteen Writeback and decode stages
   wire [15:0] WriteData_WtoD;
   wire [2:0] WriteReg_WtoD;
   wire RegWrite_WtoD;

  stageFetch fetch(.inst(inst), .NextPC(NextPC), .PCOverflow(PCOverflow),
   .BranchPC(BranchPC[15:0]), .PCSrc(PCSrc_DtoX), .createdump(DMemDump), .clk(clk), .rst(rst)); //Update PCSrc for pipeline

   stageDecode decode(
                      // Error flags
                      .CTRL_err(CTRL_err), .RF_err(RF_err),
                      .NextPC(NextPC),
                      // Decode to Execute
                      .RegWrite_out(RegWrite_DtoX), .WriteReg_out(WriteReg_DtoX[2:0]),
                      .DMemWrite(DMemWrite_DtoX), .DMemEn(DMemEn_DtoX),
                      .ALUSrc2(ALUSrc2_DtoX), .PCSrc(PCSrc_DtoX),
                      .PCImm(PCImm_DtoX), .MemToReg(MemToReg_DtoX), .DMemDump(DMemDump_DtoX),
                      .JumpRegEn(JumpRegEn_DtoX), .JumpAll(JumpAll_DtoX),
                      .ReadData1(ReadData1_DtoX[15:0]), .ReadData2(ReadData2_DtoX[15:0]),
                      .SetSelect(SetSelect_DtoX[2:0]), .RegZ(RegZ_DtoX), .SLBI(SLBI_DtoX),
                      .SEImm(SEImm[15:0]), .LBI(LBI_DtoX),
                      .Inst(inst[15:0]),

                      // Writeback to Decode
                      .WriteData(WriteData_WtoD[15:0]),
                      .WriteReg_in(WriteReg_WtoD[2:0]), .RegWrite_in(RegWrite_WtoD),

                      .clk(clk), .rst(rst));

   stageExecute execute(
                   //Control
                   .ALUSrc2(ALUSrc2_DtoX),
                   .Branch(PCSrc_DtoX & ~JumpAll_DtoX),
                   .JumpRegEn(JumpRegEn_DtoX),
                   .JumpAll(JumpAll_DtoX),
                   .RegZ(RegZ_DtoX),
                   .SLBI(SLBI_DtoX), .LBI(LBI_DtoX),
                   .DMemWriteIn(DMemWrite_DtoX), .DMemWriteOut(DMemWrite_XtoM),
                   .DMemEnIn(DMemEn_DtoX), .DMemEnOut(DMemEn_XtoM),
                   .DMemDumpIn(DMemDump_DtoX), .DMemDumpOut(DMemDump_XtoM),
                   .RegWriteIn(RegWrite_DtoX), .RegWriteOut(RegWrite_XtoM),
                   .MemToRegIn(MemToReg_DtoX), .MemToRegOut(MemToReg_XtoM),
                   .WriteRegIn(WriteReg_DtoX[2:0]), .WriteRegOut(WriteReg_XtoM[2:0]),
                   .SetSelectIn(SetSelect_DtoX[2:0]), .SetSelectOut(SetSelect_XtoM[2:0]),
                    //inputs
                      //Other
                      .ReadData1(ReadData1_DtoX[15:0]),
                      .ReadData2(ReadData2_DtoX[15:0]),
                      .SEImm(SEImm[15:0]),
                      .Inst(inst[15:0]),
                      .PCIn(NextPC[15:0]),
                      .clk(clk),
                      .rst(rst),
                    //outputs
                      .ReadData2Out(ReadData2_XtoM[15:0]),
                      .PCOut(BranchPC[15:0]),
                      .Neg(ALUFlags_XtoM[1]), // Double-check to make sure these are the correct ones.
                      .Zero(ALUFlags_XtoM[0]),
                      .Cout(ALUFlags_XtoM[2]),
                      .Overflow(ALUFlags_XtoM[3]),
                      .ALUResult(ALUResult_XtoM[15:0]));


   stageMemory memory(.ALUResultIn(ALUResult_XtoM[15:0]), .ALUResultOut(ALUResult_MtoW[15:0]),
                      .WriteRegIn(WriteReg_XtoM[2:0]), .WriteRegOut(WriteReg_MtoW[2:0]),
                      .RegWriteIn(RegWrite_XtoM), .RegWriteOut(RegWrite_MtoW),
                      .MemToRegIn(MemToReg_XtoM), .MemToRegOut(MemToReg_MtoW),
                      .SetSelect(SetSelect_XtoM[2:0]),
                      .ReadData2(ReadData2_XtoM[15:0]), .ALUFlags(ALUFlags_XtoM[3:0]),
                      .DMemWrite(DMemWrite_XtoM), .DMemEn(DMemEn_XtoM), .DMemDump(DMemDump_XtoM),
                      .DMemOutData(DMemOutData_MtoW[15:0]),
                      .clk(clk), .rst(rst));

   stageWriteback writeback(.DMemOutData(DMemOutData_MtoW[15:0]), .ALUResult(ALUResult_MtoW[15:0]), .MemToReg(MemToReg_MtoW),
                            .WriteRegIn(WriteReg_MtoW[2:0]), .WriteRegOut(WriteReg_WtoD[2:0]),
                            .RegWriteIn(RegWrite_MtoW), .RegWriteOut(RegWrite_WtoD),
                            .result(WriteData_WtoD));

   assign err = (PCOverflow | CTRL_err | RF_err);
endmodule // proc
// DUMMY LINE FOR REV CONTROL :0:
