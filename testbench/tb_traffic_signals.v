`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for traffic_signals
//////////////////////////////////////////////////////////////////////////////////
module tb_traffic_signals;

    reg clock;
    wire [2:0] light;

    // Instantiate the traffic_signals module
    traffic_signals uut (
        .clock(clock),
        .light(light)
    );
 // Clock generation: toggle every 5ns (10ns period = 100MHz)
    initial begin
        clock = 0;
        forever #5 clock = ~clock; 
    end

    // Simulation control
    initial begin
        // Run for 50ns (5 clock cycles)
        #50 $finish;
    end
	 
    // Monitor output
    initial begin
        $monitor("Time=%0t | clock=%b | light=%b", $time, clock, light);
    end

endmodule