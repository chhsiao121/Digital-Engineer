`timescale 1ms/1ps
module tb_clk_div_N;
    reg clk;
    reg reset;
    wire clk_out;
    
    // Instantiate design under test
    clk_div_N u1(.clk(clk), .reset(reset), .clk_out(clk_out));
            
    initial begin
        // Dump waves
        $dumpfile("dump.vcd");
        $dumpvars(0);
        reset = 1;
        clk = 0;
        #24 reset = 0;
        #400
        $finish;
    end
    
    always #20 clk=~clk;
endmodule