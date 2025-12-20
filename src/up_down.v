`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:31:04 08/14/2025 
// Design Name: 
// Module Name:    up_down 
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
module up_down(
    input mode,
    input clr,
    input ld,
    input clk,
    input [0:7] d_in,
    output [0:7] count
    );
	 always@(posedge clk)
if(ld) 
     count <= d_in;
else if(clr) 
    count <=0;
else if(mode) 
   count <= count + 1;
else 
    count <= count - 1;    

endmodule
