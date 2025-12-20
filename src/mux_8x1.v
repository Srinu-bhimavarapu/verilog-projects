`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:00:09 08/07/2025 
// Design Name: 
// Module Name:    mux_8x1 
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
module mux_8x1(
    input [7:0] in,
    input [2:0] sel,
    output reg out
	);
always @(*)
begin
case(sel)
3'b000 : out = in[0];
3'b001 : out = in[1];
3'b010 : out = in[2];
3'b011 : out = in[3];
3'b100 : out = in[4];
3'b101 : out = in[5];
3'b110 : out = in[6];
3'b111 : out = in[7];

endcase
end
endmodule




