`timescale 1ns/1ps

module tb_sequence_detector;
  reg clk, reset_n, x;
  wire z;

  // Instantiate DUT
  sequence_detector dut (
    .x(x),
    .clk(clk),
    .reset_n(reset_n),
    .z(z)
  );
  
  // Clock generation (10ns period → 100MHz)
  always #5 clk = ~clk;

  // Stimulus
  initial begin
    // Dumpfile for EPWave (GTKWave in EDA Playground)
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_sequence_detector);

    // Initialize
    clk = 0;
    reset_n = 0;  // assert reset
    x = 0;
    #12 reset_n = 1;  // release reset
	  // Apply sequence "1011"
    #10 x = 1;   // bit1
    #10 x = 0;   // bit2
    #10 x = 1;   // bit3
    #10 x = 1;   // bit4 → should detect here (z=1)

    // Overlap test: sequence "1011011"
    #10 x = 1;   // another '1' continues
    #10 x = 0;   // bit2
    #10 x = 1;   // bit3
    #10 x = 1;   // bit4 → should detect again
// Random bits
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;

    #20 $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time=%0t | x=%b | z=%b | state=%0d", $time, x, z, dut.Ps);
  end
endmodule