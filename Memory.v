`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 01:42:11 PM
// Design Name: 
// Module Name: Memory
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
module Memory(
     address,
     data_in,
     data_out,
     read,
     write,
	  clk
    );
	 
	 parameter data_size = 32;
	 parameter address_size = 16;
	 
	 parameter memory_depth = 2**address_size;  // do not specify this when using module
	 
    input [31:0] address;
    input [data_size-1:0] data_in;
    output [data_size-1:0] data_out;
    input read;
    input write;
	 input clk;
	 
reg [data_size-1:0] mem [0:memory_depth-1];
assign data_out = (read) ?  mem [address[address_size+1:2]] : 32'bz;


always @(posedge clk) begin
case (write)
1: mem[address[address_size+1:2]] = data_in;
endcase
end

 

endmodule
