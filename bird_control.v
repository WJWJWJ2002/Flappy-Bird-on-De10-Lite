module bird_control(
	input clk,
	input rst_n,
	input over,
	input up,
	input frame_done,
	output reg[9:0] y_coord=10'd240
);
	
	reg frame_done_reg=1'b0, over_reg=0;
	
	always @(posedge clk) begin
		if (!rst_n || over_reg) begin
			y_coord <= 10'd240;
		end
		else begin
			if (!up) begin
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
		over_reg <= over;
	end
endmodule

