`timescale 1ns/1ps
module flappy_tb;
	reg clk_50, rst_n, up;
	wire VGA_HS, VGA_VS;
	wire[3:0] VGA_R, VGA_G, VGA_B;

	initial begin
		$stop;
		clk_50 = 1'b0;
		rst_n = 1'b1;
		up = 1'b0;
		#1_000_000_000
		rst_n = 1'b0;
		#5000
		rst_n = 1'b1;
		#4_000_000_000
		#4_000_000_000
		$finish;
	end

	flappy_bird DUT_0 (
		.clk_50 (clk_50),
		.rst_n (rst_n),
		.up (up),
		.VGA_HS (VGA_HS),
		.VGA_VS (VGA_VS),
		.VGA_R (VGA_R),
		.VGA_G (VGA_G),
		.VGA_B (VGA_B)
	);

	always #10 clk_50 = ~clk_50;

endmodule

