`timescale 1ns/1ps
module score_gen_tb;
	reg clk, rst_n;
	reg[7:0] score;
	wire[7:0] seg0, seg1, seg2, seg3;

	initial begin
		rst_n = 1'b1;
		clk = 1'b0;
		score = 8'd00;
		#100
		score = 8'd05;
		#100
		score = 8'd15;
		#100
		score = 8'd01;
		#100
		score = 8'd00;
		rst_n = 1'b0;
		#40
		score = 8'd140;
		#60 
		score = 8'd00;
		#250
		rst_n = 1'b1;
		#100
		score = 8'd01;
		#100
		score = 8'd02;
		#100 
		score = 8'd200;
		#100
		score = 8'd4;
		#50
		$finish;
	end

	score_gen DUT (
		.clk (clk),
		.rst_n (rst_n),
		.score (score),
		.seg0 (seg0),
		.seg1 (seg1),
		.seg2 (seg2),
		.seg3 (seg3)
	);

	always #20 clk = ~clk;
endmodule

