module alu_hier_bench;

   reg [15:0] A_pre_inv;
   reg [15:0] B_pre_inv;
   wire [15:0] A;
   wire [15:0] B;
   reg         Cin;
   reg [3:0]   Op;
   reg         invA;
   reg         invB;
   reg         sign;
   wire [15:0] Out;
   wire        Ofl;
   wire        Zero;
   wire       Neg;
   wire       Cout;


   reg         fail;

   reg         cerror;
   reg [31:0]  ExOut;
   reg         ExOfl;
   reg         ExZero;
   reg         ExNeg;
   reg [4:0]        x;
   integer     idx;

   alu_hier DUT (.A(A_pre_inv), .B(B_pre_inv), .Cin(Cin), .Cout(Cout), .Op(Op), .invA(invA), .invB(invB), .sign(sign), .Out(Out), .Ofl(Ofl), .Zero(Zero), .Neg(Neg));

   initial
     begin
        A_pre_inv = 16'b0000;
        B_pre_inv = 16'b0000;
        Cin = 1'b0;
        Op = 4'b0000;
        invA = 1'b0;
        invB = 1'b0;
        sign = 1'b0;
        fail = 0;

        #5000;
        if (fail)
          $display("TEST FAILED");
        else
          $display("TEST PASSED");
        $finish;
     end

   assign A = invA ? ~A_pre_inv : A_pre_inv;
   assign B = (invB ^ Op[3]) ? ~B_pre_inv : B_pre_inv;

   always@(posedge DUT.clk)
     begin
        A_pre_inv = $random;
        B_pre_inv = $random;
        Cin = $random;
        Op = $random;
        invA = $random;
        invB = $random;
        //invA = 1'b1;
        //invB = 1'b1;
        sign = $random;
     end

   always@(negedge DUT.clk)
     begin
        cerror = 1'b0;
        ExOut = 32'h0000_0000;
        ExZero = 1'b0;
        ExOfl = 1'b0;

        case (Op)
          4'b0100 :
            // Rotate Left
            begin
               ExOut = A << B[3:0] | A >> 16-B[3:0];
               if (ExOut[15:0] != Out)
                 cerror = 1'b1;
            end
          4'b0101 :
            // Shift Left
            begin
               ExOut = A << B[3:0];
               if (ExOut[15:0] != Out)
                 cerror = 1'b1;
            end
          4'b0110 :
            // Rotate Right
            begin
               ExOut = A >> B[3:0] | A << 16-B[3:0];
               if (ExOut[15:0] != Out)
                 cerror = 1'b1;
            end
          4'b0111 :
            // Right shift logical
            begin
               ExOut = A >> B[3:0];
               if (ExOut[15:0] != Out)
                 cerror = 1'b1;
            end

          4'b0000 :
            // A + B
            begin
               ExOut = A + B + Cin;
               ExNeg = ExOut[15];
               if (ExOut[15:0] == 16'h0000)
                 ExZero = 1'b1;
               if (sign == 1'b1)
                 ExOfl = ExOut[15]^A[15]^B[15]^ExOut[16];
               else
                 ExOfl = ExOut[16];

               if ((ExOut[15:0] != Out) || (ExZero != Zero) || (ExOfl != Ofl) || (ExNeg != Neg))
                 cerror = 1'b1;
            end

          4'b0001 :
            // A AND B
            begin
               ExOut = ~(A & B);
               if (ExOut[15:0] != Out)
                 cerror = 1'b1;
            end
          4'b0010 :
            // A OR B
            begin
               ExOut = A | B;
               if (ExOut[15:0] != Out)
                 cerror = 1'b1;
            end
          4'b0011 :
            // A XOR B
            begin
               ExOut = A ^ B;
               if (ExOut[15:0] != Out)
                 cerror = 1'b1;
            end
          4'b1000 :
            // A - B
            begin
               ExOut = A + B + Cin + 1'b1;
               ExNeg = ExOut[15];
               if (ExOut[15:0] == 16'h0000)
                 ExZero = 1'b1;
               if (sign == 1'b1)
                 ExOfl = ExOut[15]^A[15]^B[15]^ExOut[16];
               else
                 ExOfl = ExOut[16];

               if (((ExOut[15:0] != Out) || (ExZero != Zero) || (ExOfl != Ofl) || (ExNeg != Neg)) & sign)
                 cerror = 1'b1;
            end
          4'b1101 :
            // BTR
            begin
              for (x=0; x < 15; x= x+1)
                begin
                   ExOut[x] = A[15-x];
                end
                if (ExOut[15:0] != Out)
                  cerror = 1'b1;
            end
           default :
                 cerror = 1'b0;
        endcase // case (Op)

        if (cerror == 1'b1) begin
           $display("ERRORCHECK :: ALU :: Inputs :: Op = %d , A = %x, B = %x, Cin = %x, invA = %x, invB = %x, sign = %x :: Outputs :: Out = %x, Ofl = %x, Zero = %z, Neg %z :: Expected :: Out = %x, ExOfl = %x, ExZero = %x, ExNeg = %x", Op, A_pre_inv, B_pre_inv, Cin, invA, invB, sign, Out, Ofl, Zero, Neg, ExOut[15:0], ExOfl, ExZero, ExNeg);
           fail = 1;
        end
     end

endmodule // alu_hier_bench
