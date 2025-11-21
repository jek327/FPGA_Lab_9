`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2025 04:09:00 PM
// Design Name: 
// Module Name: Seq_Mult_tb
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



module Seq_Mult_tb;

    reg clk;
    reg rst;
    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] p;

    // Instantiate the DUT
    Seq_Mult dut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .p(p)
    );

    // Clock: 10 ns period
    always #5 clk = ~clk;

    initial begin
        // Initial signals
        clk = 0;
        rst = 0;
        a = 0;
        b = 0;

        rst = 1;    #10;
        rst = 0;

        a = 4'd3;
        b = 4'd5;

        #70;   // wait enough cycles
        
        rst = 1;    #10;
        rst = 0;

        a = 4'd7;
        b = 4'd2;

        #70;

        $stop;
    end

endmodule









