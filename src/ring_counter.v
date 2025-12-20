`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:18:44 08/14/2025 
// Design Name: 
// Module Name:    ring_counter 
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
module ring_counter(
    input clk,
    input init,
    output reg [7:0] count
    );

always @(posedge clk)
 begin
    if (init)
        count <= 8'b10000000;                 // Set initial position
    else
        count <= {count[6:0], count[7]};      // Rotate left
end

endmodule
