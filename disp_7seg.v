module disp_7seg(
	input[3:0] dec,
	output[7:0] dec_seg
	);
	
	reg[7:0] seg1_wire;

	always @(*) begin
		case (dec) 
			4'd0: seg1_wire = 8'hc0;
			4'd1: seg1_wire = 8'hf9;
			4'd2: seg1_wire = 8'ha4;
			4'd3: seg1_wire = 8'hb0;
			4'd4: seg1_wire = 8'h99;
			4'd5: seg1_wire = 8'h92;
			4'd6: seg1_wire = 8'h82;
			4'd7: seg1_wire = 8'hf8;
			4'd8: seg1_wire = 8'h80;
			4'd9: seg1_wire = 8'h98;
			4'd10: seg1_wire = 8'h88;
			4'd11: seg1_wire = 8'h83;
			4'd12: seg1_wire = 8'hc6;
			4'd13: seg1_wire = 8'ha1;
			4'd14: seg1_wire = 8'h86;
			4'd15: seg1_wire = 8'h8e;
			default: seg1_wire = 8'hff;
		endcase
	end

	assign dec_seg = seg1_wire;
endmodule

