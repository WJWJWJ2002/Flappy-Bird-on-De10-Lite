`timescale 1ns/1ps
module score_gen_tb;
	reg clk;
	reg[7:0] score;
	wire[7:0] seg0, seg1, seg2;

	initial begin
		$stop;
		clk = 1'b0;
		score = 8'h00;
		#1000
		score = 8'h05;
		#1000
		score = 8'h1f;
		#1000
		score = 8'hff;
		#500
		$finish;
	end

	score_gen DUT (
		.clk (clk),
		.score (score),
		.seg0 (seg0),
		.seg1 (seg1)
	);

	always #20 clk = ~clk;
endmodule

