// op mux to determine if the missing field should be
// sign extended, wrapped, or filled with zeros.

module opMux (InA, InB, Op, Out);

  parameter G = 2;

  input InA;
  input InB;
  input [G-1:0] Op;
  output Out;

  wire a;

  mux2_a mux2_1 (.InA(1'b0), .InB(InA), .S(Op[0]), .Out(a));
  mux2_b mux2_1 (.InA(a), .InB(InB), .S(Op[1]), .Out(Out));

endmodule