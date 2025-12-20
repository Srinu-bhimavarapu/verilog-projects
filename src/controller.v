`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:59:10 08/18/2025 
// Design Name: 
// Module Name:    controller 
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
module controller(
    output reg ldA,
    output reg ldB,
    output reg ldP,
    output reg clrP,
    output reg decB,
    output reg  done,
    input clk,
    input eqz,
    input start
    );
	 reg [2:0] state;
	 parameter s0=3'b000, s1=3'b001 , s2 = 3'b010 , s3=3'b011, s4 = 3'b100;
	 always@(posedge clk)
	 begin
	 case(state)
	 s0 : if (start) state <= s1;
	 s1 : state <= s2;
	 s2 : state <= s3;
	 s3 : #2 if (eqz) state <= s4;
	 s4 : state <= s4;
	 default : state <= s0;
	 endcase
	 end
 // Output logic (Moore FSM)
    always @(state) begin
        {ldA, ldB, ldP, clrP, decB, done} = 6'b000000; // default
        case(state)
		   s0: {ldA, ldB, ldP, clrP, decB, done} = 6'b000000;
            s1: {ldA, ldB} = 2'b11;                   // load A, B
            s2: clrP = 1;                             // clear P
            s3: begin ldP=1; decB=1; end              // add+decrement
            s4: done = 1;                             // multiplication done
        endcase
    end

endmodule
