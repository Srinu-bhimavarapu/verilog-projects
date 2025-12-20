`timescale 1ns/1ps
module tb_paralleladder;

  reg [7:0] in1, in2;
  reg cin;
  wire [7:0] sum;
  wire count;

  // Instantiate the DUT
   paralleladder dut (
    .in1(in1),
    .in2(in2),
    .cin(cin),
    .sum(sum),
    .count(count)
  );
initial begin
    // Monitor signals continuously
    $monitor("Time=%0dns | in1=%d in2=%d cin=%b | sum=%d count=%b",
              $time, in1, in2, cin, sum, count);

    // Testcases
    in1 = 8'd5;   in2 = 8'd3;   cin = 0; #25;  // 5+3+0 = 8
    in1 = 8'd5;   in2 = 8'd3;   cin = 1; #25;  // 5+3+1 = 9
    in1 = 8'd255; in2 = 8'd1;   cin = 0; #25;  // 255+1=256 => sum=0, count=1
    in1 = 8'd200; in2 = 8'd100; cin = 1; #25;  // 200+100+1=301 => sum=45, count=1

    $stop;
  end
endmodule