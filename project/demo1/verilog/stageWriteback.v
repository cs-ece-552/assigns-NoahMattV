//write-back Stage
module stageWriteback (DMemOutData, ALUResult, MemToReg,
                       WriteRegIn, WriteRegOut,
                       RegWriteIn, RegWriteOut,
                       result);
  input [15:0] DMemOutData, ALUResult;
  input [2:0] WriteRegIn;
  input RegWriteIn, MemToReg;

  output [2:0] WriteRegOut;
  output RegWriteOut;
  output [15:0] result;

  //assign ctrl sigs that get passsed back to Decode
  assign WriteRegOut = WriteRegIn;
  assign RegWriteOut = RegWriteIn;

  assign result[15:0] = MemToReg ? DMemOutData[15:0] : ALUResult[15:0];

endmodule //
