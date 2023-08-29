`timescale 1ns / 1ns

module s_to_p (
    input clk,
    input rst_n,
    input valid_a,
    input data_a,

    output reg ready_a,
    output reg valid_b,
    output reg [5:0] data_b
);
    reg [5:0] data_b_d;
    reg [2:0] cnt;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) cnt <= 0;
        else if (valid_a) begin
            if (cnt == 3'd5) cnt <= 0;
            else cnt <= cnt + 1;
        end

    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) data_b_d <= 0;
        else if (valid_a) begin
            data_b_d <= {data_a, data_b_d[5:1]};
        end
    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) data_b <= 0;
        else if (cnt == 3'd5 && valid_a) begin
            data_b <= {data_a, data_b_d[5:1]};
        end
    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) valid_b <= 0;
        else if (cnt == 3'd5 && valid_a) valid_b <= 1;
        else valid_b <= 0;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) ready_a <= 1'b0;
        else ready_a <= 1'b1;
    end
endmodule
