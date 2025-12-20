// Simple UART system with FIFO buffers
// Parameters: CLK_FREQ, BAUD must be set correctly for your FPGA/board

module uart_system #
(
    parameter CLK_FREQ = 50000000,      // 50 MHz clock
    parameter BAUD     = 115200,
    parameter FIFO_DEPTH = 16
)
(
    input  wire clk, rst,
    // UART lines
    input  wire rx,
    output wire tx,
    // CPU interface
    input  wire [7:0] w_data,
    input  wire wr_uart,
    output wire tx_full,

    output wire [7:0] r_data,
    input  wire rd_uart,
    output wire rx_empty
);
    // -----------------------
    // 1. Baud Rate Generator
    // -----------------------
    localparam integer TICKS_PER_BIT = CLK_FREQ / BAUD;
    reg [15:0] baud_cnt = 0;
    reg s_tick = 0;

    always @(posedge clk) begin
        if (rst) begin
            baud_cnt <= 0;
            s_tick <= 0;
        end else begin
     if (baud_cnt == TICKS_PER_BIT-1) begin
                baud_cnt <= 0;
                s_tick <= 1;
            end else begin
                baud_cnt <= baud_cnt + 1;
                s_tick <= 0;
            end
        end
    end
	     // -----------------------
    // 2. RX (very simple)
    // -----------------------
    reg [3:0] rx_cnt = 0;
    reg [7:0] rx_shift = 0;
    reg rx_busy = 0;
    reg rx_done = 0;

    always @(posedge clk) begin
        if (rst) begin
            rx_cnt <= 0;
            rx_busy <= 0;
            rx_done <= 0;
        end else if (s_tick) begin
            rx_done <= 0;
            if (!rx_busy) begin
                if (rx == 0) begin // start bit
                    rx_busy <= 1;
                    rx_cnt <= 0;
                end
            end else begin
                rx_cnt <= rx_cnt + 1;
                if (rx_cnt >= 1 && rx_cnt <= 8) // sample data bits
                    rx_shift <= {rx, rx_shift[7:1]}; // LSB first
                if (rx_cnt == 9) begin
                    rx_busy <= 0;
                    rx_done <= 1;
                end
            end
        end
    end

    // --------
	     // 3. RX FIFO
    // -----------------------
    reg [7:0] rx_fifo [0:FIFO_DEPTH-1];
    reg [3:0] rx_wptr = 0, rx_rptr = 0;
    assign rx_empty = (rx_wptr == rx_rptr);
    assign r_data   = rx_fifo[rx_rptr];

    always @(posedge clk) begin
        if (rst) begin
            rx_wptr <= 0;
            rx_rptr <= 0;
        end else begin
  if (rx_done) begin
                rx_fifo[rx_wptr] <= rx_shift;
                rx_wptr <= rx_wptr + 1;
            end
            if (rd_uart && !rx_empty)
                rx_rptr <= rx_rptr + 1;
        end
    end
 // -----------------------
    // 4. TX FIFO
    // -----------------------
    reg [7:0] tx_fifo [0:FIFO_DEPTH-1];
    reg [3:0] tx_wptr = 0, tx_rptr = 0;
    assign tx_full = ((tx_wptr+1) == tx_rptr);

    always @(posedge clk) begin
        if (rst) begin
            tx_wptr <= 0;
				end else if (wr_uart && !tx_full) begin
            tx_fifo[tx_wptr] <= w_data;
            tx_wptr <= tx_wptr + 1;
        end
    end

    // -----------------------
    // 5. TX logic
    // -----------------------
    reg [3:0] tx_cnt = 0;
    reg [9:0] tx_shift = 10'b1111111111;
    reg tx_busy = 0;
    assign tx = tx_shift[0]; 
	 always @(posedge clk) begin
        if (rst) begin
            tx_cnt <= 0;
            tx_busy <= 0;
            tx_rptr <= 0;
            tx_shift <= 10'b1111111111;
        end else if (s_tick) begin
		   if (!tx_busy && (tx_wptr != tx_rptr)) begin
                // load data from FIFO
                tx_shift <= {1'b1, tx_fifo[tx_rptr], 1'b0}; // stop + data + start
                tx_rptr <= tx_rptr + 1;
                tx_busy <= 1;
                tx_cnt <= 0;
            end else if (tx_busy) begin
                tx_shift <= {1'b1, tx_shift[9:1]};
                tx_cnt <= tx_cnt + 1;
                if (tx_cnt == 9) tx_busy <= 0;
            end
        end
    end

endmodule