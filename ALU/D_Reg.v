`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:59:05 04/24/2024 
// Design Name: 
// Module Name:    D_Reg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define X_LEN 32

module D_Reg(
input rst,
input clk,
input [`X_LEN-1:0] D,
output reg[`X_LEN-1:0] Q
);

always @(posedge rst or posedge clk)
begin
	if(rst)
	Q<=`X_LEN'b0;
	else
	Q<=D;
end
endmodule
