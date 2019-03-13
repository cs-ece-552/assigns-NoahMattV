// 3 to 8 decoder
// Turns a 3-bit input into a one-hot 8-bit output

module decoder_3_8 (out, in);
  output [7:0] out;
  input [2:0] in;

  assign out[0] = ~in[2] & ~in[1] & ~in[0];
  assign out[1] = ~in[2] & ~in[1] &  in[0];
  assign out[2] = ~in[2] &  in[1] & ~in[0];
  assign out[3] = ~in[2] &  in[1] &  in[0];
  assign out[4] =  in[2] & ~in[1] & ~in[0];
  assign out[5] =  in[2] & ~in[1] &  in[0];
  assign out[6] =  in[2] &  in[1] & ~in[0];
  assign out[7] =  in[2] &  in[1] &  in[0];

endmodule
