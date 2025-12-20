`timescale 1ns/1ps

module tb_uart_system;

    // Testbench parameters
    localparam CLK_FREQ = 50000000;
    localparam BAUD     = 115200;

    // DUT signals
    reg clk = 0;
    reg rst = 1;
    reg rx = 1;           // idle line = 1
    wire tx;
reg [7:0] w_data;
    reg wr_uart;
    wire tx_full;

    wire [7:0] r_data;
    reg rd_uart;
    wire rx_empty;

    // Instantiate DUT
    uart_system #(
        .CLK_FREQ(CLK_FREQ),
        .BAUD(BAUD)
		   ) uut (
        .clk(clk),
        .rst(rst),
        .rx(rx),
        .tx(tx),
        .w_data(w_data),
        .wr_uart(wr_uart),
        .tx_full(tx_full),
        .r_data(r_data),
        .rd_uart(rd_uart),
        .rx_empty(rx_empty)
    );
	    // Clock generation (20 ns period = 50 MHz)
    always #10 clk = ~clk;

    initial begin
        // Initialize
        wr_uart = 0;
        w_data  = 0;
        rd_uart = 0;

        // Apply reset
        #100;
        rst = 0;
        #100;
		    // Write some bytes to TX FIFO
        send_byte(8'h41); // 'A'
        send_byte(8'h42); // 'B'
        send_byte(8'h43); // 'C'

        // Wait long enough for transmission
        #200000;

        $stop;  // End simulation
    end
 // Task to send a byte into TX FIFO
    task send_byte(input [7:0] data);
    begin
        @(posedge clk);
        while (tx_full) @(posedge clk); // wait if FIFO full
        w_data  <= data;
        wr_uart <= 1;
        @(posedge clk);
        wr_uart <= 0;
    end
    endtask

    // Optional: Loopback RX from TX to test RX FIFO
    always @(tx) begin
        rx <= tx;  // simple loopback
    end
	 endmodule