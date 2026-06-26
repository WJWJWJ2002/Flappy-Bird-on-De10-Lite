`timescale 1ns/1ps
module vga_tb;
	reg clk, rst_n;
	reg[9:0] pillar1, pillar2, bird;
	wire over, frame_done, VGA_HS, VGA_VS;
	wire[3:0] VGA_R, VGA_G, VGA_B;
	wire[7:0] score;

	vga_controller DUT (
		.clk (clk),
		.rst_n (rst_n),
		.pillar1_x (pillar1),
		.pillar2_x (pillar2),
		.bird_pos_y (bird),
		.over (over),
		.frame_done (frame_done),
		.H_SYNC (VGA_HS),
		.V_SYNC (VGA_VS),
		.VGA_R (VGA_R),
		.VGA_G (VGA_G),
		.VGA_B (VGA_B),
		.score (score)
	);

	initial begin
		clk = 1'b0;
		rst_n = 1'b1;
		pillar1 = 10'd515;
		pillar2 = 10'd58;
		bird = 10'd240;
		#2_000_000
		bird = 10'd100;
		#2_000_000
		pillar1 = 10'd58;
		pillar2 = 10'd515;
		bird = 10'd120;
		#2_000_000
		bird = 10'd90;
		#2_000_000
		rst_n = 1'b0;
		#3_000_000
		rst_n = 1'b1;
		pillar1 = 10'd695;
		pillar2 = 10'd58;
		bird = 10'd240;
		repeat (10) begin
			#2_000_000
			pillar1 <= pillar2;
			pillar2 <= pillar1;
		end
		$finish;
	end

	always #1 clk = ~clk;
endmodule

