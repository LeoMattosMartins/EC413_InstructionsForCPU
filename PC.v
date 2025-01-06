`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 01:42:11 PM
// Design Name: 
// Module Name: PC
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



module PC(
	 out,					  // mem address out
	 in,                  // mem address in
	 clk,
    reset
    );

parameter size = 32;

input clk;
input reset;
input [size-1:0] in;
output reg [size-1:0] out;

always @(posedge clk) begin

if (reset) 
out <= 0;
else
out <= in;

end

endmodule
