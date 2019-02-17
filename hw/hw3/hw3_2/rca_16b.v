/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2

    a 16-bit RCA module
*/
module rca_16b(A, B, C_in, S, C_out);

    // declare constant for size of inputs, outputs (N)
    parameter   N = 16;

    input [N-1: 0] A, B;
    input          C_in;
    output [N-1:0] S;
    output         C_out;

  wire c_1, c_2, c_3;

  rca_4b rca_4b_0 (.A(A[3:0]), .B(B[3:0]), .C_in(C_in), .S(S[3:0]), .C_out(c_0));
  rca_4b rca_4b_1 (.A(A[7:4]), .B(B[7:4]), .C_in(c_0), .S(S[7:4]), .C_out(c_1));
  rca_4b rca_4b_2 (.A(A[11:8]), .B(B[11:8]), .C_in(c_1), .S(S[11:8]), .C_out(c_2));
  rca_4b rca_4b_3 (.A(A[15:12]), .B(B[15:12]), .C_in(c_2), .S(S[15:12]), .C_out(C_out));

endmodule
