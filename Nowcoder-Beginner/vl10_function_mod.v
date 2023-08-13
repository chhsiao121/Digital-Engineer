`timescale 1ns/1ns
module function_mod(
	input [3:0]a,
	input [3:0]b,
	
	output [3:0]c,
	output [3:0]d
);
	assign c = data_rvs(a);
	assign d = data_rvs(b);


function [3:0] data_rvs;
	input [3:0]data;
	integer i;
	begin
		for(i=0;i<=4;i=i+1)begin
			data_rvs[3-i] = data[i];
		end
	end
endfunction
endmodule