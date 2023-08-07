`timescale 1ns / 1ps
module question2_tb;

    // Parameters
    parameter clk_period = 10;
    parameter delay_factor = 2;
    //Ports
    reg clk;
    reg rst_n;
    wire [4:0] H_reg;
    wire [5:0] M_reg;
    wire [5:0] S_reg;

    question2 question2_inst (
        .clk  (clk),
        .rst_n(rst_n),
        .H_reg(H_reg),
        .M_reg(M_reg),
        .S_reg(S_reg)
    );
    initial begin
        clk   = 0;
        rst_n = 0;
        #50 rst_n = 1;
    end

    always begin
        #(clk_period / 2) clk <= 1'b0;
        #(clk_period / 2) clk <= 1'b1;
    end
endmodule
