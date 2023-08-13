`timescale 1ns / 1ps

module question3_tb;

    // Parameters
    parameter clk_period = 10;
    parameter delay_factor = 2;
    //Ports
    reg [7:0] pwm_in;
    reg clk;
    reg rst_n;
    wire pwm_out;

    question3 question3_inst (
        .pwm_in(pwm_in),
        .clk(clk),
        .rst_n(rst_n),
        .pwm_out(pwm_out)
    );
    initial begin
        clk   = 0;
        rst_n = 0;
        #45 rst_n = 1;
        pwm_in = 8'd10;

        #2585 pwm_in = 8'd255;
    end

    always begin
        #(clk_period / 2) clk <= 1'b0;
        #(clk_period / 2) clk <= 1'b1;
    end
endmodule
