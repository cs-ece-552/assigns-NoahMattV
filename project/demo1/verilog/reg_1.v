// 1-bit register using D Flip-Flops
module reg_1(out, in, write_en, rst, clk);
  output out;
  input in, write_en, rst, clk;

  wire Dff_in;

  mux2_1 Mux_in (.InA(in), .InB(out), .S(write_en), .Out(Dff_in));
  dff dff1 (.q(out), .d(Dff_in), .clk(clk), .rst(rst));


endmodule
