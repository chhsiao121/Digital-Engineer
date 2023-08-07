`timescale 1ns/1ns
module encoder_83(
   input      [7:0]       I   ,
   input                  EI  ,
   
   output wire [2:0]      Y   ,
   output wire            GS  ,
   output wire            EO    
);
assign Y[2] = EI & (I[7] | I[6] | I[5] | I[4]);
assign Y[1] = EI & (I[7] | I[6] | ~I[5]&~I[4]&I[3] | ~I[5]&~I[4]&I[2]);
assign Y[0] = EI & (I[7] | ~I[6]&I[5] | ~I[6]&~I[4]&I[3] | ~I[6]&~I[4]&~I[2]&I[1]);

assign EO = EI&~I[7]&~I[6]&~I[5]&~I[4]&~I[3]&~I[2]&~I[1]&~I[0];

assign GS = EI&(I[7] | I[6] | I[5] | I[4] | I[3] | I[2] | I[1] | I[0]);
//assign GS = EI&(| I);
         
endmodule

module encoder_164(
   input      [15:0]      A   ,
   input                  EI  ,
   
   output wire [3:0]      L   ,
   output wire            GS  ,
   output wire            EO    
);
    wire [2:0]out_high_83,out_low_83;
    wire E_h, GS_h, GS_l, EO_h, EO_l;
    assign E_h = (|A[15:8])&EI;
    encoder_83 high(
        .I(A[15:8]),
        .EI(EI),
        .Y(out_high_83),
        .GS(GS_h),
        .EO(EO_h)

    );
    encoder_83 low(
        .I(A[7:0]),
        .EI(EI),
        .Y(out_low_83),
        .GS(GS_l),
        .EO(EO_l)

    );
    assign L[3] = E_h;
    assign L[2:0] = (E_h) ? out_high_83 : out_low_83;
    assign GS = (E_h) ? GS_h : GS_l;
    assign EO = EO_h&EO_l;
endmodule