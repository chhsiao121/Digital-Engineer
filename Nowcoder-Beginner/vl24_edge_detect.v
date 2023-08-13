`timescale 1ns / 1ns
module edge_detect (
    input clk,
    input rst_n,
    input a,

    output reg rise,
    output reg down
);
    reg a_previous;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) a_previous <= 0;
        else a_previous <= a;
    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) rise <= 0;
        else if (!a_previous & a) rise <= 1;
        else rise <= 0;
    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) down <= 0;
        else if (a_previous & !a) down <= 1;
        else down <= 0;
    end



endmodule
