// Decode Testbench
/*
IN(Inst[15:0], WriteData[15:0])

OUT(CtrlSig, ReadData1, ReadData2, Immediate)

*/
module stageDecode_bench;


  wire clk, rst, err;

  clkrst my_clkrst( .clk(clk), .rst(rst), .err(err));

  stageDecode DUT();

  initial begin

  end

  always @(posedge clk) begin

  end

  always @(negedge clk) begin

  end


endmodule
