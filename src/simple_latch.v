`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:17 08/03/2025 
// Design Name: 
// Module Name:    simple_latch 
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
///////////
module simple_latch(
    input data,
    input load,
    output reg d_out
);

always @(*)
begin
    if (load)
        d_out = data;
	 else
        d_out = d_out;
   
end

endmodule
