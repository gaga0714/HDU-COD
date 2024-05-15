`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:24:21 05/08/2024 
// Design Name: 
// Module Name:    ALU_Regs_Top 
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

module ALU_Regs_Top(
input rst,
input [4:0]R_Addr_A,
input [4:0]R_Addr_B,
input [4:0]W_Addr,
input [3:0]ALU_OP,
input Reg_Write,
input clk_RR,
input clk_F,
input clk_WB,
input clk,
input [1:0] Out_Sel,
output [3:0]FR,
output [2:0]which,
output [7:0]seg,
output enable
);
assign enable = 1'b1;
wire [31:0]F;
wire [31:0]A;
wire [31:0]B;
reg [31:0] Data;

ALU_Regs alu_regs(rst,clk_RR,clk_F,clk_WB,R_Addr_A,R_Addr_B,W_Addr,Reg_Write,ALU_OP,A,B,F,FR);
Display Tube(clk,rst,Data,enable,which,seg);
always @(*)
begin
case(Out_Sel)
2'b01:Data=A;
2'b10:Data=B;
2'b11:Data=F;
default:Data=32'hE0E0_E0E0;
endcase
end

endmodule
