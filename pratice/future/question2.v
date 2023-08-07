module question2 (
    input clk,
    input rst_n,
    output reg [4:0] H_reg,
    output reg [5:0] M_reg,
    output reg [5:0] S_reg
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) S_reg <= 0;
        else if (S_reg == 6'd59) S_reg <= 0;
        else S_reg <= S_reg + 1;
    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) M_reg <= 0;
        else if (S_reg == 6'd59) begin
            if (M_reg == 6'd59) M_reg <= 0;
            else M_reg <= M_reg + 1;
        end
    end
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) H_reg <= 0;
        else if (S_reg == 6'd59 && M_reg == 6'd59) begin
            if (H_reg == 5'd23) H_reg <= 0;
            else H_reg <= H_reg + 1;
        end
    end


endmodule
