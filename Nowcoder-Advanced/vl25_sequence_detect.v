`timescale 1ns / 1ns
module sequence_detect (
    input clk,
    input rst_n,
    input a,
    output reg match
);

    reg [7:0] a_tmp;

    always @(posedge clk or !rst_n) begin
        if (!rst_n) a_tmp <= 8'b11111111;
        else a_tmp <= {a_tmp[6:0], a};
    end

    always @(posedge clk or !rst_n) begin
        if (!rst_n) match <= 0;
        else if (a_tmp == 8'b01110001) match <= 1;
        else match <= 0;
        // match <= (a_tmp == 8'b01110001) ? 1'b1 : 1'b0;
    end
endmodule


// 如果有重複檢測的話可以使用移位暫存器來解決，不管有沒有重複檢測都能使用狀態機
