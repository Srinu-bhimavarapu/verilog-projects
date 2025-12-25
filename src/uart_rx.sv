`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2025 02:20:13
// Design Name: 
// Module Name: uart_rx
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

module uart_rx #(
parameter parity_en=1,
parameter parity_odd=0
)
(
input logic clk,
input logic reset_n,
input logic rx,
input logic baud_tick,
output logic[7:0] rx_data,
output logic rx_valid,
output logic parity_error);

typedef enum logic[2:0]{
IDLE,
START,
DATA,
PARITY,
STOP
} state_t;
state_t state,next_state;
logic[7:0] rx_shift_reg;
logic[2:0] bit_count;
logic rx_parity;
always_ff@(posedge clk or negedge reset_n)
begin 
if(!reset_n) 
begin 
state<=IDLE;
rx_shift_reg<=8'd0;
bit_count<=3'd0;
rx_parity<=1'b0;
rx_data<=8'd0;
rx_valid<=1'b0;
parity_error<=1'b0;
end 
else begin
state<=next_state;
rx_valid<=1'b0;
if(state==DATA && baud_tick)
begin
rx_shift_reg <= {rx, rx_shift_reg[7:1]};
bit_count<=bit_count+3'd1;
end
if(state==PARITY && baud_tick)
begin
rx_parity<=rx;
end
if(state==STOP && baud_tick)
begin
rx_data<=rx_shift_reg;
rx_valid<=1'b1;
if(parity_en) begin
if(parity_odd)
parity_error<=(rx_parity!=~(^rx_shift_reg));
else
parity_error<=(rx_parity!=(^rx_shift_reg));
end 
else begin
parity_error<=1'b0;
end 
end 
if(state!=DATA)
bit_count<=3'd0;
end
end
always_comb 
begin
next_state =state;
case(state)
IDLE : begin
if(rx==1'b0)
next_state=START;
end  
START : begin
if(baud_tick)
next_state=DATA;
end
DATA :
begin
if(baud_tick && bit_count==3'd7)
begin
if(parity_en)
next_state=PARITY;
else 
next_state=STOP;
end
end
PARITY :
begin
if(baud_tick)
next_state=STOP;
end
STOP : begin
if(baud_tick)
next_state=IDLE;
end
endcase
end
endmodule










