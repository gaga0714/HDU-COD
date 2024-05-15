`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:22:26 05/08/2024 
// Design Name: 
// Module Name:    Regs 
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

module Regs(
input rst,
input clk_Regs,
input [4:0] R_Addr_A,
input [4:0] R_Addr_B,
input [4:0] W_Addr,
input [`X_LEN-1:0] W_Data,
input Reg_Write,
output [`X_LEN-1:0] R_Data_A,
output [`X_LEN-1:0] R_Data_B
    );
	 
reg [`X_LEN-1:0] X_Regs[31:1];
assign R_Data_A = (R_Addr_A==5'd0)?`X_LEN'd0:X_Regs[R_Addr_A];
assign R_Data_B = (R_Addr_B==5'd0)?`X_LEN'd0:X_Regs[R_Addr_B];

reg[5:0] i;
always @(posedge rst or posedge clk_Regs)
begin
if(rst)
begin
for(i=3;i<6'd32;i=i+1)
	X_Regs[i]<={{26{1'b0}},i};
X_Regs[1]<=32'hffff_fffe;
X_Regs[2]<=32'h0000_0003;
end 
else 
if(Reg_Write&&(W_Addr!=0))
X_Regs[W_Addr]<=W_Data;
end

endmodule
