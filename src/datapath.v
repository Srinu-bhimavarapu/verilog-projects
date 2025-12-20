`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:22:02 08/18/2025 
// Design Name: 
// Module Name:    datapath 
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
module datapath(
    input clk,
    input ldA, ldB, ldP, clrP, decB,
    input [7:0] data_in,
    output eqz,
    output [15:0] P   // final product
    );

    reg [7:0] A, B;
    reg [15:0] P_reg;
    wire [15:0] Z;
	  // Register A
    always @(posedge clk) begin
        if(ldA)
            A <= data_in;
    end

    // Register B
    always @(posedge clk) begin
        if(ldB)
            B <= data_in;
        else if(decB)
            B <= B - 8'd1;

    end
	  // Product Register P
    always @(posedge clk) begin
        if(clrP)
            P_reg <= 0;
        else if(ldP)
            P_reg <= Z;
    end

    // Adder
    assign Z = P_reg + {8'b0, A};

    // Comparatorassign 
    assign eqz = (B == 0);
	   // Output product
    assign P = P_reg;

endmodule