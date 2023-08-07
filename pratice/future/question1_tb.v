module question1_tb;

    // Parameters

    //Ports
    reg [7:0] data_in;
    reg [2:0] position;
    reg set_clr;
    wire [7:0] data_out;

    question1 question1_inst (
        .data_in (data_in),
        .position(position),
        .set_clr (set_clr),
        .data_out(data_out)
    );
    initial begin
        data_in  = 0;
        position = 0;
        set_clr  = 0;
        #10 data_in = 8'b1001_0110;
        position = 3'd2;
        #10 data_in = 8'b1110_0111;
        set_clr  = 1'b1;
        position = 3'd3;

        #10 set_clr = 1'b1;
        data_in  = 8'b0000_1111;
        position = 3'd7;
        #10 position = 3'd6;
        #10 position = 3'd5;
        #10 position = 3'd4;
        #10 set_clr = 1'b0;
        position = 3'd4;
        #10 position = 3'd3;
        #10 position = 3'd0;
        #10 $finish;
    end

    //always #5  clk = ! clk ;

endmodule
