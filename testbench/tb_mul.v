`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:31:26 08/18/2025
// Design Name:   multiplier_top
// Module Name:   /home/ise/verilog_examples/tb_mul.v
// Project Name:  verilog_examples
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiplier_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module tb_mul;

    reg clk, start;
    reg [7:0] data_in;
    wire done;
    wire [15:0] result;
    // Instantiate top module
    multiplier_top UUT (
        .clk(clk),
        .start(start),
        .data_in(data_in),
        .done(done),
        .result(result)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;
 initial begin
        // Initialize
        clk = 0;
        start = 0;
        data_in = 0;

        // --- Test 1: Multiply 3 × 4 ---
        #10 start = 1; data_in = 8'd3; // Load A=3
        #10 start = 0;                 // Hold start low
        #20 data_in = 8'd4;            // Load B=4

        // Wait for done
        wait(done);
        #10;
        $display("Test1: 3 x 4 = %d, Result = %d", 3*4, result);
		     // --- Test 2: Multiply 5 × 6 ---
        #20 start = 1; data_in = 8'd5; // Load A=5
        #10 start = 0;
        #20 data_in = 8'd6;            // Load B=6

        wait(done);
        #10;
        $display("Test2: 5 x 6 = %d, Result = %d", 5*6, result);

        // Finish simulation
        #50 $finish;
    end
