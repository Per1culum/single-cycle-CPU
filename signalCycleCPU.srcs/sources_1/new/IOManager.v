`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:40:00
// Design Name: 
// Module Name: IOManager
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


module IOManager(
    input [5:0] addr,
    input [31:0] din,
    output [31:0] dout,
    input we,
    input clk,
    input [3:0] switch,
    output reg[31:0] displaydata
    );
    reg [31:0] indata,outdata;
    wire [31:0] ramdout;
    wire ramWE;
    wire enable;
    assign enable=(|addr[5:4]);
    ram dram(addr[3:0],din,clk,enable,ramWE,ramdout);
    assign dout=(addr[5]==1'b1)?{{28{1'b0}},switch}:ramdout;
    assign ramWE=we&(~addr[4]);
    always @(posedge clk)
    begin
        if((addr[4]==1'b1)&&we)
        displaydata<=din;
    end
    initial
    $monitor($time,,"IOM: addr=%h, din=%h, dout=%h" ,addr,din,dout);
    initial
    $monitor($time,,"IOM: switch=%h, displaydata=%h" ,switch,displaydata);
endmodule
