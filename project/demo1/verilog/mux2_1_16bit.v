
/*
    CS/ECE 552 Spring '19
    A 2:1 Mux with 16bit buses
*/


module mux2_1_16bit(InA, InB, S, Out);
    input [15:0]  InA, InB;
    input   S;
    output  [15:0] Out;

    mux2_1 m0( .InA(InA[0]), .InB(InB[0]), .S(S), .Out(Out[0]));
    mux2_1 m1( .InA(InA[1]), .InB(InB[1]), .S(S), .Out(Out[1]));
    mux2_1 m2( .InA(InA[2]), .InB(InB[2]), .S(S), .Out(Out[2]));
    mux2_1 m3( .InA(InA[3]), .InB(InB[3]), .S(S), .Out(Out[3]));
    mux2_1 m4( .InA(InA[4]), .InB(InB[4]), .S(S), .Out(Out[4]));
    mux2_1 m5( .InA(InA[5]), .InB(InB[5]), .S(S), .Out(Out[5]));
    mux2_1 m6( .InA(InA[6]), .InB(InB[6]), .S(S), .Out(Out[6]));
    mux2_1 m7( .InA(InA[7]), .InB(InB[7]), .S(S), .Out(Out[7]));
    mux2_1 m8( .InA(InA[8]), .InB(InB[8]), .S(S), .Out(Out[8]));
    mux2_1 m9( .InA(InA[9]), .InB(InB[9]), .S(S), .Out(Out[9]));
    mux2_1 m10( .InA(InA[10]), .InB(InB[10]), .S(S), .Out(Out[10]));
    mux2_1 m11( .InA(InA[11]), .InB(InB[11]), .S(S), .Out(Out[11]));
    mux2_1 m12( .InA(InA[12]), .InB(InB[12]), .S(S), .Out(Out[12]));
    mux2_1 m13( .InA(InA[13]), .InB(InB[13]), .S(S), .Out(Out[13]));
    mux2_1 m14( .InA(InA[14]), .InB(InB[14]), .S(S), .Out(Out[14]));
    mux2_1 m15( .InA(InA[15]), .InB(InB[15]), .S(S), .Out(Out[15]));



endmodule
