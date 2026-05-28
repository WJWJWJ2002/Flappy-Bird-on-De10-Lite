module background_gen #(
	parameter[0:0] INIT=1'b0
	)
	(
	input clk,
	input rst_n,
	input frame_done,
	input[9:0] pillar_pos,
	output reg[9:0] x_coord=10'd58
);
	
	reg frame_done_reg=0, start_gen=INIT;
	reg[7:0] frame_count=0;

	always @(posedge clk) begin
		if (!rst_n) begin
			x_coord <= 10'd58;
			start_gen <= INIT;
			frame_count <= 8'd0;
		end
		else begin
			frame_count <= (frame_done_reg) ? ((frame_count == 8'd170) ? 8'd0 : frame_count + 1'b1) : frame_count;
			start_gen <= (pillar_pos == 10'd400 || x_coord == 10'd400) ? ~start_gen : start_gen;
			//height_up <= (frame_count >= 8'd100) ? 10'd99 : 10'd179;
			//height_down <= (frame_count >= 8'd100) ? 10'd279 : 10'd359;
			x_coord <= (frame_done_reg) ? 
				(start_gen) ? 
				(x_coord + 2'd2) : ((x_coord < 10'd698 && x_coord != 10'd58) ? (x_coord+2'd2) : (10'd58))
				: x_coord; 
		end
	end

	always @(posedge clk) begin
		if (!rst_n)
			frame_done_reg <= 1'b0;
		else
			frame_done_reg <= frame_done;
	end
		
endmodule

