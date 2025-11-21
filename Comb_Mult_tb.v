`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 08:52:53 PM
// Design Name: 
// Module Name: Comb_Mult_tb
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


module Comb_Mult_tb;

    reg  [3:0] a;
    reg  [3:0] b;
    wire [7:0] p;

    // Instantiate DUT
    Comb_Mult dut (
        .a(a),
        .b(b),
        .p(p)
    );

    initial begin
        // Test 1
        a = 4'd3;
        b = 4'd5;
        #10;
        $display("TEST 1: a=3, b=5 ? p=%d", p);

        // Test 2
        a = 4'd7;
        b = 4'd2;
        #10;
        $display("TEST 2: a=7, b=2 ? p=%d", p);

        $stop;
    end

endmodule

