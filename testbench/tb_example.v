`timescale 1ns/1ps

module tb_example;

    // Testbench signals
    reg a, b, c, d, e, f;
    wire y;

    // Instantiate DUT (Device Under Test)
	  example uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .y(y)
    );

    // Apply test stimuli
    initial begin
        // Initialize inputs
        a=0; b=0; c=0; d=0; e=0; f=0;
		    // Apply different test patterns with delays in ns
        #10 a=1; b=1;                 
        #10 c=1; d=0;                 
        #10 e=1; f=0;                 
        #10 e=0; f=1;                 
        #10 a=0; b=1; c=0; d=1;       
        #10 a=1; b=0; c=1; d=1; e=1; f=1; 
        #10 $finish;                  
    end
	  // Monitor values with time in ns
    initial begin
        $monitor("Time=%0t ns | a=%b b=%b c=%b d=%b e=%b f=%b | y=%b",
                 $time, a, b, c, d, e, f, y);
    end

endmodule