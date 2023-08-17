`timescale 1ns / 1ns
module sequence_detect (
    input clk,
    input rst_n,
    input data,
    output reg match,
    output reg not_match
);
    parameter S_0 = 0;
    parameter S_1 = 1;
    parameter S_2 = 2;
    parameter S_3 = 3;
    parameter S_4 = 4;
    parameter S_5 = 5;
    parameter S_match = 6;
    parameter S_not_match = 7;
    parameter S_cnt = 8;
    reg [2:0] cnt, cnt_d;
    reg [3:0] state, next_state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_0;
        end else begin
            state <= next_state;
        end
    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 0;
        end else begin
            if (next_state == S_cnt) cnt <= cnt_d;
        end
    end
    always @(*) begin
        case (state)
            S_0: next_state = (data) ? S_cnt : S_1;
            S_1: next_state = (data) ? S_2 : S_cnt;
            S_2: next_state = (data) ? S_3 : S_cnt;
            S_3: next_state = (data) ? S_4 : S_cnt;
            S_4: next_state = (data) ? S_cnt : S_5;
            S_5: next_state = (data) ? S_not_match : S_match;
            S_cnt: next_state = (cnt == 1) ? S_not_match : S_cnt;
            S_not_match: next_state = (data) ? S_cnt : S_1;
            S_match: next_state = (data) ? S_cnt : S_1;
        endcase
    end

    always @(*) begin
        case (state)
            S_0: cnt_d = 3'd5;
            S_1: cnt_d = 3'd4;
            S_2: cnt_d = 3'd3;
            S_3: cnt_d = 3'd2;
            S_4: cnt_d = 3'd1;
            S_cnt: cnt_d = cnt - 1;
            default: cnt_d = 0;
        endcase
    end

    always @(*) begin
        match = (state == S_match);
        not_match = (state == S_not_match);
    end


endmodule
