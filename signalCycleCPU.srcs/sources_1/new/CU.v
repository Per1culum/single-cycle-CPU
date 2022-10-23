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
    //����Ĭ��ֵ
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
    //Rָ��
    6'b000000:
    begin
    case(func)
    6'b100000: //addָ��
    begin
        aluOP= 4'b0001;
        regWE= 1'b1;
    end
    6'b100010: //subָ��
    begin
        aluOP= 4'b0010;
        regWE= 1'b1;
    end
    6'b100100: //andָ��
    begin
        aluOP= 4'b0011;
        regWE= 1'b1;
    end
    6'b100101: //orָ��
    begin
        aluOP= 4'b0100;
        regWE= 1'b1;
    end
    6'b100110: //xorָ��
    begin
        aluOP= 4'b0101;
        regWE= 1'b1;
    end
    6'b000000: //sllָ��
    begin
        aluOP= 4'b0110;
        regWE= 1'b1;
        shift= 1'b1;
        isrt= 1'b1;
    end
    6'b000010: //srlָ��
    begin
        aluOP= 4'b0111;
        regWE= 1'b1;
        shift= 1'b1;
        isrt= 1'b1;
    end
    6'b000011: //sraָ��
    begin
        aluOP= 4'b1000;
        regWE= 1'b1;
        shift= 1'b1;
        isrt= 1'b1;
    end
    6'b001000: //jrָ��
    begin
        pcindex= 2'b10;
    end
    endcase
end
//Iָ��
    6'b001000: //addiָ��
    begin
        aluOP= 4'b0001;
        imm= 1'b1;
        regWE= 1'b1;
        sign_ext= 1'b1;
        isrt= 1'b1;
    end
    6'b001100: //andiָ��
    begin
        aluOP= 4'b0011;
        imm= 1'b1;
        regWE= 1'b1;
        isrt= 1'b1;
    end
    6'b001101: //oriָ��
    begin
        aluOP= 4'b0100;
        imm= 1'b1;
        regWE= 1'b1;
        isrt= 1'b1;
    end
    6'b001110: //xoriָ��
    begin
        aluOP= 4'b0101;
        imm= 1'b1;
        regWE= 1'b1;
       isrt= 1'b1;
    end
    6'b100011: //lwָ��
    begin
    ram2reg= 1'b1;
    aluOP= 4'b0001;
    imm= 1'b1;
    regWE= 1'b1;
    sign_ext= 1'b1;
    isrt= 1'b1;
    end
    6'b101011: //swָ��
    begin
        ramWE= 1'b1;
        aluOP= 4'b0001;
        imm= 1'b1;
        sign_ext= 1'b1;
        isrt= 1'b1;
    end
    6'b000100: //beqָ��
    begin
        aluOP= 4'b0010;
        sign_ext= 1'b1;
        if(z==1'b1)
        begin
            pcindex= 2'b01;
        end
    end
    6'b000101: //bneָ��
    begin
        aluOP= 4'b0010;
        sign_ext= 1'b1;
        if(z==1'b0)
        begin
            pcindex= 2'b01;
        end
    end
    6'b001111: //luiָ��
    begin
        regWE= 1'b1;
        imm= 1'b1;
        isrt= 1'b1;
        aluOP= 4'b1001;
    end
    //Jָ��
    6'b000010: //jָ��
    begin
        pcindex= 2'b11;
    end
    6'b000011: //jalָ��
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
