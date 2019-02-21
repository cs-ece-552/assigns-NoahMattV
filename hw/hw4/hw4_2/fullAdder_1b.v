/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2

    a 1-bit full adder
*/
module fullAdder_1b(A, B, C_in, S, C_out);
    input  A, B;
    input  C_in;
    output S;
    output C_out;

  wire ab_xor, abc_nand, ab_nand;

  xor2 xor_0 (.in1(A), .in2(B), .out(ab_xor));
  xor2 xor_1 (.in1(ab_xor), .in2(C_in), .out(S));
  nand2 nand_0 (.in1(ab_xor), .in2(C_in), .out(abc_nand));
  nand2 nand_1 (.in1(A), .in2(B), .out(ab_nand));
  nand2 nand_2 (.in1(abc_nand), .in2(ab_nand), .out(C_out));


endmodule
