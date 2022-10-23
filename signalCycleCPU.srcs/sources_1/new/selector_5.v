`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:32:35
// Design Name: 
// Module Name: selector_5
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


module selector_5(
    input [4:0] a,
    input [4:0] b,
    input choice,
    output [4:0] f
 );
    assign f=(choice== 1'b0)?a:b;
initial
 $monitor($time,,"selector_5: a=%h, b=%h, f=%h" ,a,b,f);
endmodule
