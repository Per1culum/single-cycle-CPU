`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:37:21
// Design Name: 
// Module Name: isimm
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


module isimm(
    input [31:0] rt,
    input [31:0] immediate,
    input imm,
    output [31:0] b
     );
    assign b=imm?immediate:rt;
    initial
    $monitor($time,,"isimm:b=%h" ,b);
endmodule
