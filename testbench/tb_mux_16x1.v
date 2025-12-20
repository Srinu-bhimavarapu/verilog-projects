`timescale 1ns/1ps

module tb_mux_16x1;

    // Testbench signals
    reg [15:0] in;
    reg [3:0] sel;
    wire out;

    // Instantiate DUT (Device Under Test)
	  mux_16x1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    // Apply test patterns
    initial begin
        // Initialize inputs
        in = 16'b1010_1100_1111_0001; // Example input pattern
        sel = 4'b0000;
		    // Test different select values
        #10 sel = 4'b0000; // Should select in[0]
        #10 sel = 4'b0001; // Should select in[1]
        #10 sel = 4'b0010; // Should select in[2]
        #10 sel = 4'b0101; // Should select in[5]
        #10 sel = 4'b1010; // Should select in[10]
        #10 sel = 4'b1111; // Should select in[15]

        #10 $finish;
    end

    // Monitor signals with time in ns
	     initial begin
        $monitor("Time=%0t ns | sel=%b (%0d) | out=%b", 
                 $time, sel, sel, out);
    end

endmodule
