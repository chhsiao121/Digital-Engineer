`timescale 1ns/1ns

module comparator_4(
	input		[3:0]       A   	,
	input	   [3:0]		B   	,
 
 	output	 wire		Y2    , //A>B
	output   wire        Y1    , //A=B
    output   wire        Y0      //A<B
);
	wire [3:0] axnorb;

	xnor (axnorb[3], A[3], B[3]);
	xnor (axnorb[2], A[2], B[2]);
	xnor (axnorb[1], A[1], B[1]);
	xnor (axnorb[0], A[0], B[0]);
	

	assign Y2 = (A[3] & ~B[3]) | (axnorb[3]&A[2]&~B[2]) | (axnorb[3]&axnorb[2]&A[1]&~B[1]) |(axnorb[3]&axnorb[2]&axnorb[1]&A[0]&~B[0]);
	assign Y1 = (axnorb[3]&axnorb[2]&axnorb[1]&axnorb[0]);
	assign Y0 = (~A[3] & B[3]) | (axnorb[3]&~A[2]&B[2]) | (axnorb[3]&axnorb[2]&~A[1]&B[1]) |(axnorb[3]&axnorb[2]&axnorb[1]&~A[0]&B[0]);

endmodule


