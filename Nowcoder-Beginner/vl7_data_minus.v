`timescale 1ns/1ns
module data_minus(
	input clk,
	input rst_n,
	input [7:0]a,
	input [7:0]b,

	output  reg [8:0]c
);
always @(posedge clk or negedge rst_n)begin
	if(!rst_n) c <= 0;
	else begin
		c<= (a>b) ? (a-b) : (b-a);
	end
end
endmodule