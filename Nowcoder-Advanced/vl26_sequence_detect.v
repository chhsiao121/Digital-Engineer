`timescale 1ns / 1ns
module sequence_detect (
    input clk,
    input rst_n,
    input a,
    output reg match
);
    reg match_d;
    reg [8:0] a_tmp;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) a_tmp <= 9'b111111111;
        else a_tmp <= {a_tmp[7:0], a};
    end

    always @(*) begin
        casez (a_tmp)
            9'b011???110: match_d = 1;
            default: match_d = 0;
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) match <= 0;
        else match <= match_d;
    end
endmodule
