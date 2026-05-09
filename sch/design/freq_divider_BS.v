`timescale 1ns/1ps

module freq_div_BS
#(parameter
    LOG2_DIV = 3
)(
    input wire  InClk_BS,
    input wire  reset_BS,
    output reg  OutClk_BS
);

    reg [LOG2_DIV-1:0] clkCount;

    always @(posedge InClk_BS or negedge reset_BS) begin
        if (!reset_BS) begin
            clkCount <= 1;
            OutClk_BS <= 0; 
        end 
        else begin
            if (clkCount[LOG2_DIV-1] == 1) begin
                clkCount <= 1;
                OutClk_BS <= ~OutClk_BS; 
            end
            else begin
                clkCount <= (clkCount << 1); 
            end
        end
    end

endmodule
