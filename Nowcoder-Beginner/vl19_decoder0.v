`timescale 1ns/1ns

module decoder_38(
   input             E1_n   ,
   input             E2_n   ,
   input             E3     ,
   input             A0     ,
   input             A1     ,
   input             A2     ,
   
   output wire       Y0_n   ,  
   output wire       Y1_n   , 
   output wire       Y2_n   , 
   output wire       Y3_n   , 
   output wire       Y4_n   , 
   output wire       Y5_n   , 
   output wire       Y6_n   , 
   output wire       Y7_n   
);
wire E ;
assign E = E3 & ~E2_n & ~E1_n;
assign  Y0_n = ~(E & ~A2 & ~A1 & ~A0);
assign  Y1_n = ~(E & ~A2 & ~A1 &  A0);
assign  Y2_n = ~(E & ~A2 &  A1 & ~A0);
assign  Y3_n = ~(E & ~A2 &  A1 &  A0);
assign  Y4_n = ~(E &  A2 & ~A1 & ~A0);
assign  Y5_n = ~(E &  A2 & ~A1 &  A0);
assign  Y6_n = ~(E &  A2 &  A1 & ~A0);
assign  Y7_n = ~(E &  A2 &  A1 &  A0);
     
endmodule

module decoder0(
   input             A     ,
   input             B     ,
   input             C     ,
   
   output wire       L
);
    wire W7,W6,W5,W4,W3,W2,W1,W0;
    decoder_38 U1 (
        .E1_n(1'b0),
        .E2_n(1'b0),
        .E3(1'b1),
        .A2(A),
        .A1(B),
        .A0(C),
        .Y7_n(W7),
        .Y6_n(W6),
        .Y5_n(W5),
        .Y4_n(W4),
        .Y3_n(W3),
        .Y2_n(W2),
        .Y1_n(W1),
        .Y0_n(W0)
    );

    assign L = W0 & W2 & W4 & W5;
endmodule