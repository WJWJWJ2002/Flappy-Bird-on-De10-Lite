`timescale 1ns/1ps
module bird_tb;
	reg clk, rst_n, over, up, frame_done;
	wire[9:0] y_coord;

	bird_control dut_0 (
		.clk (clk),
		.rst_n (rst_n),
		.over (over),
		.up (up),
		.frame_done (frame_done),
		.y_coord (y_coord)
	);

	initial begin 
		clk = 1'b0;
		rst_n = 1'b1;
		up = 1'b1;
		over = 1'b0;
		frame_done = 1'b0;
		repeat (1000) begin
			#5 frame_done = ~frame_done;
		end
		rst_n = 1'b0;
		#1000
		rst_n = 1'b1;
		up = 1'b0;
		frame_done = 1'b1;
		#100
		up = 1'b1;
		#1500
		up = 1'b0;
		#2000
		$finish;
		
	end

	always @(*) begin
		over = (y_coord >= 10'd460 || y_coord == 10'd0) ? 1'b1 : 1'b0;
	end

	always #2.5 clk = ~clk;

endmodule
