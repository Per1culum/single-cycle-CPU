`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:44:45
// Design Name: 
// Module Name: ext_adder
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


module ext_adder(
    input [25:0] address,
    output [27:0] f
    );
    assign f={address,{2{1'b0}}};
    initial
    $monitor($time,,"ext_addr: address=%h, f=%h " ,address,f);
endmodule
