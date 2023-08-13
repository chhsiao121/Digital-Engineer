// 請用verilog寫出以下功能
// PWM控制
// Ex: pwm_in=10， pwm_out會輸出10個cycle的high之後輸出(255-10)個cycle的low
// input: [7:0]pwm_in, clk, rst(異步)
// Output: pwm_out

module question3 (
    input [7:0] pwm_in,
    input clk,
    input rst_n,
    output reg pwm_out
);
    reg [7:0] cnt;
    reg pwm_d;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) pwm_out <= 0;
        else pwm_out <= pwm_d;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) cnt <= 0;
        else cnt <= cnt + 1;
    end


    always @(*) pwm_d = (cnt < pwm_in) ? 1 : 0;

endmodule
