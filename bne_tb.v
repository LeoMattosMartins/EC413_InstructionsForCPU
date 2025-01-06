`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 02:11:03 PM
// Design Name: 
// Module Name: bne_tb
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


module bne_tb;


	reg rst;
	reg clk;
	reg initialize;
	reg [31:0] instruction_initialize_data;
	reg [31:0] instruction_initialize_address;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.rst(rst), 
		.clk(clk), 
		.initialize(initialize), 
		.instruction_initialize_data(instruction_initialize_data), 
		.instruction_initialize_address(instruction_initialize_address)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		initialize = 1;
		instruction_initialize_data = 0;
		instruction_initialize_address = 0;

		#100;
        
		instruction_initialize_address = 0;
		instruction_initialize_data = 32'b000000_00000_00010_00001_00000_100000;      // ADD R1, R0, R2

        #20;
        instruction_initialize_address = 4;
		instruction_initialize_data = 32'b000000_00000_00010_00001_00000_100000;      // ADD R1, R0, R2

        #20;
		instruction_initialize_address = 8;
		instruction_initialize_data = 32'b000101_00001_00001_1111111111111101;        // BNE R1, R1, -3
		
		#20;
		instruction_initialize_address = 12;
		instruction_initialize_data = 32'b000101_00001_00000_1111111111111100;        // BNE R1, R2, -4

        #20;
		initialize = 0;
		rst = 0;
		
	end
      
always
#5 clk = ~clk;
endmodule
