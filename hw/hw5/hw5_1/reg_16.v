// 16-bit register made from D flip-flops
// 16 1-bit registers
module reg_16 (out, in, write_en, rst, clk);
  parameter N = 16;

  output [N-1:0] out;
  input [N-1:0] in;
  input write_en, rst, clk;

  reg_1 r0 (.out(out[0]), .in(in[0]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r1 (.out(out[1]), .in(in[1]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r2 (.out(out[2]), .in(in[2]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r3 (.out(out[3]), .in(in[3]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r4 (.out(out[4]), .in(in[4]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r5 (.out(out[5]), .in(in[5]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r6 (.out(out[6]), .in(in[6]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r7 (.out(out[7]), .in(in[7]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r8 (.out(out[8]), .in(in[8]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r9 (.out(out[9]), .in(in[9]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r10 (.out(out[10]), .in(in[10]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r11 (.out(out[11]), .in(in[11]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r12 (.out(out[12]), .in(in[12]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r13 (.out(out[13]), .in(in[13]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r14 (.out(out[14]), .in(in[14]), .write_en(write_en), .rst(rst), .clk(clk));
  reg_1 r15 (.out(out[15]), .in(in[15]), .write_en(write_en), .rst(rst), .clk(clk));






endmodule
