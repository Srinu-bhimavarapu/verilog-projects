`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:36:03 08/15/2025 
// Design Name: 
// Module Name:    shif_register 
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
module shift_register(
    input clock,
    input clear,
    input e,          // serial input
    output reg a      // output (MSB after shifts)
);

reg b, c, d; // internal register
always @(posedge clock or negedge clear)
begin
    if (!clear) // active-low reset
    begin
        a <= 0;
        b <= 0;
        c <= 0;
        d <= 0;
    end
	  else
    begin
        a <= b;
        b <= c;
        c <= d;
        d <= e; // serial input shifts in
    end
end
endmodule