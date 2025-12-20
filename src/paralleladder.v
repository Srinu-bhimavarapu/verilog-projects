`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:31:48 08/03/2025 
// Design Name: 
// Module Name:    paralleladder 
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
module paralleladder(
    input [7:0] in1,
    input [7:0] in2,
    input cin,
    output [7:0] sum,
    output count
    );
assign #20 {count,sum} = in1 + in2 + cin;

endmodule
