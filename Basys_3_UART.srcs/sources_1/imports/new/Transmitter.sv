`timescale 1ns / 1ps

module Transmitter (
    input clk,
    input enable,
    input [7:0] data,
    output reg RsTx ,
    output reg flag
);
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
                    RsTx <= data[0];
                    flag <= 0;
                    current_state <= transmit_1;
                end
                transmit_1: begin
                    RsTx <= data[1];
                    flag <= 0;
                    current_state <= transmit_2;
                end
                transmit_2: begin
                    RsTx <= data[2];
                    flag <= 0;
                    current_state <= transmit_3;
                end
                transmit_3: begin
                    RsTx <= data[3];
                    flag <= 0;
                    current_state <= transmit_4;
                end
                transmit_4: begin
                    RsTx <= data[4];
                    flag <= 0;
                    current_state <= transmit_5;
                end
                transmit_5: begin
                    RsTx <= data[5];
                    flag <= 0;
                    current_state <= transmit_6;
                end
                transmit_6: begin
                    RsTx <= data[6];
                    flag <= 0;
                    current_state <= transmit_7;
                end
                transmit_7: begin
                    RsTx <= data[7];
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

//always @(*) begin
//        case (current_state)
//            idle:
//                next_state = start;
//            start:
//                next_state = transmit;
//            transmit:
//                next_state = stop;
//            stop:
//                next_state = idle;
//            default:
//                current_state = idle;
//        endcase
//    end
//    always @(posedge clk) begin
//        if (enable) begin
//            case (current_state)
//                idle: begin
//                    current_state <= next_state;
//                end
//                start: begin
//                    current_state <= next_state;
//                    RsTx <= 0;
//                end
//                transmit: begin
//                    for
//                end
//            endcase
//        end
//    end