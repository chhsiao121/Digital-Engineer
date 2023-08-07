`timescale 1ns/1ns

module data_sel(
   input             S0     ,
   input             S1     ,
   input             D0     ,
   input             D1     ,
   input             D2     ,
   input             D3     ,
   
   output wire        Y    
);

assign Y = ~S1 & (~S0&D0 | S0&D1) | S1&(~S0&D2 | S0&D3);
     
endmodule

module sel_exp(
   input             A     ,
   input             B     ,
   input             C     ,
   
   output wire       L            
);

data_sel U1(
    .S1(B),
    .S0(C),
    .D3(1'b1),
    .D2(A),
    .D1(1'b0),
    .D0(A),
    .Y(L)
);

endmodule