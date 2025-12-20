`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:12:46 08/02/2025 
// Design Name: 
// Module Name:    full_adder 
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
module full_adder (
    input a,       // First input bit
    input b,       // Second input bit
    input c_in,    // Carry-in
    output sum,    // Sum output
    output c_out   // Carry-out
);

// Internal wires
wire w1, w2, w3, w4;

// Sum = a ^ b ^ c_in
xor g1(w1, a, b);
xor g2(sum, w1, c_in);

// Carry-out = (a & b) | (b & c_in) | (a & c_in)
and g3(w2, a, b);
and g4(w3, b, c_in);
and g5(w4, a, c_in);  // w1 reused temporarily
or  g6(c_out, w2, w3, w4);

endmodule