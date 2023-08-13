`timescale 1ns/1ns
module Tff_2 (
input wire data, clk, rst,
output reg q  
);
//*************code***********//
reg q0;

always @(posedge clk or negedge rst)begin
    if(!rst) begin
        q0 <= 1'b0;
        q <= 1'b0;
    end
    else begin
        q0 <= (data) ? ~q0 : q0;
        q <= (q0) ? ~q : q;
    end
end

//*************code***********//
endmodule