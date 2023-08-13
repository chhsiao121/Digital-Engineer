`timescale 1ns / 1ns

module seq_circuit (
    input A,
    input clk,
    input rst_n,

    output wire Y
);
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;
    reg Y_reg;
    reg [1:0] state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) state <= S0;
        else state <= next_state;
    end

    always @(*) begin
        case (state)
            S0: next_state = A ? S3 : S1;
            S1: next_state = A ? S0 : S2;
            S2: next_state = A ? S1 : S3;
            S3: next_state = A ? S2 : S0;
            default: next_state = S0;
        endcase
    end

    always @(*) begin
        case (state)
            S0: Y_reg = 0;
            S1: Y_reg = 0;
            S2: Y_reg = 0;
            S3: Y_reg = 1;
            default: Y_reg = 0;
        endcase
    end

    assign Y = Y_reg;
endmodule
