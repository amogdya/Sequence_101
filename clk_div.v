/*=============================================
		CLOCK DIVIDER
===============================================
Description:
This Module takes a high frequency input clock (clk_in) and divides it down to a
lower frequency.By default, it divides a 50MHz input clock to 1s clock period
toggling the outputs every 25,000,000 ticks 

Design Engineer:
Doctora, France Austin D.

Date:
18 Feb 2026
----------------------------------------------*/
module clk_div(clk_out,clk_in,clk_led);
//ports and nets
input clk_in;
output reg clk_out=1'b0;
output reg clk_led=1'b0;

//1s clock @50MHz
parameter integer FREQ_IN = 50_000_000; // 50MHz
parameter integer PERIOD_OUT = 1;//1s
localparam integer TICKS = (FREQ_IN*PERIOD_OUT)/2; //Numberof ticks every half cycle
integer tick_cnt =0;

always@(posedge clk_in)begin
	 if(tick_cnt==TICKS-1)begin
	tick_cnt <= 0;
	clk_out <= ~clk_out;
	clk_led <= ~clk_led;
end
 else tick_cnt <= tick_cnt + 1;
end

endmodule 
