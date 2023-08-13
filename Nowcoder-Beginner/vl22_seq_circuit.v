`timescale 1ns / 1ns

module seq_circuit (
    input C,
    input clk,
    input rst_n,

    output wire Y
);
    reg Y_reg;
    parameter S0 = 2'd0;
    parameter S1 = 2'd1;
    parameter S2 = 2'd2;
    parameter S3 = 2'd3;
    reg [1:0] state, next_state;
    always @(posedge clk) begin
        if (!rst_n) begin
            state <= S0;
        end else state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: begin
                Y_reg = 0;
                next_state = (C) ? S1 : S0;
            end
            S1: begin
                Y_reg = 0;
                next_state = (C) ? S1 : S3;
            end
            S2: begin
                Y_reg = C;
                next_state = (C) ? S2 : S0;
            end
            S3: begin
                Y_reg = 1;
                next_state = (C) ? S2 : S3;
            end
            default: begin
                Y_reg = 0;
                next_state = S0;
            end
        endcase
    end
    assign Y = Y_reg;

endmodule
