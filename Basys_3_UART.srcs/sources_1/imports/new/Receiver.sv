`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 10:29:35 AM
// Design Name: 
// Module Name: Receiver
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Receiver(
    input clk,
    input reset,
    input RsRx,
    output reg flag,
    output reg [7:0] data_byte
    );
    enum {
        idle,
        receive_0,
        receive_1,
        receive_2,
        receive_3,
        receive_4,
        receive_5,
        receive_6,
        receive_7,
        stop
    } current_state;
    always_ff @(negedge clk) begin
        case(current_state)
            idle: begin
                if(RsRx == 0) begin
                    current_state <= receive_0;
                end else begin
                    current_state <= idle;
                end
                flag <= 1'b0;
            end
            receive_0: begin
                data_byte[0] <= RsRx;
                current_state <= receive_1;
            end
            receive_1: begin
                data_byte[1] <= RsRx;
                current_state <= receive_2;
            end
            receive_2: begin
                data_byte[2] <= RsRx;
                current_state <= receive_3;
            end
            receive_3: begin
                data_byte[3] <= RsRx;
                current_state <= receive_4;
            end
            receive_4: begin
                data_byte[4] <= RsRx;
                current_state <= receive_5;
            end
            receive_5: begin
                data_byte[5] <= RsRx;
                current_state <= receive_6;
            end
            receive_6: begin
                data_byte[6] <= RsRx;
                current_state <= receive_7;
            end
            receive_7: begin
                data_byte[7] <= RsRx;
                current_state <= stop;
            end
            stop: begin
                flag = 1'b1;
                if (reset) begin
                    current_state <= idle;
                end else begin
                    current_state <= stop;
                end
            end
            default: begin
                current_state <= idle;
                flag <= 1'b0;
            end
        endcase
    end
endmodule