`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:45:26
// Design Name: 
// Module Name: mixAddr
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


module mixAddr(
    input [31:0] addr,
    input [27:0] address,
    output [31:0] f
    );
    assign f={{addr[31:28]},address};
    initial
    $monitor($time,,"mixAddr: addr=%h, address=%h, f=%h" ,addr,address,f);
endmodule
