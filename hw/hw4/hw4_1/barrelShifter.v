/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 1

    A barrel shifter module.  It is designed to shift a number via rotate
    left, shift left, shift right arithmetic, or shift right logical based
    on the Op() value that is passed in (2 bit number).  It uses these
    shifts to shift the value any number of bits between 0 and 15 bits.
 */
module barrelShifter (In, Cnt, Op, Out);

   // declare constant for size of inputs, outputs (N) and # bits to shift (C)
   parameter   N = 16;
   parameter   C = 4;
   parameter   O = 2;

   input [N-1:0]   In;
   input [C-1:0]   Cnt;
   input [O-1:0]   Op;
   output [N-1:0]  Out;

   /* YOUR CODE HERE */
   wire [15:0] a; // top level (green muxes in diagram) (a[15] is on the left)
   wire [15:0] b; // second level (top blue muxes)
   wire [15:0] c; // third level
   wire [15:0] d; // fourth level
   wire [15:0] e; // final level (bottom green muxes)

   wire [15:0] wo; // wires related to the opcode function mux outputs

   // Top level (green muxes)
   // To keep myself sane, this isn't assigned to the barrelshifter_level
   // Because reversing the bits is tedious.
   mux2_a_15 mux2_1(.InA(In[15]), .InB(In[0]), .S(Op[1]), .Out(a[15]));
   mux2_a_14 mux2_1(.InA(In[14]), .InB(In[1]), .S(Op[1]), .Out(a[14]));
   mux2_a_13 mux2_1(.InA(In[13]), .InB(In[2]), .S(Op[1]), .Out(a[13]));
   mux2_a_12 mux2_1(.InA(In[12]), .InB(In[3]), .S(Op[1]), .Out(a[12]));
   mux2_a_11 mux2_1(.InA(In[11]), .InB(In[4]), .S(Op[1]), .Out(a[11]));
   mux2_a_10 mux2_1(.InA(In[10]), .InB(In[5]), .S(Op[1]), .Out(a[10]));
   mux2_a_9 mux2_1(.InA(In[9]),   .InB(In[6]), .S(Op[1]),  .Out(a[9]));
   mux2_a_8 mux2_1(.InA(In[8]),   .InB(In[7]), .S(Op[1]),  .Out(a[8]));
   mux2_a_7 mux2_1(.InA(In[7]),   .InB(In[8]), .S(Op[1]),  .Out(a[7]));
   mux2_a_6 mux2_1(.InA(In[6]),   .InB(In[9]), .S(Op[1]),  .Out(a[6]));
   mux2_a_5 mux2_1(.InA(In[5]),  .InB(In[10]), .S(Op[1]),  .Out(a[5]));
   mux2_a_4 mux2_1(.InA(In[4]),  .InB(In[11]), .S(Op[1]),  .Out(a[4]));
   mux2_a_3 mux2_1(.InA(In[3]),  .InB(In[12]), .S(Op[1]),  .Out(a[3]));
   mux2_a_2 mux2_1(.InA(In[2]),  .InB(In[13]), .S(Op[1]),  .Out(a[2]));
   mux2_a_1 mux2_1(.InA(In[1]),  .InB(In[14]), .S(Op[1]),  .Out(a[1]));
   mux2_a_0 mux2_1(.InA(In[0]),  .InB(In[15]), .S(Op[1]),  .Out(a[0]));
   // a[0] used in op mux
   opMux_a_0 opMux(.InA(a[0]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[15]));


   // second level
   mux2_b_15 mux2_1(.InA(wo[15]), .InB(a[15]), .S(Cnt[0]), .Out(b[15]));
   mux2_b_14 mux2_1(.InA(a[15]), .InB(a[14]), .S(Cnt[0]), .Out(b[14]));
   mux2_b_13 mux2_1(.InA(a[14]), .InB(a[13]), .S(Cnt[0]), .Out(b[13]));
   mux2_b_12 mux2_1(.InA(a[13]), .InB(a[12]), .S(Cnt[0]), .Out(b[12]));
   mux2_b_11 mux2_1(.InA(a[12]), .InB(a[11]), .S(Cnt[0]), .Out(b[11]));
   mux2_b_10 mux2_1(.InA(a[11]), .InB(a[10]), .S(Cnt[0]), .Out(b[10]));
   mux2_b_9 mux2_1(.InA(a[10]), .InB(a[9]), .S(Cnt[0]), .Out(b[9]));
   mux2_b_8 mux2_1(.InA(a[9]), .InB(a[8]), .S(Cnt[0]), .Out(b[8]));
   mux2_b_7 mux2_1(.InA(a[8]), .InB(a[7]), .S(Cnt[0]), .Out(b[7]));
   mux2_b_6 mux2_1(.InA(a[7]), .InB(a[6]), .S(Cnt[0]), .Out(b[6]));
   mux2_b_5 mux2_1(.InA(a[6]), .InB(a[5]), .S(Cnt[0]), .Out(b[5]));
   mux2_b_4 mux2_1(.InA(a[5]), .InB(a[4]), .S(Cnt[0]), .Out(b[4]));
   mux2_b_3 mux2_1(.InA(a[4]), .InB(a[3]), .S(Cnt[0]), .Out(b[3]));
   mux2_b_2 mux2_1(.InA(a[3]), .InB(a[2]), .S(Cnt[0]), .Out(b[2]));
   mux2_b_1 mux2_1(.InA(a[2]), .InB(a[1]), .S(Cnt[0]), .Out(b[1]));
   mux2_b_0 mux2_1(.InA(a[1]), .InB(a[0]), .S(Cnt[0]), .Out(b[0]));
   // b[1:0] used in op mux
   opMux_b_1 opMux(.InA(b[1]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[14]));
   opMux_b_0 opMux(.InA(b[0]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[13]));


   // third level
   mux2_c_15 mux2_1(.InA(wo[14]), .InB(b[15]), .S(Cnt[1]), .Out(c[15]));
   mux2_c_14 mux2_1(.InA(wo[13]), .InB(b[14]), .S(Cnt[1]), .Out(c[14]));
   mux2_c_13 mux2_1(.InA(b[15]), .InB(b[13]), .S(Cnt[1]), .Out(c[13]));
   mux2_c_12 mux2_1(.InA(b[14]), .InB(b[12]), .S(Cnt[1]), .Out(c[12]));
   mux2_c_11 mux2_1(.InA(b[13]), .InB(b[11]), .S(Cnt[1]), .Out(c[11]));
   mux2_c_10 mux2_1(.InA(b[12]), .InB(b[10]), .S(Cnt[1]), .Out(c[10]));
   mux2_c_9 mux2_1(.InA(b[11]), .InB(b[9]), .S(Cnt[1]), .Out(c[9]));
   mux2_c_8 mux2_1(.InA(b[10]), .InB(b[8]), .S(Cnt[1]), .Out(c[8]));
   mux2_c_7 mux2_1(.InA(b[9]), .InB(b[7]), .S(Cnt[1]), .Out(c[7]));
   mux2_c_6 mux2_1(.InA(b[8]), .InB(b[6]), .S(Cnt[1]), .Out(c[6]));
   mux2_c_5 mux2_1(.InA(b[7]), .InB(b[5]), .S(Cnt[1]), .Out(c[5]));
   mux2_c_4 mux2_1(.InA(b[6]), .InB(b[4]), .S(Cnt[1]), .Out(c[4]));
   mux2_c_3 mux2_1(.InA(b[5]), .InB(b[3]), .S(Cnt[1]), .Out(c[3]));
   mux2_c_2 mux2_1(.InA(b[4]), .InB(b[2]), .S(Cnt[1]), .Out(c[2]));
   mux2_c_1 mux2_1(.InA(b[3]), .InB(b[1]), .S(Cnt[1]), .Out(c[1]));
   mux2_c_0 mux2_1(.InA(b[2]), .InB(b[0]), .S(Cnt[1]), .Out(c[0]));
   // c[3:0] used in op mux
   opMux_c_3 opMux(.InA(c[3]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[12]));
   opMux_c_2 opMux(.InA(c[2]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[11]));
   opMux_c_1 opMux(.InA(c[1]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[10]));
   opMux_c_0 opMux(.InA(c[0]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[9]));


   // fourth level
   mux2_d_15 mux2_1(.InA(wo[12]), .InB(c[15]), .S(Cnt[2]), .Out(d[15]));
   mux2_d_14 mux2_1(.InA(wo[11]), .InB(c[14]), .S(Cnt[2]), .Out(d[14]));
   mux2_d_13 mux2_1(.InA(wo[10]), .InB(c[13]), .S(Cnt[2]), .Out(d[13]));
   mux2_d_12 mux2_1(.InA(wo[9]), .InB(c[12]), .S(Cnt[2]), .Out(d[12]));
   mux2_d_11 mux2_1(.InA(c[15]), .InB(c[11]), .S(Cnt[2]), .Out(d[11]));
   mux2_d_10 mux2_1(.InA(c[14]), .InB(c[10]), .S(Cnt[2]), .Out(d[10]));
   mux2_d_9 mux2_1(.InA(c[13]), .InB(c[9]), .S(Cnt[2]), .Out(d[9]));
   mux2_d_8 mux2_1(.InA(c[12]), .InB(c[8]), .S(Cnt[2]), .Out(d[8]));
   mux2_d_7 mux2_1(.InA(c[11]), .InB(c[7]), .S(Cnt[2]), .Out(d[7]));
   mux2_d_6 mux2_1(.InA(c[10]), .InB(c[6]), .S(Cnt[2]), .Out(d[6]));
   mux2_d_5 mux2_1(.InA(c[9]), .InB(c[5]), .S(Cnt[2]), .Out(d[5]));
   mux2_d_4 mux2_1(.InA(c[8]), .InB(c[4]), .S(Cnt[2]), .Out(d[4]));
   mux2_d_3 mux2_1(.InA(c[7]), .InB(c[3]), .S(Cnt[2]), .Out(d[3]));
   mux2_d_2 mux2_1(.InA(c[6]), .InB(c[2]), .S(Cnt[2]), .Out(d[2]));
   mux2_d_1 mux2_1(.InA(c[5]), .InB(c[1]), .S(Cnt[2]), .Out(d[1]));
   mux2_d_0 mux2_1(.InA(c[4]), .InB(c[0]), .S(Cnt[2]), .Out(d[0]));
   // d[7:0] used in op mux
   opMux_d_7 opMux(.InA(d[7]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[8]));
   opMux_d_6 opMux(.InA(d[6]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[7]));
   opMux_d_5 opMux(.InA(d[5]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[6]));
   opMux_d_4 opMux(.InA(d[4]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[5]));
   opMux_d_3 opMux(.InA(d[3]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[4]));
   opMux_d_2 opMux(.InA(d[2]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[3]));
   opMux_d_1 opMux(.InA(d[1]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[2]));
   opMux_d_0 opMux(.InA(d[0]), .InB(In[15]), .Op(Op[1:0]), .Out(wo[1]));


   // fifth level
   mux2_e_15 mux2_1(.InA(wo[8]), .InB(d[15]), .S(Cnt[3]), .Out(e[15]));
   mux2_e_14 mux2_1(.InA(wo[7]), .InB(d[14]), .S(Cnt[3]), .Out(e[14]));
   mux2_e_13 mux2_1(.InA(wo[6]), .InB(d[13]), .S(Cnt[3]), .Out(e[13]));
   mux2_e_12 mux2_1(.InA(wo[5]), .InB(d[12]), .S(Cnt[3]), .Out(e[12]));
   mux2_e_11 mux2_1(.InA(wo[4]), .InB(d[11]), .S(Cnt[3]), .Out(e[11]));
   mux2_e_10 mux2_1(.InA(wo[3]), .InB(d[10]), .S(Cnt[3]), .Out(e[10]));
   mux2_e_9 mux2_1(.InA(wo[2]), .InB(d[9]), .S(Cnt[3]), .Out(e[9]));
   mux2_e_8 mux2_1(.InA(wo[1]), .InB(d[8]), .S(Cnt[3]), .Out(e[8]));
   mux2_e_7 mux2_1(.InA(d[15]), .InB(d[7]), .S(Cnt[3]), .Out(e[7]));
   mux2_e_6 mux2_1(.InA(d[14]), .InB(d[6]), .S(Cnt[3]), .Out(e[6]));
   mux2_e_5 mux2_1(.InA(d[13]), .InB(d[5]), .S(Cnt[3]), .Out(e[5]));
   mux2_e_4 mux2_1(.InA(d[12]), .InB(d[4]), .S(Cnt[3]), .Out(e[4]));
   mux2_e_3 mux2_1(.InA(d[11]), .InB(d[3]), .S(Cnt[3]), .Out(e[3]));
   mux2_e_2 mux2_1(.InA(d[10]), .InB(d[2]), .S(Cnt[3]), .Out(e[2]));
   mux2_e_1 mux2_1(.InA(d[9]), .InB(d[1]), .S(Cnt[3]), .Out(e[1]));
   mux2_e_0 mux2_1(.InA(d[8]), .InB(d[0]), .S(Cnt[3]), .Out(e[0]));


   // final stage (flip back if left shift asserted)
   mux2_f_15 mux2_1(.InA(e[15]), .InB(e[0]), .S(Op[0]), .Out(Out[15]));
   mux2_f_14 mux2_1(.InA(e[14]), .InB(e[1]), .S(Op[0]), .Out(Out[14]));
   mux2_f_13 mux2_1(.InA(e[13]), .InB(e[2]), .S(Op[0]), .Out(Out[13]));
   mux2_f_12 mux2_1(.InA(e[12]), .InB(e[3]), .S(Op[0]), .Out(Out[12]));
   mux2_f_11 mux2_1(.InA(e[11]), .InB(e[4]), .S(Op[0]), .Out(Out[11]));
   mux2_f_10 mux2_1(.InA(e[10]), .InB(e[5]), .S(Op[0]), .Out(Out[10]));
   mux2_f_9 mux2_1(.InA(e[9]), .InB(e[6]), .S(Op[0]), .Out(Out[9]));
   mux2_f_8 mux2_1(.InA(e[8]), .InB(e[7]), .S(Op[0]), .Out(Out[8]));
   mux2_f_7 mux2_1(.InA(e[7]), .InB(e[8]), .S(Op[0]), .Out(Out[7]));
   mux2_f_6 mux2_1(.InA(e[6]), .InB(e[9]), .S(Op[0]), .Out(Out[6]));
   mux2_f_5 mux2_1(.InA(e[5]), .InB(e[10]), .S(Op[0]), .Out(Out[5]));
   mux2_f_4 mux2_1(.InA(e[4]), .InB(e[11]), .S(Op[0]), .Out(Out[4]));
   mux2_f_3 mux2_1(.InA(e[3]), .InB(e[12]), .S(Op[0]), .Out(Out[3]));
   mux2_f_2 mux2_1(.InA(e[2]), .InB(e[13]), .S(Op[0]), .Out(Out[2]));
   mux2_f_1 mux2_1(.InA(e[1]), .InB(e[14]), .S(Op[0]), .Out(Out[1]));
   mux2_f_0 mux2_1(.InA(e[0]), .InB(e[15]), .S(Op[0]), .Out(Out[0]));




endmodule
