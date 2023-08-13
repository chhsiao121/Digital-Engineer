`timescale 1ns / 1ns

module seq_circuit (
    input A,
    input clk,
    input rst_n,

    output wire Y
);
    reg y_reg;
    reg q1, q0;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) q1 <= 0;
        else q1 <= (~q1 & ~q0 & A) | (~q1 & q0 & ~A) | (q1 & q0 & A) | (q1 & ~q0 & ~A);
    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) q0 <= 0;
        else q0 <= ~q0;
    end
    assign Y = q1 & q0;
endmodule
