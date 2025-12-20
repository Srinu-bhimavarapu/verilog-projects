`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:26:59 08/07/2025 
// Design Name: 
// Module Name:    mux_16x1 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux_16x1(
    input [15:0] in,
    input [3:0] sel,
    output out
    );

assign out = in[sel];
endmodule
