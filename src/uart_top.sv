`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2025 23:13:09
// Design Name: 
// Module Name: uart_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module uart_top #(
    parameter CLK_FREQ   = 50_000_000,
    parameter BAUD_RATE  = 9600,
    parameter PARITY_EN  = 1,
    parameter PARITY_ODD = 0
)(
    input  logic        clk,
    input  logic        reset_n,

    // TX interface
    input  logic        tx_start,
    input  logic [7:0]  tx_data,
    output logic        tx_busy,

    // RX interface
    output logic [7:0]  rx_data,
    output logic        rx_valid,
    output logic        parity_error,

    // UART line
    output logic        tx,
    input  logic        rx
);

    logic baud_tick;

    // -------------------------
    // Baud rate generator
    // -------------------------
    baud_gen #(
        .clk_frequency(CLK_FREQ),
        .baud_rate    (BAUD_RATE)
    ) baud_gen_inst (
        .clk       (clk),
        .reset_n   (reset_n),
        .enable    (1'b1),
        .baud_tick (baud_tick)
    );

    // -------------------------
    // UART Transmitter
    // -------------------------
    uart_tx #(
        .parity_en  (PARITY_EN),
        .parity_odd (PARITY_ODD)
    ) uart_tx_inst (
        .clk       (clk),
        .reset_n   (reset_n),
        .baud_tick (baud_tick),
        .tx_start  (tx_start),
        .tx_data   (tx_data),
        .tx        (tx),
        .tx_busy   (tx_busy)
    );

    // -------------------------
    // UART Receiver
    // -------------------------
    uart_rx #(
        .parity_en  (PARITY_EN),
        .parity_odd (PARITY_ODD)
    ) uart_rx_inst (
        .clk          (clk),
        .reset_n      (reset_n),
        .rx           (rx),
        .baud_tick    (baud_tick),
        .rx_data      (rx_data),
        .rx_valid     (rx_valid),
        .parity_error (parity_error)
    );

endmodule

