`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 01:42:11 PM
// Design Name: 
// Module Name: ALU
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



module ALU(
    a,
    b,
	 func,
    out,
    zero_flag
    );


	 parameter size = 32;
	 
    input [size-1:0] a;
    input [size-1:0] b;
	 input [2:0] func;
    output reg [size-1:0] out;
    output reg zero_flag;
	 
	 	
	always @(*) begin
	case (out) 
	0: zero_flag = 1'b1;
	default: zero_flag = 1'b0;
	endcase
	end
	
	always @(*) begin
		if (func == 3'd0) 
		out = a+b;
		else if (func == 3'd1)
		out = a-b;
		else if (func == 3'd2)
		out = a&b;
		else if (func == 3'd3)
		out = a|b;
		else if (func == 3'd4)
		out = ~(a|b);
		else if (func == 3'd5)
		out = (a<b)?1:0;
		else if (func ==3'd6)
		out = b<<16;
		else
		out = 0;
   end



endmodule