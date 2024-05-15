`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:47:25 05/08/2024 
// Design Name: 
// Module Name:    ALU_Regs 
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
module ALU_Regs(
input rst,
input clk_RR,
input clk_F,
input clk_WB,
input [4:0] R_Addr_A,
input [4:0] R_Addr_B,
input [4:0] W_Addr,
input Reg_Write,
input [3:0] ALU_OP,
output [`X_LEN-1:0] A,
output [`X_LEN-1:0] B,
output [`X_LEN-1:0] F,
output [3:0] FR
    );
wire [`X_LEN-1:0] ALU_F;
wire ZF,SF,CF,OF;

ALU the_ALU(
.ALU_A(A),
.ALU_B(B),
.ALU_OP(ALU_OP),
.ALU_F(ALU_F),
.ZF(ZF),
.SF(SF),
.CF(CF),
.OF(OF)
);

wire [3:0] Flags;
assign Flags={ZF,SF,CF,OF};

wire [`X_LEN-1:0] R_Data_A,R_Data_B;

Regs the_Regs(
.rst(rst),
.clk_Regs(clk_WB),
.R_Addr_A(R_Addr_A),
.R_Addr_B(R_Addr_B),
.W_Addr(W_Addr),
.W_Data(F),
.Reg_Write(Reg_Write),
.R_Data_A(R_Data_A),
.R_Data_B(R_Data_B)
);

D_Reg A_Latch(
.rst(rst),
.clk(clk_RR),
.D(R_Data_A),
.Q(A)
);

D_Reg B_Latch(
.rst(rst),
.clk(clk_RR),
.D(R_Data_B),
.Q(B)
);

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


endmodule
