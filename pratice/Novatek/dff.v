module dff (
    input clk,
    input en,
    input rst_n,
    input data_in,
    output reg data_out
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) data_out <= 1'b0;
        else if (en) data_out <= data_in;
    end
endmodule
