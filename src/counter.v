`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:48:38 08/02/2025 
// Design Name: 
// Module Name:    counter 
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
module counter(
input clock,
input clear,
output reg[3:0] count);
initial count = 0; 
always @(posedge clock)
begin
if (clear)
count <=0;
else 
count <= count+1;
end
endmodule
