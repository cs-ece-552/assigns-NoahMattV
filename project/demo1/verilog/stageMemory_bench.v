// memory Testbench
/*
IN(ALUResult, ReadData2, ALUFlags, WriteReg, MemRead, MemWrite, MemToReg, SetSelect)

OUT(ReadData (data read from memory), ALUResult, WriteReg, RegWrite, MemToReg, SetValues [1:0])

*/
module stageMemory_bench;

  reg [15:0] ALUIn, ReadData2;
  wire [15:0] ALUOut, DMemOutData;
  wire MemToRegOut, RegWriteOut;
  wire [2:0] WriteRegOut;
  reg [2:0] WriteRegIn, SetSelect, ALUFlags;
  reg RegWriteIn, MemToRegIn, DMemWrite, DMemEn, DMemDump;
  wire clk, rst, err;

  clkrst my_clkrst( .clk(clk), .rst(rst), .err(err));

  stageMemory DUT(.ALUResultIn(ALUIn[15:0]), .ALUResultOut(ALUOut[15:0]),
                   .WriteRegIn(WriteRegIn[2:0]), .WriteRegOut(WriteRegOut[2:0]),
                   .RegWriteIn(RegWriteIn), .RegWriteOut(RegWriteOut),
                   .MemToRegIn(MemToRegIn), .MemToRegOut(MemToRegOut),
                   .SetSelect(SetSelect[2:0]),
                   .ReadData2(ReadData2[15:0]), .ALUFlags(ALUFlags[2:0]),
                   .DMemWrite(DMemWrite), .DMemEn(DMemEn), .DMemDump(DMemDump),
                   .DMemOutData(DMemOutData[15:0]),
                   .clk(clk), .rst(rst));

  initial begin
    //ctrl signals that always propagate through
    RegWriteIn = 1'b0;
    MemToRegIn = 1'b0;
    WriteRegIn = 3'b011;

    //TEST when you should just propagate the ALUResult
    DMemWrite = 1'b0;
    DMemEn = 1'b0;
    DMemDump = 1'b0;
    ALUIn = 16'h29;
    SetSelect = 3'b011; // 0 in 3rd bit because testing ALU op
    ReadData2 = 16'h123;
    ALUFlags = 3'b000; //doesnt matter for this testing
    @(posedge clk)

    if (ALUOut !== ALUIn) $display("ALUOut = %x, expected %x", ALUOut, ALUIn);
    if (RegWriteIn !== RegWriteOut || MemToRegIn != MemToRegOut || WriteRegIn !== WriteRegOut) $display("Propagated control sigs incorrect");

    //TEST when you should propagate a select values
    DMemWrite = 1'b0;
    DMemEn = 1'b0;
    DMemDump = 1'b0;
    ALUIn = 16'h29;
    SetSelect = 3'b100; // SEQ instruction
    ReadData2 = 16'h123;
    ALUFlags = 3'b001; //ZERO flag set so ALUres should be 1
    @(posedge clk);

    if (ALUOut !== 16'b1) $display("ALUOut = %x, expected %x", ALUOut, 16'b1);
    if (RegWriteIn !== RegWriteOut || MemToRegIn != MemToRegOut || WriteRegIn !== WriteRegOut) $display("Propagated control sigs incorrect");

    //TEST when you do a write
    DMemWrite = 1'b1;
    DMemEn = 1'b1;
    DMemDump = 1'b0;
    ALUIn = 16'h32;
    SetSelect = 3'b000; // SEQ instruction
    ReadData2 = 16'h69;
    ALUFlags = 3'b001; //ZERO flag set so ALUres should be 1
    @(posedge clk);

    if (RegWriteIn !== RegWriteOut || MemToRegIn != MemToRegOut || WriteRegIn !== WriteRegOut) $display("Propagated control sigs incorrect");
    //we will try to read the same place in mem wo it should be equal to what we just wrote in the next test

    //TEST when you do a read
    DMemWrite = 1'b0;
    DMemEn = 1'b1;
    DMemDump = 1'b0;
    ALUIn = 16'h32;
    SetSelect = 3'b000; // SEQ instruction
    ReadData2 = 16'h123;
    ALUFlags = 3'b001; //ZERO flag set so ALUres should be 1
    @(posedge clk);

    if (RegWriteIn !== RegWriteOut || MemToRegIn != MemToRegOut || WriteRegIn !== WriteRegOut) $display("Propagated control sigs incorrect");
    if (DMemOutData != 16'd69) begin
      $display("DMemOutData = %x, but expected %x", DMemOutData, 16'h69);
      $display("The Read or the write couuld be causing ^^");
    end

  end

  always @(posedge clk) begin

  end

  always @(negedge clk) begin

  end


endmodule
