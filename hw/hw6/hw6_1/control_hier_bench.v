/*
   CS/ECE 552, Spring '19
   Homework #5, Problem #1

   Random testbench for the 8x16b register file.
*/
module control_hier_bench(/*AUTOARG*/);
   /*AUTOWIRE*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire       err;
   wire       RegWrite, DMemWrite,              // From top of control_hier.v
              DMemEn, ALUSrc2, PCSrc, PCImm,    // From top of control_hier.v
              MemToReg, DMemDump, Jump;         // From top of control_hier.v
   wire [1:1'b0] RegDst;                           // From top of control_hier.v
   wire [2:1'b0] SESel;                            // From top of control_hier.v
   // End of automatics
   /*AUTOREGINPUT*/
   // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
   reg [4:1'b0]  OpCode;                           // To top of control_hier.v
   reg [1:1'b0]  Funct;                            // To top of control_hier.v
   // End of automatics

   integer    cycle_count;

   wire       clk;
   wire       rst;

   reg        fail;

   // Instantiate the module we want to verify

   control_hier DUT(/*AUTOINST*/
                    // Outputs
                    .err                          (err),
                    .RegDst                       (RegDst),
                    .SESel                        (SESel),
                    .RegWrite                     (RegWrite),
                    .DMemWrite                    (DMemWrite),
                    .DMemEn                       (DMemEn),
                    .ALUSrc2                      (ALUSrc2),
                    .PCSrc                        (PCSrc),
                    .PCImm                        (PCImm),
                    .MemToReg                     (MemToReg),
                    .DMemDump                     (DMemDump),
                    .Jump                         (Jump),
                    // Inputs
                    .OpCode                       (OpCode),
                    .Funct                        (Funct));

   /* YOUR CODE HERE */
   initial begin
       // Test: SUBI
       #5;
       $display("~~~~Testing SUBI~~~~");
       OpCode = 5'b01000;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b01) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b01);
       if (SESel[2:1] !== 2'b01) $display("\tERROR: SESel[2:1] was %b but expected %b", SESel[2:1], 2'b01);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: ADDI
       #5;
       $display("~~~~Testing ADDI~~~~");
       OpCode = 5'b01001;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b01) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b01);
       if (SESel[2:1] !== 2'b01) $display("\tERROR: SESel[2:1] was %b but expected %b", SESel[2:1], 2'b01);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: ANDNI
       #5;
       $display("~~~~Testing ANDNI~~~~");
       OpCode = 5'b01010;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b01) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b01);
       if (SESel !== 3'b000) $display("\tERROR: SESel was %b but expected %b", SESel, 3'b000);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: XORI
       #5;
       $display("~~~~Testing XORI~~~~");
       OpCode = 5'b01011;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b01) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b01);
       if (SESel !== 3'b000) $display("\tERROR: SESel was %b but expected %b", SESel, 3'b000);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: ROLI
       #5;
       $display("~~~~Testing ROLI~~~~");
       OpCode = 5'b10100;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b01) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b01);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: SLLI
       #5;
       $display("~~~~Testing SLLI~~~~");
       OpCode = 5'b10101;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b01) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b01);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: RORI
       #5;
       $display("~~~~Testing RORI~~~~");
       OpCode = 5'b10110;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b01) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b01);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: SRLI
       #5;
       $display("~~~~Testing SRLI~~~~");
       OpCode = 5'b10111;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b01) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b01);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: ST
       #5;
       $display("~~~~Testing ST~~~~");
       OpCode = 5'b10000;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       //if (RegDst !== 2'bxx) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'bxx);
       if (SESel[2:1] !== 2'b01) $display("\tERROR: SESel[2:1] was %b but expected %b", SESel[2:1], 2'b01);
       if (RegWrite !== 1'b0) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b0);
       if (DMemWrite !== 1'b1) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b1);
       if (DMemEn !== 1'b1) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b1);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: LD
       #5;
       $display("~~~~Testing LD~~~~");
       OpCode = 5'b10001;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b01) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b01);
       if (SESel[2:1] !== 2'b01) $display("\tERROR: SESel[2:1] was %b but expected %b", SESel[2:1], 2'b01);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b1) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b1);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b1) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b1);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: STU
       #5;
       $display("~~~~Testing STU~~~~");
       OpCode = 5'b10011;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       //if (RegDst !== 2'bxx) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'bxx);
       if (SESel[2:1] !== 2'b01) $display("\tERROR: SESel[2:1] was %b but expected %b", SESel[2:1], 2'b01);
       if (RegWrite !== 1'b0) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b0);
       if (DMemWrite !== 1'b1) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b1);
       if (DMemEn !== 1'b1) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b1);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: BTR
       #5;
       $display("~~~~Testing BTR~~~~");
       OpCode = 5'b11001;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b00) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b1) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b1);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: ADD
       #5;
       $display("~~~~Testing ADD~~~~");
       OpCode = 5'b11011;
       Funct = 2'b00;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b00) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b1) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b1);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: SUB
       #5;
       $display("~~~~Testing SUB~~~~");
       OpCode = 5'b11011;
       Funct = 2'b01;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b00) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b1) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b1);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: XOR
       $display("~~~~Testing XOR~~~~");
       OpCode = 5'b11011;
       Funct = 2'b10;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b00) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b1) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b1);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: ANDN
       $display("~~~~Testing ANDN~~~~");
       OpCode = 5'b11011;
       Funct = 2'b11;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b00) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b1) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b1);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: ROL
       $display("~~~~Testing ROL~~~~");
       OpCode = 5'b11010;
       Funct = 2'b00;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b00) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b1) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b1);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: SLL
       $display("~~~~Testing SLL~~~~");
       OpCode = 5'b11010;
       Funct = 2'b01;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b00) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b1) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b1);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: ROR
       $display("~~~~Testing ROR~~~~");
       OpCode = 5'b11010;
       Funct = 2'b10;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b00) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b1) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b1);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: SRL
       $display("~~~~Testing ROL~~~~");
       OpCode = 5'b11010;
       Funct = 2'b11;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b00) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b1) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b1);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: SEQ
       $display("~~~~Testing SEQ~~~~");
       OpCode = 5'b11100;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b00) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b1) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b1);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: SLT
       $display("~~~~Testing SLT~~~~");
       OpCode = 5'b11101;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b00) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b1) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b1);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: SLE
       $display("~~~~Testing SLE~~~~");
       OpCode = 5'b11110;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b00) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b1) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b1);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: SCO
       $display("~~~~Testing SCO~~~~");
       OpCode = 5'b11111;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b00) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b1) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b1);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: BNEZ
       $display("~~~~Testing BNEZ~~~~");
       OpCode = 5'b01100;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       //if (RegDst !== 2'bxx) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       if (SESel[2:1] !== 2'b10) $display("\tERROR: SESel was %b but expected %b", SESel[2:1], 2'b10);
       if (RegWrite !== 1'b0) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b0);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b1) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b1);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: BEQZ
       $display("~~~~Testing BEQZ~~~~");
       OpCode = 5'b01101;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       //if (RegDst !== 2'bxx) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       if (SESel[2:1] !== 2'b10) $display("\tERROR: SESel was %b but expected %b", SESel[2:1], 2'b10);
       if (RegWrite !== 1'b0) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b0);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b1) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b1);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: BLTZ
       $display("~~~~Testing BLTZ~~~~");
       OpCode = 5'b01110;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       //if (RegDst !== 2'bxx) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       if (SESel[2:1] !== 2'b10) $display("\tERROR: SESel was %b but expected %b", SESel[2:1], 2'b10);
       if (RegWrite !== 1'b0) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b0);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b1) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b1);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: BGEZ
       $display("~~~~Testing BGEZ~~~~");
       OpCode = 5'b01111;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       //if (RegDst !== 2'bxx) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b00);
       if (SESel[2:1] !== 2'b10) $display("\tERROR: SESel was %b but expected %b", SESel[2:1], 2'b10);
       if (RegWrite !== 1'b0) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b0);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b1) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b1);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: LBI
       $display("~~~~Testing LBI~~~~");
       OpCode = 5'b11000;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b10) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b10);
       if (SESel[2:1] !== 2'b10) $display("\tERROR: SESel was %b but expected %b", SESel[2:1], 2'b10);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: SLBI
       $display("~~~~Testing SLBI~~~~");
       OpCode = 5'b10010;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b10) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b10);
       if (SESel !== 3'b001) $display("\tERROR: SESel was %b but expected %b", SESel, 3'b001);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: J
       $display("~~~~Testing J~~~~");
       OpCode = 5'b00100;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       //if (RegDst !== 2'bxx) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'bxx);
       if (SESel[2:1] !== 2'b11) $display("\tERROR: SESel was %b but expected %b", SESel[2:1], 2'b11);
       if (RegWrite !== 1'b0) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b0);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b1) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b1);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b1) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b1);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: JR
       $display("~~~~Testing JR~~~~");
       OpCode = 5'b00101;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       //if (RegDst !== 2'bxx) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'bxx);
       if (SESel[2:1] !== 2'b10) $display("\tERROR: SESel was %b but expected %b", SESel[2:1], 2'b10);
       if (RegWrite !== 1'b0) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b0);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b1) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b1);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b1) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b1);

       // Test: JAL
       $display("~~~~Testing JAL~~~~");
       OpCode = 5'b00110;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       if (RegDst !== 2'b11) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'b11);
       if (SESel[2:1] !== 2'b11) $display("\tERROR: SESel was %b but expected %b", SESel[2:1], 2'b11);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b1) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b1);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b1) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b1);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: JALR
       $display("~~~~Testing JALR~~~~");
       OpCode = 5'b00111;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       //if (RegDst !== 2'bxx) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'bxx);
       if (SESel[2:1] !== 2'b10) $display("\tERROR: SESel was %b but expected %b", SESel[2:1], 2'b10);
       if (RegWrite !== 1'b1) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b1);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b1) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b1);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b1) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b1);

       // Test: HALT
       $display("~~~~Testing HALT~~~~");
       OpCode = 5'b00000;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       //if (RegDst !== 2'bxx) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'bxx);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b0) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b0);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b1) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b1);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: NOP
       $display("~~~~Testing NOP~~~~");
       OpCode = 5'b00001;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       //if (RegDst !== 2'bxx) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'bxx);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b0) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b0);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       // Test: SIIC
       $display("~~~~Testing SIIC~~~~");
       OpCode = 5'b00010;
       Funct = 2'bxx;
       #5;
       if (err !== 1'b0) $display("\tERROR: err was %b but expected %b", err, 1'b0);
       //if (RegDst !== 2'bxx) $display("\tERROR: RegDst was %b but expected %b", RegDst, 2'bxx);
       //if (SESel !== 3'bxxx) $display("\tERROR: SESel was %b but expected %b", SESel, 3'bxxx);
       if (RegWrite !== 1'b0) $display("\tERROR: RegWrite was %b but expected %b", RegWrite, 1'b0);
       if (DMemWrite !== 1'b0) $display("\tERROR: DMemWrite was %b but expected %b", DMemWrite, 1'b0);
       if (DMemEn !== 1'b0) $display("\tERROR: DMemEn was %b but expected %b", DMemEn, 1'b0);
       if (ALUSrc2 !== 1'b0) $display("\tERROR: ALUSrc2 was %b but expected %b", ALUSrc2, 1'b0);
       if (PCSrc !== 1'b0) $display("\tERROR: PCSrc was %b but expected %b", PCSrc, 1'b0);
       if (MemToReg !== 1'b0) $display("\tERROR: MemToReg was %b but expected %b", MemToReg, 1'b0);
       if (DMemDump !== 1'b0) $display("\tERROR: DMemDump was %b but expected %b", DMemDump, 1'b0);
       if (PCImm !== 1'b0) $display("\tERROR: PCImm was %b but expected %b", PCImm, 1'b0);
       if (Jump !== 1'b0) $display("\tERROR: Jump was %b but expected %b", Jump, 1'b0);

       //Test: invalid OpCode
       $display("~~~~Testing INVALID OP~~~~");
       OpCode = 5'b00011;
       Funct = 2'bxx;
       #5
       if (err !== 1'b1) $display("\tERROR: err was %b but expected %b", err, 1'b1);


   end
   endmodule // control_hier_bench
