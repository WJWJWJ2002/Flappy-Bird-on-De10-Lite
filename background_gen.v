module background_gen #(
	parameter[0:0] INIT=1'b0
	)
	(
	input clk,
	input rst_n,
	input over,
	input frame_done,
	input[9:0] pillar_pos,
	output reg[9:0] x_coord=10'd58
);
	
	reg frame_done_reg=0, start_gen=INIT, over_reg=0;

	always @(posedge clk) begin
		if (!rst_n || over_reg) begin
			x_coord <= 10'd58;
			start_gen <= INIT;
		end
		else begin
			start_gen <= ((pillar_pos == 10'd398) || (x_coord == 10'd398)) ? ~start_gen : start_gen;
			x_coord <= (frame_done_reg) ? 
				(start_gen) ? 
				x_coord + 3'd4 : 
				(((x_coord < 10'd698) && (x_coord != 10'd58)) ? (x_coord+3'd4) : (10'd58)):
				x_coord; 
		end
	end

	always @(posedge clk) begin
		over_reg <= over;
		if (!rst_n) begin
			frame_done_reg <= 1'b0;
		end
		else begin
			frame_done_reg <= frame_done;
		end
	end
		
endmodule

