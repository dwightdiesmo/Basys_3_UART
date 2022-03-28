`timescale 1ns / 1ps

module UART_Tx(
    input clk,
    input enable = 0,
    input [7:0] data_byte,
    output reg RsTx,
    output reg flag
);
//    Transmitter TRANSMITTER (.clk(new_clk),.enable(switch[15]),.data(switch[7:0]),.RsTx(RsTx),.flag(flag));
//    Transmitter TRANSMITTER (.clk(clk),.enable(enable),.data(data_byte),.RsTx(RsTx),.flag(flag));
    enum {
        idle, 
        start, 
        transmit_0, 
        transmit_1, 
        transmit_2, 
        transmit_3, 
        transmit_4, 
        transmit_5, 
        transmit_6, 
        transmit_7, 
        stop
    } current_state;
    
    always_ff @(posedge clk) begin
        if (enable) begin
            case (current_state)
                idle: begin
                    RsTx <= 1;
                    flag <= 0;
                    current_state <= start;
                end
                start: begin
                    RsTx <= 0;
                    flag <= 0;
                    current_state <= transmit_0;
                end              
                transmit_0: begin
                    RsTx <= data_byte[0];
                    flag <= 0;
                    current_state <= transmit_1;
                end
                transmit_1: begin
                    RsTx <= data_byte[1];
                    flag <= 0;
                    current_state <= transmit_2;
                end
                transmit_2: begin
                    RsTx <= data_byte[2];
                    flag <= 0;
                    current_state <= transmit_3;
                end
                transmit_3: begin
                    RsTx <= data_byte[3];
                    flag <= 0;
                    current_state <= transmit_4;
                end
                transmit_4: begin
                    RsTx <= data_byte[4];
                    flag <= 0;
                    current_state <= transmit_5;
                end
                transmit_5: begin
                    RsTx <= data_byte[5];
                    flag <= 0;
                    current_state <= transmit_6;
                end
                transmit_6: begin
                    RsTx <= data_byte[6];
                    flag <= 0;
                    current_state <= transmit_7;
                end
                transmit_7: begin
                    RsTx <= data_byte[7];
                    flag <= 0;
                    current_state <= stop;
                end
                stop: begin
                    RsTx <= 1;
                    flag <= 1;
                    current_state <= idle;
                end
            endcase
        end else begin
            RsTx <= 1;
            flag <= 0;
        end
    end
endmodule