/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    2-1 mux template
*/
module mux2_1(InA, InB, S, Out);
    input   InA, InB;
    input   S;
    output  Out;

    wire A2, B2, not_S;

    not1 not1_0 (.in1(S), .out(not_S));
    nand2 nand2_0 (.in1(InA), .in2(not_S), .out(A2));
    nand2 nand2_1 (.in1(InB), .in2(S), .out(B2));
    nand2 nand2_2 (.in1(A2), .in2(B2), .out(Out));

endmodule
