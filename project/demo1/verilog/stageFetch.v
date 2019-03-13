// Fetch Stage of Demo1
// I-MEM, PC Reg, PC + 2, PC Select Mux

module stageFetch (inst, NextPC, PCOverflow, BranchPC, PCSrc, createdump, clk, rst);
  parameter N = 16;

  output [N-1:0] inst;
  output [N-1:0] NextPC; // PC + 2
  output PCOverflow;
  input  [N-1:0] BranchPC;
  input  PCSrc, createdump, clk, rst;

  wire [15:0] PC, NewPCReg; // current addr of PC

  assign NewPCReg = PCSrc ? BranchPC : NextPC;

  // PC Register to keep track of pointer
  reg_16 PCReg (.out(PC), .in(NewPCReg), .write_en(1'b1), .rst(rst), .clk(clk));

  //memory2c imem (data_out, data_in, addr, enable, wr, createdump, clk, rst);
  memory2c imem (.data_out(inst[15:0]), .data_in(16'b0), .addr(PC[15:0]), .enable(1'b1), .wr(1'b0), .createdump(createdump), .clk(clk), .rst(rst));

  // increment PC by 2
  rca_16b PCadd (.A(PC), .B(16'b0000000000000010), .C_in(1'b0), .S(NextPC), .C_out(PCOverflow));

endmodule
