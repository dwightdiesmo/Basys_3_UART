`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2022 09:49:28 AM
// Design Name: 
// Module Name: UART
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


module UART(
    input clk,
    input RsRx,
    output RsTx
    );
    wire enable, reset;
    wire [7:0] data_byte;
    wire new_clk;
    Refresh_Counter #(.WL(14),.MAX(10416-1)) CLK_SCALE (.clk(clk),.flag(new_clk));
    UART_Rx RX (.clk(new_clk),.reset(reset),.RsRx(RsRx),.flag(enable),.data_byte(data_byte));
    UART_Tx TX (.clk(new_clk),.enable(enable),.data_byte(data_byte),.RsTx(RsTx),.flag(reset));
endmodule
