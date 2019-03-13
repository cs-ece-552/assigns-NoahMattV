// memory Stage
module stageMemory(ALUResultIn, ALUResultOut,
                   ReadData2, ALUFlags,
                   WriteRegIn, WriteRegOut,
                   RegWriteIn, RegWriteOut,
                   DMemWrite, DMemEn, DMemDump,
                   DMemOutData,
                   MemToRegIn, MemToRegOut,
                   SetSelect,
                   clk, rst);
  input [15:0] ALUResultIn, ReadData2;
  input [2:0] WriteRegIn, SetSelect;
  input [3:0] ALUFlags; //Assume Zero=ALUFlags[0], Neg=ALUFlags[1], Cout=ALUFlags[2], Ofl = ALUFlags[3]
  //SetSelect[2]=0 means use ALUResult =1 mean use SetResult
  //SetSelect[1:0]=00 -> SEQ
  input MemToRegIn; //00=SEQ, 01=SLT, 10=SLE, 11=SCO
  input RegWriteIn, DMemWrite, DMemEn, DMemDump;  //control signals
  input clk, rst;

  output [15:0] DMemOutData, ALUResultOut;
  output [2:0] WriteRegOut;
  output  MemToRegOut; //should I assign set values to ALUResult so this doesn't have to be two bits?
  output RegWriteOut;

  wire sltORseq, scoOrsle, SetResult;

  //pass unused ctrl sigs and data values through Mem Stage
  assign WriteRegOut[2:0] = WriteRegIn[2:0];
  assign MemToRegOut = MemToRegIn;
  assign RegWriteOut = RegWriteIn;

  //instantiate memory module
  memory2c mem (.data_out(DMemOutData[15:0]), .data_in(ReadData2[15:0]),
                .addr(ALUResultIn[15:0]), .enable(DMemEn), .wr(DMemWrite),
                .createdump(DMemDump), .clk(clk), .rst(rst));

  //Set Value muxes
  assign sltORseq = SetSelect[0] ? (~ALUFlags[1] ^ ALUFlags[3] ^ ALUFlags[0]) : (ALUFlags[0]);
  assign scoOrsle = SetSelect[0] ? ALUFlags[2] : ((~ALUFlags[1] & ~ALUFlags[0]) ^ ALUFlags[3] ^ ALUFlags[0]);
  assign SetResult = SetSelect[1] ? scoOrsle : sltORseq;

  assign ALUResultOut[15:0] = SetSelect[2] ? {15'b0, SetResult} : ALUResultIn;



endmodule
