`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:44:00
// Design Name: 
// Module Name: alu_add_b
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


module alu_add_b(
    input [31:0] addr,
    input [31:0] immediate,
    output [31:0] f
     );
    assign f=addr+immediate;
    initial
    $monitor($time,,"alu_add_b: addr=%h, immediate=%h, f=%h " ,addr,immediate,f);
endmodule
