/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 2

    A 1-bit ALU module.
*/
module alu_1b (A, B, Cin, Op, Out, invA, invB, Cout);

   // and operations (O)
   parameter    O = 2;

   input 	A, invA;
   input 	B, invB;
   input        Cin;
   input [O-1:0] Op;
   output 	Out;
   output         Cout;

	wire c_0, c_1, s;


	//Adder
	fullAdder_1b adder( .A(A), .B(B), .C_in(Cin), .S(s), .C_out(Cout));

	//operation select 4:1 mux
	mux2_1 muxC_0( .InA(A & B), .InB(s), .S(Op[0]), .Out(c_0));
	mux2_1 muxC_1( .InA(A ^ B), .InB(A | B), .S(Op[0]), .Out(c_1));
	mux2_1 muxC( .InA(c_1), .InB(c_0), .S(Op[1]), .Out(Out));





endmodule
