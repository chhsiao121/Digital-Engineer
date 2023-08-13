`timescale 1ns / 1ns
module rom (
    input clk,
    input rst_n,
    input [7:0] addr,  //這個addr的bit樹不合理，記憶體的深度為8=>addr應該為3bit

    output [3:0] data
);
    reg [3:0] data_rom[7:0];
    integer i;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < 8; i++) begin
                data_rom[i] <= i << 1;
            end
        end
    end

    assign data = data_rom[addr];
endmodule
