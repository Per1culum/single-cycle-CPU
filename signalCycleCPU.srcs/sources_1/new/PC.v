`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:14:32
// Design Name: 
// Module Name: PC
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


module PC(
    input [31:0] next_addr,
    input rst,
    input clk,
    output reg [31:0] addr
    );
    always @(posedge clk)
    begin
        if(rst==1'b1)
        begin
            addr<=next_addr;
        end
        else
        begin
            addr<= 32'b0;
        end
    end
    initial
    $monitor($time,,"PC£ºaddr=%h",addr);
endmodule
