module model #(
    parameter DATA_WIDTH = 32
) (
    input [DATA_WIDTH-1:0] din,
    input din_en,
    input [1:0] addr,
    output logic [DATA_WIDTH-1:0] dout0,
    output logic [DATA_WIDTH-1:0] dout1,
    output logic [DATA_WIDTH-1:0] dout2,
    output logic [DATA_WIDTH-1:0] dout3
);

    always @(*) begin
        case (addr)
            2'd0: dout0 = (din_en) ? din : 0;
            2'd1: dout1 = (din_en) ? din : 0;
            2'd2: dout2 = (din_en) ? din : 0;
            2'd3: dout3 = (din_en) ? din : 0;
        endcase
    end
endmodule
