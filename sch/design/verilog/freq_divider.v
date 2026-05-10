
`timescale 1ns/1ps

module freq_div
#(parameter
	LOG2_DIV=3
)(
	input wire	InClk,
	input wire	reset,
	output wire	OutClk
);

	reg [LOG2_DIV:0] clkCount = 0; // reset!!!

	always @(posedge(InClk) or negedge(reset)) begin
		if (!reset) begin
			clkCount <= 0;
		end 
		else begin
			clkCount <= clkCount + 1;
		end
	end

	assign OutClk = clkCount[LOG2_DIV-1];

endmodule
