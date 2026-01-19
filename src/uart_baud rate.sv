`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2025 23:15:21
// Design Name: 
// Module Name: baud_rate
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module baud_gen #(
parameter clk_frequency=500000000,  // system clk our assumption only
parameter baud_rate= 9600 
)
(
input logic clk,
input logic reset_n,
input logic enable,
output logic baud_tick
);
 localparam int baud_div = clk_frequency/ baud_rate;
 logic[12:0] baud_count ;
 always_ff@(posedge clk or negedge reset_n)
 begin 
 if(!reset_n)
 begin
 baud_count<=13'd0;
 baud_tick<=1'b0;
 end
 else if (enable)
begin
if(baud_count==baud_div-1) 
begin
baud_count<=13'd0;
baud_tick<=1'b1;
end
else begin
baud_count<=baud_count+13'd1;
baud_tick<=1'b0;
end 
end 
else begin 
baud_count<=13'd0;
baud_tick<=1'b0;
end 
end
endmodule







