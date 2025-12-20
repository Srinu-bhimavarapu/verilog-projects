`timescale 1ns/1ps
module tb_sequence;

  reg x, clk, reset;
  wire z;

  // Instantiate DUT (Device Under Test)
  sequence_detector dut (
    .x(x),
    .clk(clk),
    .reset(reset),
    .z(z)
  );
    // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;   // 10ns clock period
  end

  // Stimulus
  initial begin
    // Initialize
    reset = 0; x = 0;
    #12 reset = 1;   // release reset after some delay
 // Apply input sequence: 110110
    #10 x = 0;   // 1
    #10 x = 1;   // 11
    #10 x = 1;   // 110 → detect here (z=1)
    #10 x = 0;   // 1101
    #10 x = 1;   // 11011
    #10 x = 0;   // 110110 → detect again (z=1)

    #20 $finish;
  end
   // Monitor output
  initial begin
    $monitor("Time=%0t | x=%b | z=%b | State=%d", $time, x, z, dut.Ps);
  end

endmodule