`timescale 1ns/1ps
module background_tb;
	reg clk, rst_n, frame_done, over;
	wire[9:0] pillar1_pos, pillar2_pos;
	background_gen #(
		.INIT (1'b1)
	) dut_0 (
		.clk (clk),
		.rst_n (rst_n),
		.over (over),
		.frame_done (frame_done),
		.pillar_pos (pillar2_pos),
		.x_coord (pillar1_pos)
	);

	background_gen #(
		.INIT (1'b0)
	) dut_1 (
		.clk (clk),
		.rst_n (rst_n),
		.over (over),
		.frame_done (frame_done),
		.pillar_pos (pillar1_pos),
		.x_coord (pillar2_pos)
	);

	initial begin
		clk = 1'b0;
		rst_n = 1'b1;
		frame_done = 1'b0;
		over = 1'b0;
		#1000
		rst_n = 1'b0;
		#50
		rst_n = 1'b1;
		#100
		over = 1'b1;
		#10
		over = 1'b0;
		#10000
		$finish;
		
	end

	always #1 clk = ~clk;
	always @(posedge clk) begin
		frame_done <= ~frame_done;
	end
endmodule

