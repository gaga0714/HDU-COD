`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:48:50 04/24/2024 
// Design Name: 
// Module Name:    Board_Top 
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

//按动最左边按键，初始化系统
//拨动开关，LED灯会实时显示开关值；
//最左边的按键swb[1]是rst键，按下后，数码管实时显示开关值；
//按下左数第2个按键swb[2]，则数码管熄灭，弹起则数码管常亮；
//按动左数第3-6个按键swb[3:6]的任何一个：数码管显示数值+1；

module Board_Top(
    input clk,         //时钟源,20MHz
    //input rst,       //复位信号
    input [31:0] sw,   //开关
    input [1:6] swb,    //按键
    output [31:0] led,  //LED灯
    //数码管的信号
    output enable,          //数码管的使能信号
    output [2:0] which,     //数码管的位选
    output [7:0] seg        //数码管的段选,显示字形
    ); 
    assign led = sw;        // 开关输入数据，直接输出到LED
    wire rst;  
    assign rst=swb[1];      //使用最左边的按键作为rst按键 
    assign enable=~swb[2];   //使用左数第2个按键取反后作为enable，按下则数码管熄灭
    //如果直接使用数码管显示数值，即常亮，则直接赋值为1：assign enable=1;
    //如果需要数码管闪烁，可以在这里进行控制，也可以将enable直接传入Display模块，在其中进行控制
       
    // 按rst键，数码管显示开关的值，否则任意按下最右边4个键之一，数码管数据+1
    wire toggle;
    assign toggle = |swb[3:6];
    reg [31:0] Data;  
    always @(posedge rst or posedge toggle) 
    begin
      if(rst) Data <= sw;           //数码管显示开关的值 
      else    Data <= Data + 1;     //数码管显示数值+1
    end
    
    Display Display_Instance(
      .clk(clk),
      .rst(rst),
      .data(Data),          //显示数据
      .enable(enable),    
      .which(which),
      .seg(seg)
    );

endmodule


