`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:23:24 08/03/2025 
// Design Name: 
// Module Name:    example 
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
module example(
    input a,
    input b,
    input c,
    input d,
    input e,
    input f, 
	 output y);
wire t1,t2,t3,y;
nand #1 g1(t1,a,b);
and #2 g2(t2,c,~d,d);
nor #1 g3(t3,e,f);
nand #1 g4(y,t1,t2,t3);

endmodule
