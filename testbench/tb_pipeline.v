`timescale 1ns / 1ps

module tb_pipeline;

    // Inputs
    reg [9:0] a;
    reg [9:0] b;
    reg [9:0] c;
    reg [9:0] d;
    reg clk;

    // Output
    wire [9:0] f;
	  // Instantiate the Unit Under Test (UUT)
    pipe_ex uut (
        .f(f),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .clk(clk)
    );

    // Clock Generation
    initial clk = 0;
    always #10 clk = ~clk; // 20ns clock period
	  // Apply Stimulus
    initial
    begin
        // Initialize inputs
        a = 0; b = 0; c = 0; d = 0;

        // Apply test vectors
        #5  a = 5; b = 12; c = 6;  d = 3;
        #20 a = 10; b = 8; c = 5;  d = 2;
        #20 a = 20; b = 11; c = 1;  d = 4;
        #20 a = 15; b = 10; c = 8;  d = 2;
    end
     // Monitor and Dump Data
    initial
    begin
        $dumpfile("pipe1.vcd");
        $dumpvars(0, tb_pipeline);
        $monitor("time=%0t | a=%d b=%d c=%d d=%d | f=%d", $time, a, b, c, d, f);
        #300 $finish;
    end

endmodule