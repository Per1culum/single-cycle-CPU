# Xilin_vivado实现单周期CPU

实验目的：完成必需的指令，能够在该CPU上实现斐波那契数列
实现risc—v中的15条指令的单周期CPU，测试每条指令的正确性

实验环境：（1）软件设计平台：Vivado2019
          （2）硬件设备：Xilinx Artix-7 FPGA开发板
          
主要编程文件： 
top.v
PC.v
rom.v
ram.v
ID.v
CU.v
ext_imm.v
ext_adder.v
selector.v
selector_5.v
selector_32.v
alu.v
alu_add_4.v
alu_add_b.v
registers.v
isimm.v
IOManager.v
left.v
mixAddr.v
