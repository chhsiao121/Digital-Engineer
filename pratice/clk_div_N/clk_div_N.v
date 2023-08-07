module clk_div_N(
    input             clk,
    input             reset,
    output   reg      clk_out);
    parameter WIDTH = 3;
    parameter N     = 6;
    reg [WIDTH-1:0] count;

    always @(posedge clk or negedge clk or posedge reset) begin
        if(reset)
            count <= 0;
        else if(count == (N-1))
            count <= 0;
        else
            count <= count + 1;
        end

    always @(posedge clk or negedge clk or posedge reset) begin
        if(reset)
            clk_out<=0;
        else if(count == (N-1))
            clk_out <= ~clk_out;
        else
            clk_out <= clk_out;
    end
endmodule

