`timescale 1ns/1ps
module four_stage_pipeline_tb (
);
    reg En,Ld,clk,rst;
    reg [7:0] Data;
    wire [31:0] R0;


    four_state_pipeline u_four_state_pipeline(
        .En   (En   ),
        .Ld   (Ld   ),
        .clk  (clk  ),
        .rst  (rst  ),
        .Data (Data ),
        .R0   (R0   )
    );
    initial begin
        #250 $finish;
    end
    initial fork
        rst = 1'b1;
        #15 rst = 1'b0;
        #95 rst = 1'b1;
        #105 rst = 1'b0;
        En = 1'b0;
        #25 En = 1'b1;
        #215 En = 1'b0;
        Ld = 1'b0;
        #35 Ld = 1'b1;
        #55 Ld = 1'b0;
        #75 Ld = 1'b1;
        #235 Ld = 1'b0;
    join
    
    initial begin
        clk = 1;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        #5 Data = 8'd0;
        forever begin
            #10 Data = Data + 8'd1;
        end
    end
    
endmodule