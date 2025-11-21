`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 03:50:44 PM
// Design Name: 
// Module Name: Seq_Mult
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


module Seq_Mult (
    input        clk,
    input        rst,
    input  [3:0] a,
    input  [3:0] b,
    output reg [7:0] p
);

    reg [3:0]  operand_b;
    reg [2:0]  shift_count;
    reg [7:0]  partial_product;
    reg [7:0]  multiplicand;

    reg [1:0] PS, NS;

    // State encoding
    parameter S_IDLE = 2'b00;
    parameter S_CALC = 2'b01;
    parameter S_DONE = 2'b10;

    // ----------------------------------
    // State register
    // ----------------------------------
    always @(posedge clk or posedge rst) begin
        if (rst)
            PS <= S_IDLE;
        else
            PS <= NS;
    end

    // ----------------------------------
    // Next-state logic (simplified)
    // ----------------------------------
    always @(*) begin
        case (PS)
            S_IDLE:  NS = S_CALC;
            S_CALC:  NS = (shift_count == 3'd4) ? S_DONE : S_CALC;
            S_DONE:  NS = S_IDLE;
            default: NS = S_IDLE;
        endcase
    end

    // ----------------------------------
    // Datapath
    // ----------------------------------
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            multiplicand     <= 8'd0;
            operand_b        <= 4'd0;
            partial_product  <= 8'd0;
            shift_count      <= 3'd0;
            p                <= 8'd0;
        end else begin
            case (PS)
                // Load operands and init
                S_IDLE: begin
                    multiplicand    <= {4'b0000, a};  // a in lower 4 bits
                    operand_b       <= b;
                    partial_product <= 8'd0;
                    shift_count     <= 3'd0;
                end

                // Shift-add loop
                S_CALC: begin
                    if (operand_b[0])
                        partial_product <= partial_product + multiplicand;

                    multiplicand <= multiplicand << 1;
                    operand_b    <= operand_b >> 1;
                    shift_count  <= shift_count + 1'b1;
                end

                // Latch result
                S_DONE: begin
                    p <= partial_product;
                end
            endcase
        end
    end

endmodule
