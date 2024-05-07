`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:53:21 04/24/2024 
// Design Name: 
// Module Name:    ALU_Top 
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

module ALU_Top(
input rst,
input clk_A,
input clk_B,
input clk_F,
input [`X_LEN-1:0] SW,
output [3:0] FR,
input clk_20M,
input [1:0] Out_Sel,
output enable,
output [2:0] which,
output [7:0] seg
);

assign enable = 1'b1;

wire [3:0] Flags;
wire [`X_LEN-1:0] A,B,F,ALU_F;
wire ZF,SF,CF,OF;

D_Reg A_Latch(
.rst(rst),
.clk(clk_A),
.D(SW),
.Q(A)
);

D_Reg B_Latch(
.rst(rst),
.clk(clk_B),
.D(SW),
.Q(B)
);

ALU the_ALU(
.ALU_A(A),
.ALU_B(B),
.ALU_OP(SW[3:0]),//由最右边的4位开关提供运算功能
.ALU_F(ALU_F),
.ZF(ZF),
.SF(SF),
.CF(CF),
.OF(OF)
);

assign Flags = {ZF,SF,CF,OF};

D_Reg F_Latch(
.rst(rst),
.clk(clk_F),
.D(ALU_F),
.Q(F)
);

D_Reg4 FR_Latch(
.rst(rst),
.clk(clk_F),
.D(Flags),
.Q(FR)
);

reg [31:0] Data;

Display Tube(
.rst(rst),
.clk(clk_20M),
.data(Data),
.enable(enable),
.which(which),
.seg(seg)
);

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


