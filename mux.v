`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 01:42:11 PM
// Design Name: 
// Module Name: mux
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


module mux( 
	 sel, 
	 in_0, 
	 in_1,
    out 
    );
	 
parameter size = 32;

input sel;
input [size-1:0] in_0;
input [size-1:0] in_1;

output [size-1:0] out;

assign out = (sel) ? in_1 : in_0;

endmodule