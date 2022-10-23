`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:25:26
// Design Name: 
// Module Name: CU
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

module CU(
    input [5:0] opcode,
    input [5:0] func,
    input z,
    output reg [1:0] pcindex,
    output reg ram2reg,
    output reg ramWE,
    output reg [3:0] aluOP,
    output reg regWE,
    output reg imm,
    output reg shift,
    output reg isrt,
    output reg sign_ext,
    output reg jal
 );
    always @(*)
    begin
    //设置默认值
    shift= 1'b0;
    ram2reg= 1'b0;
    ramWE= 1'b0;
    regWE= 1'b0;
    imm= 1'b0;
    isrt= 1'b0;
    sign_ext= 1'b0;
    pcindex= 2'b00;
    aluOP= 4'b0000;
    jal= 1'b0;
    case(opcode)
    //R指令
    6'b000000:
    begin
    case(func)
    6'b100000: //add指令
    begin
        aluOP= 4'b0001;
        regWE= 1'b1;
    end
    6'b100010: //sub指令
    begin
        aluOP= 4'b0010;
        regWE= 1'b1;
    end
    6'b100100: //and指令
    begin
        aluOP= 4'b0011;
        regWE= 1'b1;
    end
    6'b100101: //or指令
    begin
        aluOP= 4'b0100;
        regWE= 1'b1;
    end
    6'b100110: //xor指令
    begin
        aluOP= 4'b0101;
        regWE= 1'b1;
    end
    6'b000000: //sll指令
    begin
        aluOP= 4'b0110;
        regWE= 1'b1;
        shift= 1'b1;
        isrt= 1'b1;
    end
    6'b000010: //srl指令
    begin
        aluOP= 4'b0111;
        regWE= 1'b1;
        shift= 1'b1;
        isrt= 1'b1;
    end
    6'b000011: //sra指令
    begin
        aluOP= 4'b1000;
        regWE= 1'b1;
        shift= 1'b1;
        isrt= 1'b1;
    end
    6'b001000: //jr指令
    begin
        pcindex= 2'b10;
    end
    endcase
end
//I指令
    6'b001000: //addi指令
    begin
        aluOP= 4'b0001;
        imm= 1'b1;
        regWE= 1'b1;
        sign_ext= 1'b1;
        isrt= 1'b1;
    end
    6'b001100: //andi指令
    begin
        aluOP= 4'b0011;
        imm= 1'b1;
        regWE= 1'b1;
        isrt= 1'b1;
    end
    6'b001101: //ori指令
    begin
        aluOP= 4'b0100;
        imm= 1'b1;
        regWE= 1'b1;
        isrt= 1'b1;
    end
    6'b001110: //xori指令
    begin
        aluOP= 4'b0101;
        imm= 1'b1;
        regWE= 1'b1;
       isrt= 1'b1;
    end
    6'b100011: //lw指令
    begin
    ram2reg= 1'b1;
    aluOP= 4'b0001;
    imm= 1'b1;
    regWE= 1'b1;
    sign_ext= 1'b1;
    isrt= 1'b1;
    end
    6'b101011: //sw指令
    begin
        ramWE= 1'b1;
        aluOP= 4'b0001;
        imm= 1'b1;
        sign_ext= 1'b1;
        isrt= 1'b1;
    end
    6'b000100: //beq指令
    begin
        aluOP= 4'b0010;
        sign_ext= 1'b1;
        if(z==1'b1)
        begin
            pcindex= 2'b01;
        end
    end
    6'b000101: //bne指令
    begin
        aluOP= 4'b0010;
        sign_ext= 1'b1;
        if(z==1'b0)
        begin
            pcindex= 2'b01;
        end
    end
    6'b001111: //lui指令
    begin
        regWE= 1'b1;
        imm= 1'b1;
        isrt= 1'b1;
        aluOP= 4'b1001;
    end
    //J指令
    6'b000010: //j指令
    begin
        pcindex= 2'b11;
    end
    6'b000011: //jal指令
    begin
        jal= 1'b1;
        regWE= 1'b1;
        pcindex= 2'b11;
    end
    endcase
end
initial
    $monitor($time,,"CU:imm=%b,op=%h, isrt=%h, pcindex=%h, regWE=%h, shift=%h, ram2reg=%h, ramWE=%h " ,imm,aluOP,isrt,pcindex,regWE,shift,ram2reg,ramWE);
endmodule
