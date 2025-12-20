`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:25:20 08/18/2025 
// Design Name: 
// Module Name:    multiplier_top 
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
module multiplier_top(
    input clk, start,
    input [7:0] data_in,
    output done,
    output [15:0] result
    );

    wire ldA, ldB, ldP, clrP, decB, eqz;
	 datapath DP(
        .clk(clk), .ldA(ldA), .ldB(ldB), .ldP(ldP), .clrP(clrP), .decB(decB),
        .data_in(data_in), .eqz(eqz), .P(result)
    );

    controller CU(
        .ldA(ldA), .ldB(ldB), .ldP(ldP), .clrP(clrP), .decB(decB), .done(done),
        .clk(clk), .eqz(eqz), .start(start)
    );

endmodule