// Execute Testbench
/*
IN(CtrlSig, ReadData1, ReadData2, Immediate, Jump Addr, PCInc, Inst[10:5])

OUT(ALUResult, NextPC, ReadData2, ALUFlags[2:0] (Zero, Cout, etc), WriteReg (register #), RegWrite (WriteEn))
*/
module stageExecute_bench;


  wire clk, rst, err;

  clkrst my_clkrst( .clk(clk), .rst(rst), .err(err));

  stageExecute DUT();

  initial begin

  end

  always @(posedge clk) begin

  end

  always @(negedge clk) begin

  end


endmodule
