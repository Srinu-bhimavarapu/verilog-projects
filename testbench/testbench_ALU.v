`timescale 1ns / 1ps
module testbench_ALU;

    reg [3:0] rs1, rs2, rd, func;
    reg [7:0] addr;
    reg clk1, clk2;
    wire [15:0] Z_out;

    pipeline_alu uut (
        .Z_out(Z_out), 
        .rs1(rs1), 
        .rs2(rs2), 
        .rd(rd), 
        .func(func), 
        .addr(addr), 
        .clk1(clk1), 
        .clk2(clk2)
    );
 // Clock generation
 initial begin
    clk1 = 0;
    clk2 = 0;
end
    always #5 clk1 = ~clk1;
    always #10 clk2 = ~clk2;

    initial begin
        rs1 = 0; rs2 = 0; rd = 0; func = 0; addr = 0; clk1 = 0; clk2 = 0;

        #100;
        rs1 = 4'b1010; rs2 = 4'b0101; rd = 4'b0011; func = 4'b0001; addr = 8'h0A;
        #50;
        rs1 = 4'b1100; rs2 = 4'b0011; rd = 4'b0100; func = 4'b0010; addr = 8'h14;
        #50;
		      rs1 = 4'b1111; rs2 = 4'b0001; rd = 4'b0001; func = 4'b0011; addr = 8'h1E;
        #1000 $stop;
    end

    initial begin
        $monitor("Time=%0t | rs1=%b rs2=%b func=%b addr=%h | Z_out=%h", 
                 $time, rs1, rs2, func, addr, Z_out);
    end

endmodule