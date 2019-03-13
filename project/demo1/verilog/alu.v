/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 2

    A 16-bit ALU module.  It is designed to choose
    the correct operation to perform on 2 16-bit numbers from rotate
    left, shift left, shift right arithmetic, shift right logical, add,
    or, xor, & and.  Upon doing this, it should output the 16-bit result
    of the operation, as well as output a Zero bit and an Overflow
    (OFL) bit.
*/
module alu (A, B, Cin, Cout, Op, invA, invB, sign, Out, Zero, Neg, Ofl);

   // declare constant for size of inputs, outputs (N),
   // and operations (O)
   parameter    N = 16;
   parameter    O = 4;

   input [N-1:0] A;
   input [N-1:0] B;
   input         Cin;
   input [O-1:0] Op;
   input         invA;
   input         invB;
   input         sign;
   output [N-1:0] Out;
   output         Ofl;
   output         Zero;
   output         Neg;
   output         Cout;

   wire [N-1:0] cout, b_out, a_out, Ai, Bi;
   wire invb, cin;

  	 //16 bit ALU
	alu_1b a1( .A(Ai[0]), .B(Bi[0]), .Cin(cin), .Op(Op[1:0]), .Out(a_out[0]), .invA(invA), .invB(invb), .Cout(cout[0]));
	alu_1b a2( .A(Ai[1]), .B(Bi[1]), .Cin(cout[0]), .Op(Op[1:0]), .Out(a_out[1]), .invA(invA), .invB(invb), .Cout(cout[1]));
	alu_1b a3( .A(Ai[2]), .B(Bi[2]), .Cin(cout[1]), .Op(Op[1:0]), .Out(a_out[2]), .invA(invA), .invB(invb), .Cout(cout[2]));
	alu_1b a4( .A(Ai[3]), .B(Bi[3]), .Cin(cout[2]), .Op(Op[1:0]), .Out(a_out[3]), .invA(invA), .invB(invb), .Cout(cout[3]));
	alu_1b a5( .A(Ai[4]), .B(Bi[4]), .Cin(cout[3]), .Op(Op[1:0]), .Out(a_out[4]), .invA(invA), .invB(invb), .Cout(cout[4]));
	alu_1b a6( .A(Ai[5]), .B(Bi[5]), .Cin(cout[4]), .Op(Op[1:0]), .Out(a_out[5]), .invA(invA), .invB(invb), .Cout(cout[5]));
	alu_1b a7( .A(Ai[6]), .B(Bi[6]), .Cin(cout[5]), .Op(Op[1:0]), .Out(a_out[6]), .invA(invA), .invB(invb), .Cout(cout[6]));
	alu_1b a8( .A(Ai[7]), .B(Bi[7]), .Cin(cout[6]), .Op(Op[1:0]), .Out(a_out[7]), .invA(invA), .invB(invb), .Cout(cout[7]));
	alu_1b a9( .A(Ai[8]), .B(Bi[8]), .Cin(cout[7]), .Op(Op[1:0]), .Out(a_out[8]), .invA(invA), .invB(invb), .Cout(cout[8]));
	alu_1b a10( .A(Ai[9]), .B(Bi[9]), .Cin(cout[8]), .Op(Op[1:0]), .Out(a_out[9]), .invA(invA), .invB(invb), .Cout(cout[9]));
	alu_1b a11( .A(Ai[10]), .B(Bi[10]), .Cin(cout[9]), .Op(Op[1:0]), .Out(a_out[10]), .invA(invA), .invB(invb), .Cout(cout[10]));
	alu_1b a12( .A(Ai[11]), .B(Bi[11]), .Cin(cout[10]), .Op(Op[1:0]), .Out(a_out[11]), .invA(invA), .invB(invb), .Cout(cout[11]));
	alu_1b a13( .A(Ai[12]), .B(Bi[12]), .Cin(cout[11]), .Op(Op[1:0]), .Out(a_out[12]), .invA(invA), .invB(invb), .Cout(cout[12]));
	alu_1b a14( .A(Ai[13]), .B(Bi[13]), .Cin(cout[12]), .Op(Op[1:0]), .Out(a_out[13]), .invA(invA), .invB(invb), .Cout(cout[13]));
	alu_1b a15( .A(Ai[14]), .B(Bi[14]), .Cin(cout[13]), .Op(Op[1:0]), .Out(a_out[14]), .invA(invA), .invB(invb), .Cout(cout[14]));
	alu_1b a16( .A(Ai[15]), .B(Bi[15]), .Cin(cout[14]), .Op(Op[1:0]), .Out(a_out[15]), .invA(invA), .invB(invb), .Cout(cout[15]));

	//Barrel Shifter
	barrelShifter b1(.In(Ai), .Cnt(Bi[3:0]), .Op(Op[1:0]), .Out(b_out), .BTR(Op[3]));

  assign Ai  = (invA ^ (Op[3] & ~Op[2]) ) ? ~A : A;
  assign Bi  =  invB ? ~B : B;
  assign Zero = (Out[15] | Out[14] | Out[13] | Out[12] | Out[11] | Out[10] | Out[9] | Out[8] | Out[7] | Out[6] | Out[5] | Out[4] | Out[3] | Out[2] | Out[1] | Out[0]) ? 1'b0 : 1'b1;
	//assign Ofl = sign ? (Out[15] ^ Ai[15] ^ Bi[15] ^ cout[15]) : cout[15];
  assign Ofl = (sign) ? ((Ai[15] & Bi[15] & ~Out[15]) | (~Ai[15] & ~Bi[15] & Out[15])) : cout[15];

	assign Out = Op[2] ? b_out : a_out;
  assign Neg = Out[15];
  assign invb = Op[3] ^ invB;
  assign cin = Op[3] | Cin;
  assign Cout = cout[15];


endmodule
