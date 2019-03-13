module stageFetch_bench;

  reg [16:0] instr;
  reg [16:0] PCinput;
  reg [16:0] PCoutput;
  wire overflow;
  wire dump;
  wire clk, rst;
  wire err;

  clkrst my_clkrst( .clk(clk), .rst(rst), .err(err));

  stageFetch DUT(.inst(instr[15:0]), .PCInc(PCoutput[15:0]), .PCOverflow(overflow), .PC_in(PCinput[15:0]), .createdump(dump), .clk(clk), .rst(rst));

  initial begin
    PCinput = 17'b0_0000_0000_0000_0000;
    #3200 $finish;
  end

  always @(posedge clk) begin
    PCinput[15:0] = $random;
  end

  always @(negedge clk) begin
    PCcalc = PCinput + 16'b0000_0000_0000_0010;
    $display ("Inst: %x, PCin = %x, PCout = %x", Inst, PCinput, PCoutput);

    if (PCoutput[15:0] !== PCcalc) $display ("ERRORCHECK PC + 2");
    if (PCoutput[16] !== overflow) $display ("ERRORCHECK overflow");
  end

endmodule
