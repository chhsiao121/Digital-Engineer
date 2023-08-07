`timescale 1ns/1ns
module mux4_1(
input [1:0]d1,d2,d3,d0,
input [1:0]sel,
output[1:0]mux_out
);
    reg [1:0] out;
    //*************code***********//

    always @ (*) begin
        case(sel)
        2'b00    : out = d3; 		// If sel=0, output is a
        2'b01    : out = d2; 		// If sel=1, output is b
        2'b10    : out = d1; 		// If sel=2, output is c
        default  : out = d0; 		// If sel is anything else, out is always 0
        endcase
    end
    assign mux_out=out;
//*************code***********//
endmodule



