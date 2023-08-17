`timescale 1ns / 1ns
module sequence_detect (
    input clk,
    input rst_n,
    input a,
    output reg match
);

    reg [8:0] a_tmp;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) a_tmp <= 9'b1_1111_1111;
        else a_tmp <= {a_tmp[7:0], a};
    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) match <= 1'b0;
        else if (a_tmp == 9'b011xxx110) match <= 1'b1;
        else match <= 1'b0;
    end

endmodule
