`timescale 1ns/1ns

module lca_4 #(parameter width=4)(
	input		[width-1:0]       A_in  ,
	input	    [width-1:0]		B_in  ,
    input                   C_1   ,
 
 	output	 wire			CO    ,
	output   wire [width-1:0]	    S
);
	wire [width-1:0] P,G;
	reg [width:0] C;
	genvar i;
	generate 
		for(i=0;i<width;i=i+1) begin
			pg_gen U1 (
				.A(A_in[i]),
				.B(B_in[i]),
				.P(P[i]),
				.G(G[i])
				);
		end
	endgenerate
	integer j;
	always@(*)begin
			C[0] = C_1;
		for(j=1;j<=width;j=j+1)begin
			C[j] = G[j-1] | C[j-1]&P[j-1];
		end
	end
	assign CO = C[width];

	genvar k;
	generate 
		for(i=0;i<width;i=i+1) begin
			assign S[i] = C[i] ^ P[i];
		end
	endgenerate
	

endmodule


module pg_gen(
	input A,
	input B,
	output P,
	output G
);
	assign P = A ^ B;
	assign G = A & B;
endmodule