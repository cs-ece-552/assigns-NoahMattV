/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    4-1 mux template
*/
module mux4_1(InA, InB, InC, InD, S, Out);
    input        InA, InB, InC, InD;
    input [1:0]  S;
    output       Out;

    wire Out_m0, Out_m1;

    mux2_1 m0(.InA(InA), .InB(InB), .S(S[0]), .Out(Out_m0));
    mux2_1 m1(.InA(InC), .InB(InD), .S(S[0]), .Out(Out_m1));
    mux2_1 m2(.InA(Out_m0), .InB(Out_m1), .S(S[1]), .Out(Out));


endmodule


// a = 00
// b = 01
// c = 10
// d = 11
