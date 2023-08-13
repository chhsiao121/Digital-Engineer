`timescale 1ns / 1ns

module seq_circuit (
    input A,
    input clk,
    input rst_n,

    output wire Y
);

    parameter [1:0] S_00 = 0;
    parameter [1:0] S_01 = 1;
    parameter [1:0] S_10 = 2;
    parameter [1:0] S_11 = 3;
    reg [1:0] state, next_state;
    reg Y_reg;

    always @(*) begin
        case (state)
            S_00: begin
                Y_reg = 1'b0;
                if (A) next_state = 2'd3;
                else next_state = 2'd1;
            end
            S_01: begin
                Y_reg = 1'b0;
                if (A) next_state = 2'd0;
                else next_state = 2'd2;
            end
            S_10: begin
                Y_reg = 1'b0;
                if (A) next_state = 2'd1;
                else next_state = 2'd3;
            end
            S_11: begin
                Y_reg = 1'b1;
                if (A) next_state = 2'd2;
                else next_state = 2'd0;
            end
            default: next_state = S_00;
        endcase
    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            next_state <= S_00;
            state <= S_00;
        end else state <= next_state;
    end
    assign Y = Y_reg;
endmodule
