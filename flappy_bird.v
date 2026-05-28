module flappy_bird(
	input clk_50,
	input rst_n,
	input up,
	output wire VGA_HS,
	output wire VGA_VS,
	output wire[3:0] VGA_R,
	output wire[3:0] VGA_G,
	output wire[3:0] VGA_B
);

	wire clk_25, frame_done, active_pillar1, active_pillar1_n, active_pillar2;
	wire[9:0] pillar1_pos, pillar2_pos, bird_pos;

	PLL pll_0 (
		.inclk0(clk_50),
		.c0(clk_25)
	);

	background_gen #(
		.INIT(1'b1)
	) pillar1 (
		.clk(clk_25),
		.rst_n(rst_n),
		.frame_done(frame_done),
		.pillar_pos(pillar2_pos),
		.x_coord(pillar1_pos)
	);

	background_gen #(
		.INIT(1'b0)
	) pillar2 (
		.clk(clk_25),
		.rst_n(rst_n),
		.frame_done(frame_done),
		.pillar_pos(pillar1_pos),
		.x_coord(pillar2_pos)
	);

	bird_control bird_gen_0 (
		.clk(clk_25),
		.rst_n(rst_n),
		.up(up),
		.frame_done(frame_done),
		.y_coord(bird_pos)
	);

	vga_controller vga_0 (
		.clk(clk_25),
		.rst_n(rst_n),
		.pillar1_x(pillar1_pos),
		.pillar2_x(pillar2_pos),
		.bird_pos_y(bird_pos),
		.VGA_R(VGA_R),
		.VGA_G(VGA_G),
		.VGA_B(VGA_B),
		.H_SYNC(VGA_HS),
		.V_SYNC(VGA_VS),
		.frame_done(frame_done)
	);

	assign active_pillar1_n = ~active_pillar1;
endmodule

