`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:25:30 08/16/2025 
// Design Name: 
// Module Name:    parity_generator 
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
module parity_generator(
    input x,
    input clk,
    output reg z
    );

reg even_odd;
parameter even = 0 ,odd = 1;
always@(posedge clk)
case(even_odd)
 even : begin
    if (x == 1) begin
      z <= 1;
      even_odd <= odd;   // switch state to odd
    end
    else begin
      z <= 0;
      even_odd <= even;  // stay in even
    end
  end
   odd : begin
    if (x == 1) begin
      z <= 0;
      even_odd <= even;  // switch state to even
    end
    else begin
      z <= 1;
      even_odd <= odd;   // stay in odd
    end
  end

  default : even_odd <= even;

  endcase
endmodule
