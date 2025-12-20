`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:11:50 08/25/2025 
// Design Name: 
// Module Name:    pipe_ex 
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
module pipe_ex(f,a,b,c,d,clk
    );
parameter n = 10;
input[n-1 : 0] a,b,c,d;
input clk;
output[n-1 :0] f;
reg [n-1:0] l12_x1,l12_x2,l12_d,l22_x3,l23_x3,l23_d,l34_f;
assign f=l34_f;
always@(posedge clk)
begin 
l12_x1 <= #4 a+b;
l12_x2 <= #4 c-d;
l12_d <= d;  // stage 1

l22_x3 <= #4 l12_x1 + l12_x2; // stage2

l23_x3 <= l22_x3;
l23_d <= l12_d;  // stage 3

l34_f <= #6 l23_x3 * l23_d;
end  // stage 4
endmodule
