`timescale 1ns/1ns

module decoder_38(
   input             E1_n   ,
   input             E2_n   ,
   input             E3     ,
   input             A0     ,
   input             A1     ,
   input             A2     ,
   
   output reg       Y0_n   ,  
   output reg       Y1_n   , 
   output reg       Y2_n   , 
   output reg       Y3_n   , 
   output reg       Y4_n   , 
   output reg       Y5_n   , 
   output reg       Y6_n   , 
   output reg       Y7_n   
);


always @(*)begin
    if({E3,E2_n,E1_n} == 3'b100)begin
        case ({A2,A1,A0})
            3'b000: {Y7_n, Y6_n, Y5_n, Y4_n, Y3_n, Y2_n, Y1_n, Y0_n} = 8'b11111110;
            3'b001: {Y7_n, Y6_n, Y5_n, Y4_n, Y3_n, Y2_n, Y1_n, Y0_n} = 8'b11111101;
            3'b010: {Y7_n, Y6_n, Y5_n, Y4_n, Y3_n, Y2_n, Y1_n, Y0_n} = 8'b11111011;
            3'b011: {Y7_n, Y6_n, Y5_n, Y4_n, Y3_n, Y2_n, Y1_n, Y0_n} = 8'b11110111;
            3'b100: {Y7_n, Y6_n, Y5_n, Y4_n, Y3_n, Y2_n, Y1_n, Y0_n} = 8'b11101111;
            3'b101: {Y7_n, Y6_n, Y5_n, Y4_n, Y3_n, Y2_n, Y1_n, Y0_n} = 8'b11011111;
            3'b110: {Y7_n, Y6_n, Y5_n, Y4_n, Y3_n, Y2_n, Y1_n, Y0_n} = 8'b10111111;
            3'b111: {Y7_n, Y6_n, Y5_n, Y4_n, Y3_n, Y2_n, Y1_n, Y0_n} = 8'b01111111;
            default: {Y7_n, Y6_n, Y5_n, Y4_n, Y3_n, Y2_n, Y1_n, Y0_n} = 8'b11111111;
        endcase
    end
    else {Y7_n, Y6_n, Y5_n, Y4_n, Y3_n, Y2_n, Y1_n, Y0_n} = 8'b11111111;
end
endmodule