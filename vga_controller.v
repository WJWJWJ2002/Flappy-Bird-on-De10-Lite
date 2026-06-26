module vga_controller(
	input clk,
	input rst_n,
	input[9:0] pillar1_x,
	input[9:0] pillar2_x,
	input[9:0] bird_pos_y,
	output frame_done,
	output reg over=0,
	output reg H_SYNC=0,
	output reg V_SYNC=0,
	output reg[3:0] VGA_R=0,
	output reg[3:0] VGA_G=0, 
	output reg[3:0] VGA_B=0,
	output reg[7:0] score=0
);
	
	parameter[9:0] MAX_H_OFFSET = 10'd699, MAX_H = 10'd639, MAX_V = 10'd479, PILLAR_WIDTH = 10'd60;
	parameter[9:0] BIRD_LEFT = 10'd180, BIRD_RIGHT = 10'd203, BIRD_HEIGHT = 10'd20;
	reg next_pillar=0;
	reg[9:0] x_count=0, y_count=0, pillar1_x_reg=0, upper_pillar1_reg=10'd179, bottom_pillar1_reg=10'd359;
	reg[9:0] left1_bound=10'd639, right1_bound=10'd699;
	reg[9:0] bird_pos_reg=10'd240;
	reg[9:0] pillar2_x_reg=0, upper_pillar2_reg=10'd100, bottom_pillar2_reg=10'd240, left2_bound=0, right2_bound=0;
	
	always @(posedge clk) begin
		if (!rst_n || over) begin
			VGA_R <= 4'd0;
			VGA_G <= 4'd0;
			VGA_B <= 4'd0;
			x_count <= (x_count == 10'd799) ? (10'd0) : (x_count + 1'b1);
			y_count <= (y_count == 10'd524) ? (10'd0) : ((x_count == 10'd799) ? (y_count + 1'b1) : (y_count));
			H_SYNC <= (x_count <= 10'd655 || x_count > 10'd751) ? 1'b1 : 1'b0;
			V_SYNC <= (y_count <= 10'd489 || y_count > 10'd491) ? 1'b1 : 1'b0;
			left1_bound <= MAX_H_OFFSET - pillar1_x_reg;
			right1_bound <= MAX_H_OFFSET - pillar1_x_reg + PILLAR_WIDTH;
			left2_bound <= MAX_H_OFFSET - pillar2_x_reg;
			right2_bound <= MAX_H_OFFSET - pillar2_x_reg + PILLAR_WIDTH;
			over <= 1'b0;
			score <= 8'd0;
			next_pillar <= 1'b0;
		end
		else begin
			pillar1_x_reg <= pillar1_x;
			pillar2_x_reg <= pillar2_x;
			bird_pos_reg <= bird_pos_y;
			x_count <= (x_count == 10'd799) ? (10'd0) : (x_count + 1'b1);
			y_count <= (y_count == 10'd524) ? (10'd0) : ((x_count == 10'd799) ? (y_count + 1'b1) : (y_count));
			H_SYNC <= (x_count <= 10'd655 || x_count > 10'd751) ? 1'b1 : 1'b0;
			V_SYNC <= (y_count <= 10'd489 || y_count > 10'd491) ? 1'b1 : 1'b0;
			left1_bound <= MAX_H_OFFSET - pillar1_x_reg;
			right1_bound <= MAX_H_OFFSET - pillar1_x_reg + PILLAR_WIDTH;
			left2_bound <= MAX_H_OFFSET - pillar2_x_reg;
			right2_bound <= MAX_H_OFFSET - pillar2_x_reg + PILLAR_WIDTH;
		 	VGA_G <= ((x_count <= MAX_H) && rst_n) ? 
				(
				((left1_bound <= x_count) && (x_count <= right1_bound)) && 
				((y_count <= upper_pillar1_reg) || (y_count >= bottom_pillar1_reg)) && 
				(y_count <= MAX_V)
				) ? (4'd15) : (4'd0) : 
				4'd0; 
			VGA_R <= ((x_count <= MAX_H) && rst_n) ?
				(
				((left2_bound <= x_count) && (x_count <= right2_bound)) &&
				((y_count <= upper_pillar2_reg) || (y_count >= bottom_pillar2_reg)) &&
				(y_count <= MAX_V)
				) ? (4'd15) : (4'd0) :
				(4'd0);
			VGA_B <= ((x_count <= MAX_H) && rst_n) ? 
				(
				(y_count >= bird_pos_reg) &&
				(y_count <= bird_pos_reg + BIRD_HEIGHT) &&
				(x_count >= BIRD_LEFT) &&
				(x_count <= BIRD_RIGHT)
				) ? 
				(4'd15) : (4'd0): 
				(4'd0);
			
			if ((bird_pos_reg+BIRD_HEIGHT) > MAX_V || bird_pos_reg == 10'd0) begin
				over <= 1'b1;
			end
			else if ((BIRD_LEFT <= left1_bound) && (BIRD_RIGHT >= left1_bound)) begin
				if ((bird_pos_reg <= upper_pillar1_reg) || ((bird_pos_reg+BIRD_HEIGHT)>=bottom_pillar1_reg)) begin
					over <= 1'b1;
				end
				else begin
					over <= 1'b0;
				end
			end
			else if ((BIRD_LEFT <= left2_bound) && (BIRD_RIGHT >= left2_bound)) begin
				if ((bird_pos_reg <= upper_pillar2_reg) || ((bird_pos_reg+BIRD_HEIGHT)>=bottom_pillar2_reg)) begin
					over <= 1'b1;
				end
				else begin
					over <= 1'b0;
				end
			end
			else if ((BIRD_LEFT <= right1_bound) && (BIRD_RIGHT > right1_bound)) begin
				if ((bird_pos_reg <= upper_pillar1_reg) || ((bird_pos_reg+BIRD_HEIGHT)>=bottom_pillar1_reg)) begin
					over <= 1'b1;
				end
				else begin
					over <= 1'b0;
				end
			end
			else if ((BIRD_LEFT <= right2_bound) && (BIRD_RIGHT > right2_bound)) begin
				if ((bird_pos_reg <= upper_pillar2_reg) || ((bird_pos_reg+BIRD_HEIGHT)>=bottom_pillar2_reg)) begin
					over <= 1'b1;
				end
				else begin
					over <= 1'b0;
				end
			end
			else if ((BIRD_LEFT >= left1_bound) && (BIRD_RIGHT <= left1_bound)) begin
				if ((bird_pos_reg <= upper_pillar1_reg) || ((bird_pos_reg+BIRD_HEIGHT)>=bottom_pillar1_reg)) begin
					over <= 1'b1;
				end
				else begin
					over <= 1'b0;
				end
			end
			else if ((BIRD_LEFT >= left2_bound) && (BIRD_RIGHT <= left2_bound)) begin
				if ((bird_pos_reg <= upper_pillar2_reg) || ((bird_pos_reg+BIRD_HEIGHT)>=bottom_pillar2_reg)) begin
					over <= 1'b1;
				end
				else begin
					over <= 1'b0;
				end
			end
			
			if ((BIRD_LEFT > right1_bound) && !next_pillar) begin
				next_pillar <= ~next_pillar;
				score <= score + 1'b1;
			end
			else if ((BIRD_LEFT > right2_bound) && next_pillar) begin
				next_pillar <= ~next_pillar;
				score <= score + 1'b1;
			end
		end
	end
	
	assign frame_done = (y_count == 10'd480 && x_count == 10'd0) ? 1'b1 : 1'b0;
endmodule

