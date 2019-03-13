// stageWriteback Testbench

module stageWriteback_bench;

  reg [15:0] readData;
  reg [15:0] writeData;
  reg [15:0] ALUResult;
  reg [1:0] setValues;
  reg writeEn; // regWrite
  reg [2:0] writeReg; // which register is being written to
  reg MemToReg;

  wire clk, rst, err;

  clkrst my_clkrst( .clk(clk), .rst(rst), .err(err));

  stageWriteback DUT (.readData(readData[15:0]), .writeData(writeData[15:0]), .ALUResult(ALUResult[15:0]), .setValues(setValues[1:0]), .writeEn(writeEn), .writeReg(writeReg[2:0]), .MemToReg(MemToReg));

  initial begin

  end

  always @(posedge clk) begin

  end

  always @(negedge clk) begin

  end


endmodule //stageWriteback_bench
