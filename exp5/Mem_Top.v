`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:42:55 05/15/2024 
// Design Name: 
// Module Name:    Mem_Top 
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
module Mem_Top(
    input Mem_Write,
    input [7:0]DM_Addr,
    input [1:0]MW_Data_s,
    input clk_dm,
    input clk,
    input rst,
    output [2:0]which,
    output [7:0]seg,
    output enable
    );
	 assign enable = 1'b1;
    wire [31:0]data[3:0];
    assign data[0]=32'h11223344;
    assign data[1]=32'h44332211;
    assign data[2]=32'hffffffff;
    assign data[3]=32'h00000000;
    wire [31:0]Data_Out;
    Mem mem(Mem_Write,DM_Addr,data[MW_Data_s],clk_dm,Data_Out);
    Display Tube(clk,rst,Data_Out,enable,which,seg);
endmodule
