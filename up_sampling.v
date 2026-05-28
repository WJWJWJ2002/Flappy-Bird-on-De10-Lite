module up_sampling(
	input clk,
	input up,
	output up_valid
);
	
	localparam[1:0] SAMPLE=2'd0, DELAY=2'd1, WAIT_RESET=2'd2;
	reg up_reg=1'b1;
	reg[1:0] state=SAMPLE, next_state=SAMPLE;
	reg[17:0] delay=18'd0;
	always @(*) begin
		case (state)
			SAMPLE: next_state = (!up) ? DELAY : SAMPLE;
			DELAY: next_state = (delay == 18'd250_000) ? (WAIT_RESET) : (DELAY);
			WAIT_RESET: next_state = (up) ? SAMPLE : DELAY;
			default: next_state = SAMPLE;
		endcase
	end
	always @(posedge clk) begin
		case (state)
			SAMPLE: begin
				delay <= 18'd0;
				up_reg <= up;
			end
			DELAY: begin
				delay <= delay + 1'b1;
			end
			WAIT_RESET: begin
				delay <= 18'd0;
			end
			default: begin
				delay <= 18'd0;
				up_reg <= 1'b1;
			end
		endcase
	end

	always @(posedge clk) begin
		state <= next_state;
	end

	assign up_valid = up_reg;
endmodule

