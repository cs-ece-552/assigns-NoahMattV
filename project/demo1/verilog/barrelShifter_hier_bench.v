/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 1

    Testbench for the barrel shifter.  It is not exhaustive.  Rather,
    it uses random values for In, Cnt, and Op across a large timespan
    to test as many cases as possible and compare it with the golden
    output (Expected).
 */
module barrelShifter_hier_bench;

   // declare constant for size of inputs, outputs (N) and # bits to shift (C)
   parameter   N = 16;
   parameter   C = 4;
   parameter   O = 4;

   reg [N-1:0] In;
   reg [C-1:0]  Cnt;
   reg [O-1:0]  Op;
   wire [N-1:0] Out;

   reg         fail;
   reg [3:0]   x;

   reg [31:0]  Expected;
   integer     idx;

   barrelShifter_hier DUT (.In(In), .Cnt(Cnt), .Op(Op[1:0]), .Out(Out), .BTR(Op[3]));

   initial
     begin
        In = 16'h0000;
        Cnt = 4'b0000;
        Op = 4'b0000;
        fail = 0;
        Expected = 0;

        #5000;
        if (fail)
          $display("TEST FAILED");
        else
          $display("TEST PASSED");
        $finish;
     end

   always@(posedge DUT.clk)
     begin
        In[15:0] = $random;
        //  In[15:0] = 16'hA0A0;
        Cnt[3:0] = $random;
        Op[3:0] = $random;
     end


   always@(negedge DUT.clk)
     begin
        case (Op)
          4'b0100 :
            // Rotate Left
            begin
               Expected = In << Cnt | In >> 16-Cnt;

               if (Expected[15:0] != Out) begin
                  $display("ERRORCHECK :: BarrelShifter :: Rotate Left       : Count : %d, In = %x ; Expected : %x, Got %x", Cnt, In, Expected[15:0], Out);
                  fail = 1;
               end
            end
          4'b0101 :
            // Shift Left
            begin
               Expected = In << Cnt;

               if (Expected[15:0] != Out) begin
                  $display("ERRORCHECK :: BarrelShifter :: Shift Left        : Count : %d, In = %x ; Expected : %x, Got %x", Cnt, In, Expected[15:0], Out);
                  fail = 1;
               end
            end
          4'b0110 :
            // Rotate Right
            begin
               Expected = In >> Cnt | In << 16-Cnt;

               if (Expected[15:0] != Out) begin
                  $display("ERRORCHECK :: BarrelShifter :: Rotate Right       : Count : %d, In = %x ; Expected : %x, Got %x", Cnt, In, Expected[15:0], Out);
                  fail = 1;
               end
            end
          4'b0111 :
            // Shift Right Logical
            begin
               Expected = In >> Cnt;

               if (Expected[15:0] != Out) begin
                  $display("ERRORCHECK :: BarrelShifter :: Shift Right Logic : Count : %d, In = %x ; Expected : %x, Got %x", Cnt, In, Expected[15:0], Out);
                  fail = 1;
               end
            end
          4'b1100 :
            // BTR
            begin
              for (x=0; x < 15; x= x+1)
                begin
                   Expected[x] = In[15-x];
                end
                if (Expected[15:0] != Out) begin
                  $display("ERRORCHECK :: BarrelShifter :: BTR : Count : %d, In = %x ; Expected : %x, Got %x", Cnt, In, Expected[15:0], Out);
                  fail = 1;
                end
            end
            default
                fail = 0;
        endcase
     end

endmodule // tb_barrelShifter
