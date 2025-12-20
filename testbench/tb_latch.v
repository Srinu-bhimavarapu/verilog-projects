`timescale 1ns / 1ps

module tb_latch;

// Inputs
reg data;
reg load;

// Output
wire d_out;

// Instantiate the Unit Under Test (UUT)
simple_latch uut (
    .data(data),
    .load(load),
    .d_out(d_out)
);
initial begin
    // Display header
    $display("Time\tload\tdata\td_out");
    $monitor("%0dns\t%b\t%b\t%b", $time, load, data, d_out);

    // Initial values
    data = 0;
    load = 0;

    // Apply test sequence
    #10 data = 1; load = 1;  // latch open, d_out follows data
    #10 data = 0;            // latch open, d_out updates
    #10 load = 0; data = 1;  // latch closed, d_out should HOLD old value
    #10 data = 0;            // latch still closed, d_out unchanged
    #10 load = 1;            // latch open again, d_out updates
    #10 data = 1;            // d_out follows data
    #10 load = 0;            // latch closed, holds value

    // Finish simulation
    #20 $stop;
end

endmodule
