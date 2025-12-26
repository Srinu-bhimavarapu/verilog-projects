
`timescale 1ns/1ps

module uart_tb;

    // Clock & reset
    logic clk;
    logic reset_n;

    // TX interface
    logic        tx_start;
    logic [7:0]  tx_data;
    logic        tx_busy;

    // RX interface
    logic [7:0]  rx_data;
    logic        rx_valid;
    logic        parity_error;

    // UART lines
    logic tx;
    logic rx;

    // --------------------------------
    // Clock generation (50 MHz)
    // --------------------------------
    always #10 clk = ~clk;   // 20 ns period

    // --------------------------------
    // DUT instantiation
    // --------------------------------
    uart_top #(
        .CLK_FREQ  (50_000_000),
        .BAUD_RATE (9600),
        .PARITY_EN (1),
        .PARITY_ODD(0)
    ) dut (
        .clk          (clk),
        .reset_n      (reset_n),
        .tx_start     (tx_start),
        .tx_data      (tx_data),
        .tx_busy      (tx_busy),
        .rx_data      (rx_data),
        .rx_valid     (rx_valid),
        .parity_error (parity_error),
        .tx           (tx),
        .rx           (rx)
    );

    // --------------------------------
    // Loopback connection
    // --------------------------------
    assign rx = tx;

    // --------------------------------
    // Test sequence
    // --------------------------------
    initial begin
        // Init
        clk       = 0;
        reset_n  = 0;
        tx_start = 0;
        tx_data  = 8'h00;

        // Reset
        #100;
        reset_n = 1;

        // Send a byte
        @(negedge clk);
        tx_data  = 8'hA5;   // Test data
        tx_start = 1'b1;

        @(negedge clk);
        tx_start = 1'b0;

        // Wait for RX valid
        wait (rx_valid);

        // Display result
        $display("-----------------------------------");
        $display("UART TEST RESULT");
        $display("TX Data      = 0x%0h", tx_data);
        $display("RX Data      = 0x%0h", rx_data);
        $display("Parity Error = %b", parity_error);
        $display("-----------------------------------");

        // Finish
        #5_000_000; // 5 ms

        $finish;
    end

endmodule      