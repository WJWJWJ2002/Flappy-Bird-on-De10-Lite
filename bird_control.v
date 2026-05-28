module bird_control(
	input clk,
	input rst_n,
	input up,
	input frame_done,
	output reg[9:0] y_coord=10'd239
);
	
	reg frame_done_reg=1'b0;
	
	wire up_valid;

	up_sampling player_input (
		.clk (clk),
		.up (up),
		.up_valid (up_valid)
	);

	always @(posedge clk) begin
		if (!rst_n) begin
			y_coord <= 10'd239;
		end
		else begin
			if (!up_valid) begin
				y_coord <= (frame_done_reg) ? y_coord - 3'd4 : y_coord;
			end
			else begin
				y_coord <= (frame_done_reg) ? y_coord + 2'd2 : y_coord;
			end
		end
	end

	always @(posedge clk) begin
		if (!rst_n) begin
			frame_done_reg <= 1'b0;
		end
		else begin
			frame_done_reg <= frame_done;
		end
	end
endmodule

