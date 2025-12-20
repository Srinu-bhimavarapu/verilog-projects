`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:26:19 08/02/2025
// Design Name:   full_adder
// Module Name:   /home/ise/verilog_examples/full_adder_testbench.v
// Project Name:  verilog_examples
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module full_adder_testbench;

	// Inputs
	reg a;
	reg b;
	reg c_in;

	// Outputs
	wire sum;
	wire c_out;

	// Instantiate the Unit Under Test (UUT)
	full_adder uut (
		.a(a), 
		.b(b), 
		.c_in(c_in), 
		.sum(sum), 
		.c_out(c_out)
	);

	initial begin
		// Display header
		$display("Time\t a b c_in | sum c_out");
		$monitor("%0dns\t %b %b   %b   |  %b    %b", $time, a, b, c_in, sum, c_out);

		// Apply all input combinations with 10ns delay
		a = 0; b = 0; c_in = 0; #1000000;
		a = 0; b = 0; c_in = 1; #1000000;
		a = 0; b = 1; c_in = 0; #1000000;
		a = 0; b = 1; c_in = 1; #1000000;
		a = 1; b = 0; c_in = 0; #1000000;
		a = 1; b = 0; c_in = 1; #1000000;
		a = 1; b = 1; c_in = 0; #1000000;
		a = 1; b = 1; c_in = 1; #1000000;

		// Finish simulation
		$finish;
	end
      
endmodule

