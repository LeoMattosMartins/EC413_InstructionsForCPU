`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 01:42:11 PM
// Design Name: 
// Module Name: control
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


module control(
		input [5:0] instruction,
		output reg [1:0] ALUOp,
		output reg MemRead,
		output reg MemtoReg,
		output reg RegDst,
		output reg Branch, 
		output reg ALUSrc,
		output reg MemWrite,
		output reg RegWrite,
		output reg BNE_Branch
		);


always @(*) begin
		if (instruction == 6'b00_0000) begin	        //RType
            ALUOp = 2'b00;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            RegDst = 1'b1;
            Branch = 1'b0;		
            ALUSrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            BNE_Branch = 1'b0;
		end else if (instruction == 6'b00_0100) begin   //branch
            ALUOp = 2'b01;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            RegDst = 1'b0;
            Branch = 1'b1;		
            ALUSrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b0;
            BNE_Branch = 1'b0;
		end else if (instruction == 6'b10_1011) begin   // sw
            ALUOp = 2'b10;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            RegDst = 1'b0;
            Branch = 1'b0;		
            ALUSrc = 1'b1;
            MemWrite = 1'b1;
            RegWrite = 1'b0;
            BNE_Branch = 1'b0;
		end else if (instruction == 6'b10_0011) begin   // lw
            ALUOp = 2'b10;
            MemRead = 1'b1;
            MemtoReg = 1'b1;
            RegDst = 1'b0;
            Branch = 1'b0;		
            ALUSrc = 1'b1;
            MemWrite = 1'b0;
            RegWrite = 1'b1;
            BNE_Branch = 1'b0;
            
		end else if (instruction == 6'b100_000) begin // addi
		    ALUOp = 2'b10;
            MemRead = 1'b1;
            MemtoReg = 1'b1;
            RegDst = 1'b1;
            Branch = 1'b0;		
            ALUSrc = 1'b1;
            MemWrite = 1'b1;
            RegWrite = 1'b1;
            BNE_Branch = 1'b0;
		end else if (instruction == 6'b000_010) begin // j
		    ALUOp = 2'b00;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            RegDst = 1'b0;
            Branch = 1'b1;		
            ALUSrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b0;
            BNE_Branch = 1'b1;
		end else if (instruction == 6'b000_101) begin // bne
		    ALUOp = 2'b01;
            MemRead = 1'b0;
            MemtoReg = 1'b0;
            RegDst = 1'b0;
            Branch = 1'b0;		
            ALUSrc = 1'b0;
            MemWrite = 1'b0;
            RegWrite = 1'b0;
            BNE_Branch = 1'b1;
		end else if (instruction == 6'b001_111) begin // lui
		    ALUOp = 2'b11;
            MemRead = 1'b1;
            MemtoReg = 1'b1;
            RegDst = 1'b1;
            Branch = 1'b0;		
            ALUSrc = 1'b1;
            MemWrite = 1'b1;
            RegWrite = 1'b1;
            BNE_Branch = 1'b0;
            
		end else begin
		ALUOp = 2'b00;//0
		MemRead = 1'b0;
		MemtoReg = 1'b0;
		RegDst = 1'b0;
      Branch = 1'b0;		
	   ALUSrc = 1'b0;
		MemWrite = 1'b0;
		RegWrite = 1'b0;
		end
	
	
end
endmodule
