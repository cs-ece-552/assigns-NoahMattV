/*
   CS/ECE 552, Spring '19
   Homework #5, Problem #1

   This module creates a 16-bit register.  It has 1 write port, 2 read
   ports, 3 register select inputs, a write enable, a reset, and a clock
   input.  All register state changes occur on the rising edge of the
   clock.
*/
module rf (
           // Outputs
           readData1, readData2, err,
           // Inputs
           clk, rst, readReg1Sel, readReg2Sel, writeRegSel, writeData, writeEn
           );

   input        clk, rst;
   input [2:0]  readReg1Sel;
   input [2:0]  readReg2Sel;
   input [2:0]  writeRegSel;
   input [15:0] writeData;
   input        writeEn;

   output [15:0] readData1;
   output [15:0] readData2;
   output        err;

   /* YOUR CODE HERE */
   wire [15:0] reg0_out;
   wire [15:0] reg1_out;
   wire [15:0] reg2_out;
   wire [15:0] reg3_out;
   wire [15:0] reg4_out;
   wire [15:0] reg5_out;
   wire [15:0] reg6_out;
   wire [15:0] reg7_out;

   wire [15:0] n0, n1, n2, n3, n4, n5;
   wire [15:0] k0, k1, k2, k3, k4, k5;

   wire [7:0] write;

   decoder_3_8 decoder (.out(write[7:0]), .in(writeRegSel[2:0]));

   reg_16 reg0 (.out(reg0_out[15:0]), .in(writeData), .write_en(write[0] & writeEn), .rst(rst), .clk(clk));
   reg_16 reg1 (.out(reg1_out[15:0]), .in(writeData), .write_en(write[1] & writeEn), .rst(rst), .clk(clk));
   reg_16 reg2 (.out(reg2_out[15:0]), .in(writeData), .write_en(write[2] & writeEn), .rst(rst), .clk(clk));
   reg_16 reg3 (.out(reg3_out[15:0]), .in(writeData), .write_en(write[3] & writeEn), .rst(rst), .clk(clk));
   reg_16 reg4 (.out(reg4_out[15:0]), .in(writeData), .write_en(write[4] & writeEn), .rst(rst), .clk(clk));
   reg_16 reg5 (.out(reg5_out[15:0]), .in(writeData), .write_en(write[5] & writeEn), .rst(rst), .clk(clk));
   reg_16 reg6 (.out(reg6_out[15:0]), .in(writeData), .write_en(write[6] & writeEn), .rst(rst), .clk(clk));
   reg_16 reg7 (.out(reg7_out[15:0]), .in(writeData), .write_en(write[7] & writeEn), .rst(rst), .clk(clk));

   //readData1 Selection
   //Level 1 readReg1Sel [0]
   mux2_1_16bit m1(.InA(reg7_out), .InB(reg6_out), .S(readReg1Sel[0]), .Out(n0));
   mux2_1_16bit m2(.InA(reg5_out), .InB(reg4_out), .S(readReg1Sel[0]), .Out(n1));
   mux2_1_16bit m3(.InA(reg3_out), .InB(reg2_out), .S(readReg1Sel[0]), .Out(n2));
   mux2_1_16bit m4(.InA(reg1_out), .InB(reg0_out), .S(readReg1Sel[0]), .Out(n3));

   //Level 2 readReg1Sel [1]
   mux2_1_16bit m5(.InA(n0), .InB(n1), .S(readReg1Sel[1]), .Out(n4));
   mux2_1_16bit m6(.InA(n2), .InB(n3), .S(readReg1Sel[1]), .Out(n5));

   //Level 3 readReg1Sel [2]
   mux2_1_16bit m7(.InA(n4), .InB(n5), .S(readReg1Sel[2]), .Out(readData1));



   //readData2 Selection
   //Level 1 readReg2Sel [0]
   mux2_1_16bit m8(.InA(reg7_out), .InB(reg6_out), .S(readReg2Sel[0]), .Out(k0));
   mux2_1_16bit m9(.InA(reg5_out), .InB(reg4_out), .S(readReg2Sel[0]), .Out(k1));
   mux2_1_16bit m10(.InA(reg3_out), .InB(reg2_out), .S(readReg2Sel[0]), .Out(k2));
   mux2_1_16bit m11(.InA(reg1_out), .InB(reg0_out), .S(readReg2Sel[0]), .Out(k3));

   //Level 2 readReg2Sel [1]
   mux2_1_16bit m12(.InA(k0), .InB(k1), .S(readReg2Sel[1]), .Out(k4));
   mux2_1_16bit m13(.InA(k2), .InB(k3), .S(readReg2Sel[1]), .Out(k5));

   //Level 3 readReg2Sel [2]
   mux2_1_16bit m14(.InA(k4), .InB(k5), .S(readReg2Sel[2]), .Out(readData2));

endmodule
