`timescale 1ns/1ps
module tb_ring_counter;

reg clk;
reg init;
wire [7:0] count;
// Instantiate the ring counter
ring_counter uut (
    .clk(clk),
    .init(init),
    .count(count)
);

// Clock generation: 10ns period (100MHz)
always #5 clk = ~clk;
initial begin
    // Initial values
    clk = 0;
    init = 1;     // Load the starting value (10000000)

    // Hold init high for one clock cycle
    #10 init = 0; // Start rotating after first clock

    // Run for some cycles to observe rotation
    #200$stop;
end

endmodule