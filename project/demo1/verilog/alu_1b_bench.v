module alu_1b_bench;
//A, B, Cin, Op, invA, invB, Out, Cout
    reg A;
    reg B;
    reg [1:0] Op;
    reg   Cin;
    reg COUT, OUT;
    wire  Out, Cout;
    wire        Clk;
    //2 dummy wires
    wire rst;
    wire err;
    clkrst my_clkrst( .clk(Clk), .rst(rst), .err(err));
    alu_1b DUT (.A(A), .B(B), .Cin(Cin), .Op(Op), .invA(1'b0), .invB(1'b0), .Out(Out), .Cout(Cout));

    initial begin
        A = 1'b0;
        B = 1'b0;
	Op = 2'b0;
	COUT = 1'b0;
	OUT = 1'b0;
	Cin = 1'b0;
        #3200 $finish;

    end

    always@(posedge Clk) begin
        A = $random;
        B = $random;
	Cin = $random;
	Op = Op + 1;
    end

    always@(negedge Clk) begin
        COUT = A^B^Cin;
	if (Op == 2'b00) OUT = A+B+Cin;
	if (Op == 2'b01) OUT = ~(A & B);
	if (Op == 2'b10) OUT = A|B;
	if (Op == 2'b11) OUT = A^B;

        $display("A: %x, B: %x, Out: %x, Cout: %x", A, B, Out, Cout);

        if (OUT !== Out) $display ("ERRORCHECK Out error");
        if (COUT !== Cout) $display ("ERRORCHECK Cout error");
    end
endmodule // rca_16b_bench
