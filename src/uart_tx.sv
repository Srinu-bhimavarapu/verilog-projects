`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2025 01:12:19
// Design Name: 
// Module Name: uart_tx
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

module uart_tx #(
parameter parity_en=1,
parameter parity_odd=0
)
(
input logic clk,
input logic reset_n,
input logic baud_tick ,
input logic tx_start,
input logic [7:0] tx_data,
output logic tx,
output logic tx_busy
);
typedef enum logic[2:0]{
IDLE,
START,
DATA,
PARITY,
STOP
} state_t;
state_t state,next_state;
// this is declaration of internal registers 
logic[7:0] shift_reg ;
logic[2:0] bit_count;
logic parity_bit;

always_ff@(posedge clk or negedge reset_n)
begin 
if(!reset_n)
begin
state<=IDLE;
shift_reg<=8'd0;
bit_count<=3'd0;
end 
else begin 
state <= next_state;
if(state == IDLE && tx_start)
begin
shift_reg<=tx_data;
bit_count<=3'd0;
end
if(state==DATA&&baud_tick) 
begin
shift_reg<=shift_reg>>1;
bit_count<=bit_count+3'd1;
end
end
end
always_comb begin
if (parity_en)
begin
if(parity_odd)
parity_bit=~(^tx_data);
else 
parity_bit=(^tx_data);
end 
else begin
parity_bit=1'b0;
end 
end 
always_comb begin
tx=1'b1;
tx_busy=1'b1;
next_state=state;
case(state)
IDLE : begin
tx_busy=1'b0;
if(tx_start)
next_state=START;
end
START : begin
tx=1'b0;
if(baud_tick)
next_state=DATA;
end
DATA : begin
tx=shift_reg[0];
if(baud_tick && bit_count == 3'd7)
begin
if(parity_en)
next_state=PARITY;
else 
next_state=STOP;
end
end
PARITY :begin
tx=parity_bit;
if(baud_tick)
next_state=STOP;
end
STOP :  begin 
tx=1'b1;
if(baud_tick)
next_state=IDLE;
end 
endcase
end 
endmodule







