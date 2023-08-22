`timescale 1ns / 1ns
module signal_generator (
    input clk,
    input rst_n,
    input [1:0] wave_choise,
    output reg [4:0] wave
);
    reg [4:0] cnt, wave_d;
    reg flag_for3;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) wave <= 0;
        else begin
            wave <= wave_d;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) cnt <= 0;
        else begin
            case (wave_choise)
                2'd0: begin
                    if (cnt == 5'd19) cnt <= 0;
                    else cnt <= cnt + 1;
                end
                default: cnt <= 0;
            endcase
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) flag_for3 <= 1;
        else if (wave_choise == 2'd2) begin
            if (wave == 5'd19 || wave == 5'd20) flag_for3 <= 1;
            else if (wave == 5'd1 || wave == 5'd0) flag_for3 <= 0;
        end
    end
    always @(*) begin
        case (wave_choise)
            2'd0: begin
                if (cnt == 5'd19) wave_d = 0;
                else if (cnt == 5'd9) wave_d = 5'd20;
                else wave_d = wave;
            end
            2'd1: wave_d = (wave == 5'd20) ? 0 : wave + 1;
            2'd2: wave_d = (flag_for3) ? wave - 1 : wave + 1;
        endcase
    end
endmodule
