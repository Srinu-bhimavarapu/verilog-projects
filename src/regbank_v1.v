`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:29:23 08/20/2025 
// Design Name: 
// Module Name:    regbank_v1 
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
module regbank_v1(
    output reg [31:0] rd_data1,
    output reg [31:0] rd_data2,
    input  [31:0] wr_data,
    input  [1:0]  sr1,     // source register 1 select
    input  [1:0]  sr2,     // source register 2 select
    input  [1:0]  dr,      // destination register select
    input         write,   // write enable
    input         clk
);
 // 4 registers of 32 bits each
    reg [31:0] r0, r1, r2, r3;

    // ---------- READ PORT 1 ----------
    always @(*) begin
        case (sr1)
            2'b00: rd_data1 = r0;
            2'b01: rd_data1 = r1;
            2'b10: rd_data1 = r2;
            2'b11: rd_data1 = r3;
            default: rd_data1 = 32'hxxxxxxxx;
        endcase
    end
	    // ---------- READ PORT 2 ----------
    always @(*) begin
        case (sr2)
            2'b00: rd_data2 = r0;
            2'b01: rd_data2 = r1;
            2'b10: rd_data2 = r2;
            2'b11: rd_data2 = r3;
            default: rd_data2 = 32'hxxxxxxxx;
        endcase
    end
	  // ---------- WRITE PORT ----------
    always @(posedge clk) begin
        if (write) begin
            case (dr)
                2'b00: r0 <= wr_data;
                2'b01: r1 <= wr_data;
                2'b10: r2 <= wr_data;
                2'b11: r3 <= wr_data;
            endcase
        end
    end

endmodule