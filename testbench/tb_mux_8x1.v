`timescale 1ns/1ps

module tb_mux_8x1;

    // Testbench signals
    reg [7:0] in;
    reg [2:0] sel;
    wire out;
	 // Instantiate DUT (Device Under Test)
    mux_8x1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    // Apply test patterns
    initial begin
        // Initialize inputs
        in = 8'b10110101; // Example input pattern
        sel = 3'b000;

        // Test all select values (0 to 7)
        #10 sel = 3'b000; // Should output in[0]
        #10 sel = 3'b001; // Should output in[1]
        #10 sel = 3'b010; // Should output in[2]
        #10 sel = 3'b011; // Should output in[3]
        #10 sel = 3'b100; // Should output in[4]
        #10 sel = 3'b101; // Should output in[5]
        #10 sel = 3'b110; // Should output in[6]
        #10 sel = 3'b111; // Should output in[7]

        #10 $finish;
		  end
		  // Monitor outputs with time in ns
    initial begin
        $monitor("Time=%0t ns | sel=%b (%0d) | out=%b", 
                 $time, sel, sel, out);
    end

endmodule

   
