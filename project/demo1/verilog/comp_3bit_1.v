/*
    CS/ECE 552 Spring '19
    Takes in two 3 bit numbers and returns if they are the same
*/
module comp_3bit_1(InA, InB, Out);
    input [2:0]  InA, InB;
    output  Out;

    wire n0, n1, n2;

    comparator c1(.InA(InA[0]), .InB(InB[0]), .Out(n0));
    comparator c2(.InA(InA[1]), .InB(InB[1]), .Out(n1));
    comparator c3(.InA(InA[2]), .InB(InB[2]), .Out(n2));

    assign Out = n0 & n1 & n2;

endmodule
