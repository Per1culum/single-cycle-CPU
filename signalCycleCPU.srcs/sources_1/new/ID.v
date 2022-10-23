`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:20:47
// Design Name: 
// Module Name: ID
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


module ID(
    input [31:0] instrument,
    output reg [5:0] opcode,
    output reg [5:0] func,
    output reg [4:0] rs,
    output reg [4:0] rt,
    output reg [4:0] rd,
    output reg [4:0] sa,
    output reg [15:0] immediate,
    output reg [25:0] addr
    );
    always @(*)
    begin
    opcode=instrument[ 31:26];
    rs= 5'b0;
    rt= 5'b0;
    rd= 5'b0;
    sa= 5'b0;
    immediate= 16'b0;
    addr= 25'b0;
    case(opcode)
    6'b000000: //RÀàĞÍ
    begin
        func=instrument[5:0];
        sa=instrument[10:6];
        rd=instrument[15:11];
        rt=instrument[20:16];
        rs=instrument[ 25:21];
    end
    6'b001000,6'b001100,6'b001101,6'b001110,6'b100011,6'b101011,6'b000100,6'b000101,6'b001111:
    begin
        immediate=instrument[ 15:0];
        rt=instrument[ 20:16];
        rs=instrument[ 25:21];
    end
    6'b000010,6'b000011:
    begin
        addr=instrument[ 25:0];
    end
    default: rs=5'b00000;
    endcase
end
endmodule
