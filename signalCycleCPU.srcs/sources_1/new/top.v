`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:46:24
// Design Name: 
// Module Name: top
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


module top(
     input clk,
     input rst,
     input [4:0] n,
     output [7:0] result1
     );
    wire[31:0] result;
    wire [31:0] next_addr;
    wire [31:0] addr,addr0,addr1,addr2,addr3;
    wire [31:0] immediate;
    wire [27:0] fAddress;
    wire [31:0] instrument;
    wire [5:0] opcode,func;
    wire [4:0] rs,rt,rd,sa;
    wire [15:0] imm;
    wire [25:0] address;
    wire z;
    wire [1:0] pcindex;
    wire ram2reg,ramWE,regWE,isimm,shift,isrt,sign_ext,jal;
    wire [3:0] aluOP;
    wire [4:0] waddr;
    wire [4:0] tmp_waddr;
    wire [4:0] regs31=5'b11111;
    wire [31:0] wdata,rdata1,rdata2,f,tmp_f;
    wire oc=1'b0;
    wire [31:0] a,b;
    wire [31:0] dout;
    wire [31:0] lImmediate;
    wire [31:0] fsa;
    assign result1 = result[7:0];
    PC myPC(next_addr,rst,clk,addr);
    rom myRom(addr,instrument);
    ID myID(instrument,opcode,func,rs,rt,rd,sa,imm,address);
    CU myCU(opcode,func,z,pcindex,ram2reg,ramWE,aluOP,regWE,isimm,shift,isrt,sign_ext,jal);
    ext_imm myExtImm(imm,sign_ext,immediate);
    selector_5 mySelector5_1(rd,rt,isrt,tmp_waddr); //?的寄存器是否rt
    selector_5 mySelector5_2(tmp_waddr,regs31,jal,waddr); //是否调??程序调转wa
    alu_add_4 myAdd4(addr,addr0);
    selector_32 mySelector32_1(f,addr0,jal,wdata); //是否调??程序调转wd
    registers myRegs(clk,oc,rs,rt,waddr,wdata,regWE,rdata1,rdata2);
    isimm myIsImm(rdata2,immediate,isimm,b);
    assign fsa={{27{1'b0}},sa};
    selector_32 mySelector32_2(rdata1,fsa,shift,a); //选择sa和rs数据
    alu myAlu(a,b,aluOP,tmp_f,z);
    IOManager myIOM(tmp_f,rdata2,dout,ramWE,clk,n,result);
    selector_32 mySelector32_3(tmp_f,dout,ram2reg,f); //是否将数据从ram中写?reg
    left myLeft(immediate,lImmediate);
    alu_add_b myAddb(addr0,lImmediate,addr1);
    ext_adder myExtAddr(address,fAddress);
    mixAddr myMixAddr(addr,fAddress,addr3);
    selector mySelector(addr0,addr1,rdata1,addr3,pcindex,next_addr);
initial
    $monitor($time,,"top: n=%h, result=%h" ,n,result);
endmodule
