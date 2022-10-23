`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:18:36
// Design Name: 
// Module Name: selector
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


module selector(
    input [31:0] addr0,
    input [31:0] addr1,
    input [31:0] addr2,
    input [31:0] addr3,
    input [1:0] pcsource,
    output reg [31:0] next_addr
    );
    always @(*)
    begin
        case(pcsource)
        2'b00:
        begin
            next_addr=addr0;
        end
        2'b01:
        begin
            next_addr=addr1; //bne,beq
        end
        2'b10:
        begin
            next_addr=addr2; //j
        end
        2'b11:
        begin
            next_addr=addr3; //jal,jr   
        end
        endcase
    end
initial
    $monitor($time,,"selector: pcsource=%h, next_addr=%h" ,pcsource,next_addr);
endmodule
