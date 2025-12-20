`timescale 1ns/1ps
module tb_ring_counter;

    reg clk;
    reg init;
    wire [7:0] count;

    // Instantiate the DUT (Device Under Test)
    ring_counter uut (
        .clk(clk),
        .init(init),
        .count(count)
    );

    // Clock generation: toggle every 5 ns (100 MHz clock)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
	   // Stimulus
    initial begin
        // Monitor outputs
        $monitor("Time=%0t | init=%b | count=%b", $time, init, count);

        // Step 1: Initialize
        init = 1; 
        #10;          // Apply init for one cycle

        // Step 2: Release init
        init = 0;

        // Step 3: Let it run for 20 cycles
        #160;

        $finish;
    end

endmodule