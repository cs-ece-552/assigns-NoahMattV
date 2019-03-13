// execute
module stageExecute (
                //Control
                ALUSrc2,
                Branch,
                JumpRegEn,
                JumpAll,
                RegZ,
                SLBI, LBI,
                DMemWriteIn, DMemWriteOut,
                DMemEnIn, DMemEnOut,
                DMemDumpIn, DMemDumpOut,
                RegWriteIn, RegWriteOut,
                MemToRegIn, MemToRegOut,
                WriteRegIn, WriteRegOut,
                SetSelectIn, SetSelectOut,
                 //inputs
                   //Other
                   ReadData1,
                   ReadData2,
                   SEImm,
                   Inst,
                   PCIn,
                   clk,
                   rst,
                 //outputs
                   ReadData2Out,
                   PCOut,
                   Neg,
                   Zero,
                   Cout,
                   Overflow,
                   ALUResult

  );

  output [15:0] ReadData2Out, PCOut, ALUResult;
  output [2:0] WriteRegOut, SetSelectOut;
  output DMemWriteOut, DMemEnOut, DMemDumpOut, RegWriteOut, MemToRegOut;
  output Neg, Zero, Cout, Overflow;

  input [15:0] ReadData1, ReadData2, SEImm, Inst, PCIn;
  input [2:0] WriteRegIn, SetSelectIn;
  input DMemWriteIn, DMemEnIn, DMemDumpIn, RegWriteIn, MemToRegIn, clk, rst;
  input ALUSrc2, Branch, JumpRegEn, JumpAll, RegZ, SLBI, LBI;

  wire inva, invb, sign, cin; //ALU Control Signals
  wire [3:0] alu_op; //ALU Control Signals
  wire [15:0] rd1a, rd1b; //Read Data 1
  wire [15:0] rd2a, rd2b; //Read Data 2
  wire [15:0] addin1, addout; //add offset wires
  wire branchCond;
  wire a, b;



  //Pass Signals to Mem
  assign DMemWriteOut = DMemWriteIn;
  assign DMemEnOut = DMemEnIn;
  assign DMemDumpOut = DMemDumpIn;
  assign RegWriteOut = RegWriteIn;
  assign MemToRegOut = MemToRegIn;
  assign WriteRegOut = WriteRegIn;
  assign SetSelectOut = SetSelectIn;
  assign ReadData2Out = ReadData2;

  alu_control c0( .aluFunc(alu_op), .invA(inva), .invB(invb), .sign(sign), .Cin(cin), .err(), .OpCode(Inst[15:11]), .Funct(Inst[1:0]));

  //Read Data 1 Muxes
  assign rd1a = SLBI ? ReadData1 << 8 : ReadData1;
  assign rd1b = LBI ? 16'h0000 : rd1a;


  //Read Data 2 Muxes
  assign rd2a = ALUSrc2 ? SEImm : ReadData2;
  assign rd2b = RegZ ? 16'h0000 : rd2a;

  alu a0( .A(rd1b), .B(rd2b), .Cin(cin), .Cout(Cout), .Op(alu_op), .invA(inva), .invB(invb), .sign(sign), .Out(ALUResult), .Zero(Zero), .Neg(Neg), .Ofl(Overflow));

  //Branch and Jump Calculation
  assign addin1 = JumpRegEn ? ReadData1 : PCIn;
  assign addout = SEImm + addin1;

  //Check Branch Conditions
  /*
  always @(Inst)
  case (Inst[12:11])
    2'b00: begin branchCond = ~Zero; end
    2'b01: begin branchCond = Zero; end
    2'b10: begin branchCond = ~Zero & Neg; end
    2'b11: begin branchCond = ~Neg; end // Register $7
    default: begin branchCond = 1'b0; end
  endcase
  */

  //Branch Cond Muxes
  assign a  = Inst[12] ? ~Neg : Zero; //11, //01
  assign b  = Inst[12] ? ((~Zero) & Neg) : ~Zero; //10, //00
  assign branchCond = Inst[11] ? a : b; //


  assign PCOut = ((branchCond & Branch) | JumpAll)  ? addout : addin1;

  endmodule
