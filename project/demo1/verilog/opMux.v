// op mux to determine if the missing field should be
// Rotated or filled with zeros. (UPDATED 3/10/2019)

module opMux (InA, Op, Out);
//module opMux (InA, InB, Op, Out);

  input InA;
  //input InB;
  //input [G-1:0] Op;
  input  Op;
  output Out;

  // wire a;

  // mux2_1 mux2_a (.InA(InB), .InB(InA), .S(Op[1]), .Out(a));
  //mux2_1 mux2_b (.InA(1'b0), .InB(a), .S(Op[0]), .Out(Out));

  mux2_1 mux2_b (.InA(1'b0), .InB(InA), .S(Op), .Out(Out));


endmodule
