/*
   CS/ECE 552, Spring '19
   Homework #5, Problem #2

   This module creates a wrapper around the 8x16b register file, to do
   do the bypassing logic for RF bypassing.
*/
module rf_bypass (
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

   wire n0, n1;
   wire [15:0] b0, b1;

   /* YOUR CODE HERE */
   rf r1(
       // Outputs
        .readData1(b0),
        .readData2(b1),
        .err(err),
        // Inputs
        .clk(clk),
        .rst(rst),
        .readReg1Sel(readReg1Sel),
        .readReg2Sel(readReg2Sel),
        .writeRegSel(writeRegSel),
        .writeData(writeData),
        .writeEn(writeEn));

    //Bypass for read1
    comp_3bit_1 c1(.InA(readReg1Sel), .InB(writeRegSel), .Out(n0));
    mux2_1_16bit m1(.InA(writeData), .InB(b0), .S(n0 & writeEn), .Out(readData1));

    //Bypass for read2
    comp_3bit_1 c2(.InA(readReg2Sel), .InB(writeRegSel), .Out(n1));
    mux2_1_16bit m2(.InA(writeData), .InB(b1), .S(n1 & writeEn), .Out(readData2));

endmodule
