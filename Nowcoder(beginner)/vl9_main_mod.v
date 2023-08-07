`timescale 1ns/1ns
module main_mod(
	input clk,
	input rst_n,
	input [7:0]a,
	input [7:0]b,
	input [7:0]c,
	
	output [7:0]d
);
	wire [7:0] u1_output;
	wire [7:0] u2_output;
	reg [7:0] delay_data;
	min_2 u1(
		.clk(clk),
		.rst_n(rst_n),
		.a(a),
		.b(b),
		.c(u1_output)
		);

	min_2 u2(
		.clk(clk),
		.rst_n(rst_n),
		.a(b),
		.b(c),
		.c(u2_output)
		);

	min_2 u3(
		.clk(clk),
		.rst_n(rst_n),
		.a(u1_output),
		.b(u2_output),
		.c(d)
		);

	

endmodule



module min_2(
	input clk,
	input rst_n,
	input [7:0]a,
	input [7:0]b,

	output reg [7:0]c
);
always@(posedge clk or negedge rst_n)begin
	if(!rst_n)c<=0;
	else begin
		c<= (a>b) ?b :a;
	end
end


endmodule