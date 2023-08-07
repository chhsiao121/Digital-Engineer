// 請用Verilog寫出以下功能
// Input: [7:0]data_in, [2:0]position, set_clr
// Output: [7:0]data_out
// Ex : 
// 輸入data_in = 0101_1010, position =2, set_clr=1
// 輸出data_out=0101_1110

// 輸入data_in = 0101_1110, position =1, set_clr=0
// 輸出data_out=0101_1100

module question1 (
    input [7:0] data_in,
    input [2:0] position,
    input set_clr,
    output reg [7:0] data_out
);

    // always @(*) begin
    //     if (set_clr) begin
    //         case (position)
    //             3'd0: data_out = {data_in[7:1], 1'b1};
    //             3'd1: data_out = {data_in[7:2], 1'b1, data_in[0]};
    //             3'd2: data_out = {data_in[7:3], 1'b1, data_in[1:0]};
    //             3'd3: data_out = {data_in[7:4], 1'b1, data_in[2:0]};
    //             3'd4: data_out = {data_in[7:5], 1'b1, data_in[3:0]};
    //             3'd5: data_out = {data_in[7:6], 1'b1, data_in[4:0]};
    //             3'd6: data_out = {data_in[7], 1'b1, data_in[5:0]};
    //             3'd7: data_out = {1'b1, data_in[6:0]};
    //             default: data_out = 8'd0;
    //         endcase
    //     end else begin
    //         case (position)
    //             3'd0: data_out = {data_in[7:1], 1'b0};
    //             3'd1: data_out = {data_in[7:2], 1'b0, data_in[0]};
    //             3'd2: data_out = {data_in[7:3], 1'b0, data_in[1:0]};
    //             3'd3: data_out = {data_in[7:4], 1'b0, data_in[2:0]};
    //             3'd4: data_out = {data_in[7:5], 1'b0, data_in[3:0]};
    //             3'd5: data_out = {data_in[7:6], 1'b0, data_in[4:0]};
    //             3'd6: data_out = {data_in[7], 1'b0, data_in[5:0]};
    //             3'd7: data_out = {1'b0, data_in[6:0]};
    //             default: data_out = 8'd0;
    //         endcase
    //     end
    // end
    always @(*) begin
        data_out = data_in;
        case (position)
            3'd0: data_out[0] = (set_clr) ? 1'b1 : 1'b0;
            3'd1: data_out[1] = (set_clr) ? 1'b1 : 1'b0;
            3'd2: data_out[2] = (set_clr) ? 1'b1 : 1'b0;
            3'd3: data_out[3] = (set_clr) ? 1'b1 : 1'b0;
            3'd4: data_out[4] = (set_clr) ? 1'b1 : 1'b0;
            3'd5: data_out[5] = (set_clr) ? 1'b1 : 1'b0;
            3'd6: data_out[6] = (set_clr) ? 1'b1 : 1'b0;
            3'd7: data_out[7] = (set_clr) ? 1'b1 : 1'b0;
            default: data_out = 8'd0;
        endcase

    end

endmodule
