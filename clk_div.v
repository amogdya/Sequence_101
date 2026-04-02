/*=============================================
		CLOCK DIVIDER
===============================================
Description:
This module takes 50MHz clock input
and divide it to produce 1Hz clock output.

Design Engineer:
Doctora, France Austin D.
Servantes, Jenenlyn B.

Date:
18 Feb 2026
----------------------------------------------*/
module clk_div(clk_out,clk_in,clk_led);
//ports and nets
input clk_in;
output reg clk_out=1'b0;
output reg clk_led=1'b0;

//1s clock @50MHz
parameter integer TICKS_1_5S =75_000_000;// no. of ticks per 0.5s
reg [26:0]tick_cnt = 27'b0;// count 0...24_999_999

always@(posedge clk_in)begin
	
 if(tick_cnt==TICKS_1_5S-1)begin
	tick_cnt <= 75'b0;
	clk_out <= ~clk_out;
	clk_led <= ~clk_led;
end
 else tick_cnt = tick_cnt + 27'b1;
end

endmodule 