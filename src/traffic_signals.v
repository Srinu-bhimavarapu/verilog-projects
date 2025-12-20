`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:42:46 08/16/2025 
// Design Name: 
// Module Name:    traffic_signals 
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
module traffic_signals(
    input clock,
    output reg [0:2] light
    );

parameter s0=0 , s1=1 ,s2=2;
parameter RED=3'b100 ,GREEN = 3'b010 , YELLOW = 3'b001;
reg[0:1] state;
always@(posedge clock)
case(state)
s0 : begin
light <= GREEN ;
state <= s1;
end
s1 : begin
light <= YELLOW ;
state <= s2;
end
s2 : begin 
light <= RED;
state <= s0;
end

default : begin 
light <= RED;
state <= s0;
end
endcase
endmodule
