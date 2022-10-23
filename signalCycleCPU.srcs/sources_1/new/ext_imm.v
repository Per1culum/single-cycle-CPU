`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:34:21
// Design Name: 
// Module Name: ext_imm
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


module ext_imm(
    input [15:0] immediate,
    input sign_ext,
    output [31:0] imm
    );
    //sign_ext为1时，有符号拓展；为0时，0拓展
    assign imm=(sign_ext== 0)?{{16{1'b0}},immediate}:{{16{immediate[15]}},immediate};
initial
 $monitor($time,,"ext_imm: imm=%h" ,imm);
endmodule
