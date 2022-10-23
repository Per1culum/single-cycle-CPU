`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:41:34
// Design Name: 
// Module Name: ram
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


module ram(
    input [3:0] addr,
    input [31:0] wdata,
    input clk,
    input ce,
    input we1,
    output reg[31:0] rdata
    );
    reg [31:0] ram[0:30];
    always @(*)
    begin
        if(ce==1'b0)
        begin
            rdata=ram[addr];
        end
    end
    always @(posedge clk)
    begin
    # 1 if((ce==1'b0)&&(we1==1'b1))
    begin
        ram[addr]<=wdata;
    end
    end
    initial
    $monitor($time,,"ram: ram=%h,rdata=%h",ram[addr],rdata);
endmodule
