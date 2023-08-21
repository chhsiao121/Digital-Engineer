`timescale 1ns/1ns
module sequence_detect(
	input clk,
	input rst_n,
	input data,
	input data_valid,
	output reg match
	);

	parameter S0 = 0;
	parameter S1 = 1;
	parameter S2 = 2;
	parameter S3 = 3;
	parameter S_match = 4;

	reg [2:0] state, next_state;

	always @(posedge clk or negedge rst_n) begin
		if(!rst_n) state <= S0;
		else if(!data_valid) state <= S0;
		else state <= next_state;
	end

	always @(*)begin
		case(state)
			S0: next_state = (data) ? S0 : S1;
			S1: next_state = (data) ? S2 : S1;
			S2: next_state = (data) ? S3 : S1;
			S3: next_state = (data) ? S0 : S_match;
			S_match : next_state = (data) ? S0 : S1;
			default : next_state = S0;
		endcase
	end

	always @(*)begin
		match = (state == S_match);
	end
  
endmodule