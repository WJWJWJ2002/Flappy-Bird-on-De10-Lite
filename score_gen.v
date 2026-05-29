module score_gen(
	input clk,
	input[7:0] score,
	output wire[7:0] seg0,
	output wire[7:0] seg1
	);
	
	reg[7:0] score_reg=0;
	always @(posedge clk) begin
		score_reg <= score;
	end
	disp_7seg s0 (
		.dec (score_reg[3:0]),
		.dec_seg (seg0)
	);

	disp_7seg s1 (
		.dec (score_reg[7:4]),
		.dec_seg (seg1)
	);

endmodule

