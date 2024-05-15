`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:26:09 04/24/2024 
// Design Name: 
// Module Name:    D_Reg4 
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

module D_Reg4(
input rst,
input clk,
input [3:0] D,
output reg[3:0] Q
    );
always @(posedge rst or posedge clk)
begin
if(rst)
begin
Q<=4'b0;
end
else
begin
Q<=D;
end
end
endmodule
