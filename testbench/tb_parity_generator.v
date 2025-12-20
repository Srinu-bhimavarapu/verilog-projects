`timescale 1ns/1ps
module tb_parity_generator;

  reg x;
  reg clk;
  wire z;

  // Instantiate the DUT (Device Under Test)
  parity_generator uut (
    .x(x),
    .clk(clk),
    .z(z)
  );

  // Clock generation (10ns period -> 100MHz)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  
  end

  // Stimulus
  initial begin
    // Apply bit stream 100101
    x = 0;
	 #10 x = 1;   // first bit
    #10 x = 0;   // second bit
    #10 x = 0;   // third bit
    #10 x = 1;   // fourth bit
    #10 x = 0;   // fifth bit
    #10 x = 1;   // sixth bit

    // Finish simulation
    #20 $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time=%0t | x=%b | z=%b", $time, x, z);
  end

endmodule