`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:35:06
// Design Name: 
// Module Name: alu_add_4
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

module alu_add_4(
    input [31:0] a,
    output [31:0] f
     );
    assign f=a+32'b0100;
    initial
    $monitor($time,,"alu_add_4£ºf=%h",f);
endmodule
