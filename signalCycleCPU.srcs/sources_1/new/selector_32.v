`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:33:32
// Design Name: 
// Module Name: selector_32
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


module selector_32(
    input [31:0] a,
    input [31:0] b,
    input choice,
    output [31:0] f
     );
    assign f=(choice== 1'b0)?a:b;
initial
 $monitor($time,,"selector_32: f=%h" ,f);
endmodule
