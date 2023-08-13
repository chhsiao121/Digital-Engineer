`timescale 1ns/1ns

module encoder_83(
   input      [7:0]       I   ,
   input                  EI  ,
   
   output reg [2:0]      Y   ,
   output reg            GS  ,
   output reg            EO    
);
    always @(*)begin
        if(EI) begin
            casex (I)
                8'b1??????? : Y=3'b111;
                8'b01?????? : Y=3'b110;
                8'b001????? : Y=3'b101;
                8'b0001???? : Y=3'b100;
                8'b00001??? : Y=3'b011;
                8'b000001?? : Y=3'b010;
                8'b0000001? : Y=3'b001;
                8'b00000001 : Y=3'b000;
                default : Y = 3'b000;
            endcase
            EO = (~|I) ? 1'b1 : 1'b0;
            GS = ~EO;
        end
        else begin
            Y = 0;
            GS = 0;
            EO = 0;
        end
    end

endmodule

