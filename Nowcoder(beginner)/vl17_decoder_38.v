`timescale 1ns/1ns

module decoder_38(
   input             E      ,
   input             A0     ,
   input             A1     ,
   input             A2     ,
   
   output reg       Y0n    ,  
   output reg       Y1n    , 
   output reg       Y2n    , 
   output reg       Y3n    , 
   output reg       Y4n    , 
   output reg       Y5n    , 
   output reg       Y6n    , 
   output reg       Y7n    
);

always @(*)begin
   if(!E)begin
      Y0n = 1'b1;
      Y1n = 1'b1;
      Y2n = 1'b1;
      Y3n = 1'b1;
      Y4n = 1'b1;
      Y5n = 1'b1;
      Y6n = 1'b1;
      Y7n = 1'b1;
   end  
   else begin
      case({A2,A1,A0})
         3'b000 : begin
                     Y0n = 1'b0; Y1n = 1'b1; Y2n = 1'b1; Y3n = 1'b1; 
                     Y4n = 1'b1; Y5n = 1'b1; Y6n = 1'b1; Y7n = 1'b1;
                  end 
         3'b001 : begin
                     Y0n = 1'b1; Y1n = 1'b0; Y2n = 1'b1; Y3n = 1'b1; 
                     Y4n = 1'b1; Y5n = 1'b1; Y6n = 1'b1; Y7n = 1'b1;
                  end 
         3'b010 : begin
                     Y0n = 1'b1; Y1n = 1'b1; Y2n = 1'b0; Y3n = 1'b1; 
                     Y4n = 1'b1; Y5n = 1'b1; Y6n = 1'b1; Y7n = 1'b1;
                  end 
         3'b011 : begin
                     Y0n = 1'b1; Y1n = 1'b1; Y2n = 1'b1; Y3n = 1'b0; 
                     Y4n = 1'b1; Y5n = 1'b1; Y6n = 1'b1; Y7n = 1'b1;
                  end 
         3'b100 : begin
                     Y0n = 1'b1; Y1n = 1'b1; Y2n = 1'b1; Y3n = 1'b1; 
                     Y4n = 1'b0; Y5n = 1'b1; Y6n = 1'b1; Y7n = 1'b1;
                  end 
         3'b101 : begin
                     Y0n = 1'b1; Y1n = 1'b1; Y2n = 1'b1; Y3n = 1'b1; 
                     Y4n = 1'b1; Y5n = 1'b0; Y6n = 1'b1; Y7n = 1'b1;
                  end 
         3'b110 : begin
                     Y0n = 1'b1; Y1n = 1'b1; Y2n = 1'b1; Y3n = 1'b1; 
                     Y4n = 1'b1; Y5n = 1'b1; Y6n = 1'b0; Y7n = 1'b1;
                  end 
         3'b111 : begin
                     Y0n = 1'b1; Y1n = 1'b1; Y2n = 1'b1; Y3n = 1'b1; 
                     Y4n = 1'b1; Y5n = 1'b1; Y6n = 1'b1; Y7n = 1'b0;
                  end 
         default: begin
                     Y0n = 1'b1; Y1n = 1'b1; Y2n = 1'b1; Y3n = 1'b1; 
                     Y4n = 1'b1; Y5n = 1'b1; Y6n = 1'b1; Y7n = 1'b1;
                  end
      endcase  
   end 
end    
     
endmodule

module decoder1(
   input             A     ,
   input             B     ,
   input             Ci    ,
   
   output wire       D     ,
   output wire       Co         
);
    wire [7:0] Yn;
    decoder_38 U0(
        .E(1'b1),
        .A2(A),
        .A1(B),
        .A0(Ci),
        .Y0n(Yn[0]),
        .Y1n(Yn[1]),
        .Y2n(Yn[2]),
        .Y3n(Yn[3]),
        .Y4n(Yn[4]),
        .Y5n(Yn[5]),
        .Y6n(Yn[6]),
        .Y7n(Yn[7])
    );
    assign D = Yn[0]&Yn[3]&Yn[5]&Yn[6];
    assign Co = Yn[0]&Yn[4]&Yn[5]&Yn[6];
endmodule
