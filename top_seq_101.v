//top level design for sequence 101
module top_seq_101(in,clk_in,out,state,rst,clk_led);
//ports
input 			in;
input 			clk_in;
input 			rst;
output	 		out;
output [1:0]	state;
output 		 	clk_led;

//nets
wire clk_w;
//clock divider instance
clk_div #(.PERIOD_OUT(3))  dut(
.clk_out(clk_w),
.clk_in(clk_in),
.clk_led(clk_led)
);

//seq 101 instance
sequence_101 seq_101(
.in(in),
.out(out),
.state(state),
.rst(rst),
.clk(clk_w)
);

endmodule 