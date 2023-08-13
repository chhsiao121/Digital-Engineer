`timescale 1ns/1ns

module data_cal(
input clk,
input rst,
input [15:0]d,
input [1:0]sel,

output reg[4:0]out,
output reg validout
);
//*************code***********//
reg [15:0]i_data; 

always@(posedge clk or negedge rst)begin
    if(!rst)begin
        i_data<=0;
        out<=0;
    end
    else if(sel==2'd0) i_data<=d;
end

always@(*)begin
    case(sel)
        2'd0:begin
            out = 0;
            validout = 0;
        end 
        2'd1:begin
            out = {5{rst}}&(i_data[3:0] + i_data[7:4]);
            validout = 1;
        end
        2'd2:begin
            out = {5{rst}}&(i_data[3:0] + i_data[11:8]);
            validout = 1;
        end
        2'd3:begin
            out = {5{rst}}&(i_data[3:0] + i_data[15:12]);
            validout = 1;
        end
    endcase
end
//*************code***********//
endmodule