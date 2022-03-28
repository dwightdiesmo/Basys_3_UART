`timescale 1ns / 1ps

module Refresh_Counter #(parameter WL = 4, MAX = 15) (
    input clk,
    output reg flag,
    output reg [WL-1:0] counter = 0
    );

    always @(posedge clk) begin
        if(counter ==  MAX) begin
            counter <= 'b0;
            flag <= 'b1;
        end else begin
            counter <= counter + 1;
            flag <= 'b0;
        end
    end
endmodule