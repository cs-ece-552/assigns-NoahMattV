/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1
    Repurposed for hw 5
    2-1 mux template
*/
module comparator(InA, InB, Out);
    input   InA, InB;
    output  Out;

    assign Out = InA ~^ InB;

endmodule
