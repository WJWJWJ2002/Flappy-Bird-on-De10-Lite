module score_gen(
	input clk,
	input rst_n,
	input[7:0] score,
	output wire[7:0] seg0,
	output wire[7:0] seg1,
	output wire[7:0] seg2,
	output wire[7:0] seg3
	);
	
	reg[7:0] score_reg=0, highscore=0;
	always @(posedge clk) begin
		score_reg <= score;
		if (!rst_n) begin
			highscore <= 8'd0;
		end
		else if (score_reg > highscore) begin
			highscore <= score_reg;
		end
	end
	disp_7seg s0 (
		.dec (score_reg[3:0]),
		.dec_seg (seg0)
	);

	disp_7seg s1 (
		.dec (score_reg[7:4]),
		.dec_seg (seg1)
	);

	disp_7seg s2 (
		.dec (highscore[3:0]),
		.dec_seg (seg2)
	);

	disp_7seg s3 (
		.dec (highscore[7:4]),
		.dec_seg (seg3)
	);
endmodule

