`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:42:25 05/15/2024 
// Design Name: 
// Module Name:    Mem 
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
module Mem(
input Mem_Write,
input [7:0]DM_Addr,
input [31:0]M_W_Data,
input clk_dm,
output [31:0]M_R_Data
    );
RAM_B Data_RAM(
.clka(clk_dm),
.wea(Mem_Write),
.addra(DM_Addr[7:2]),
.dina(M_W_Data),
.douta(M_R_Data)
);

endmodule

