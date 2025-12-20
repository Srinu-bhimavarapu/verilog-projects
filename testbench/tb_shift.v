`timescale 1ns / 1ps

module tb_shift_register;

// Inputs
reg clock;
reg clear;
reg e;

// Output
wire a;
// Instantiate the Unit Under Test (UUT)
shift_register uut (
    .clock(clock), 
    .clear(clear), 
    .e(e), 
    .a(a)
);
// Clock generation: toggle every 5ns → 100MHz clock
always #5 clock = ~clock;

initial begin
    // Initialize signals
    clock = 0;
    clear = 0; // apply reset
    e = 0;
	  // Display header
    $display("Time\tclk\tclr\te\t| a b c d");
    $monitor("%0dns\t%b\t%b\t%b\t| %b %b %b %b",
              $time, clock, clear, e, a, uut.b, uut.c, uut.d);

    // Hold reset for a few ns
    #10;
    clear = 1; // release reset
	 // Apply serial input bits
    #10 e = 1;  // First bit = 1
    #10 e = 0;  // Second bit = 0
    #10 e = 1;  // Third bit = 1
    #10 e = 1;  // Fourth bit = 1
    #10 e = 0;  // Fifth bit = 0
    #10 e = 1;  // Sixth bit = 1
    
  // Stop simulation after some time
    #50;
    $stop;
end

endmodule
