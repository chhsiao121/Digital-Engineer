`timescale 1ns/1ns
module multi_sel(
input [7:0]d ,
input clk,
input rst,
output reg input_grant,
output reg [10:0]out
);
//*************code***********//
    reg [2:0] state, n_state;
    reg [7:0]i_data;


    localparam IDLE = 3'd0;
    localparam S1 = 3'd1; 
    localparam S3 = 3'd2; 
    localparam S7 = 3'd3; 
    localparam S8 = 3'd4; 

    always@(posedge clk or negedge rst)begin
        if(!rst)begin
            state <= IDLE;
        end 
        else begin
            state <= n_state;
        end
    end

    always @(*)begin
        case (state)
            IDLE: begin
                out = 0;
                input_grant = 0;
                n_state = S1;       
            end
            S1: begin
                out = i_data;
                input_grant = 1;
                n_state = S3;
            end
            S3: begin
                out = (i_data<<<1) + i_data;
                input_grant = 0;
                n_state = S7;
            end
            S7: begin
                out = (i_data<<<3) - i_data;
                input_grant = 0;
                n_state = S8;
            end
            S8: begin
                out = i_data<<<3;
                input_grant = 0;
                n_state = S1;
            end
            default: begin
                out = 0;
                input_grant = 0;
                n_state = IDLE;
            end
        endcase
    end

    always@(posedge clk or negedge rst)begin
        if(!rst) i_data<=0;
        else begin
            if(n_state == S1) i_data <= d;
        end
    end
endmodule