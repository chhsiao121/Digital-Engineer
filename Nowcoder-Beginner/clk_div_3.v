`timescale 1ns/1ns

module clk_div_3(
   input             clk,
   input             reset,
   output            clk_out);
reg [1:0] count
always @(posedge clk or negedge clk or posedge reset) begin
      if(reset)
         count <= 0;
      else if(count == 2'd2)
         count <= 2'd0;
      else
         count <= count + 1;

end

always @(posedge clk or negedge clk or posedge reset) begin
   if(reset)
      clk_out<=0;
   else if(count == 2;d2)
      clk_out <= ~clk_out;
   else
      clk_out <= ~clk_out;
end
endmodule

