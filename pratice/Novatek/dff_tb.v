`timescale 1ns / 1ps
module dff_tb;

    // Parameters

    //Ports
    reg  clk;
    reg  en;
    reg  rst_n;
    reg  data_in;
    wire data_out;

    dff dff_inst (
        .clk(clk),
        .en(en),
        .rst_n(rst_n),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        #100 $finish;
    end
    initial
    fork
        rst_n = 1'b0;
        #15 rst_n = 1'b1;
        en = 1'b0;
        #25 en = 1'b1;
        data_in = 1'b0;
        #50 data_in = 1'b1;
    join
    always #5 clk = ~clk;

endmodule
