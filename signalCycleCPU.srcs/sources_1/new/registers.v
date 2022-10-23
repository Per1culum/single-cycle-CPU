`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:36:00
// Design Name: 
// Module Name: registers
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


module registers(
    input clk,
    input oc,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    input [31:0] wdata,
    input we,
    output reg [31:0] rdata1,
    output reg [31:0] rdata2
     );
    reg[31:0] regts[1:31];
    always @(*)
    begin
        if(oc==1'b1)
        begin
            rdata1= 32'bz;
        end
        else if(raddr1==5'b00000)
    begin
        rdata1= 32'b0;
    end
    else
    begin
        rdata1=regts[raddr1];
    end
 $monitor($time,,"Read R %d data1=%d",raddr1,rdata1);
    end
    always @(*)
    begin
        if(oc==1'b1)
        begin
            rdata2= 32'bz;
        end
        else if(raddr2==5'b00000)
        begin
            rdata2= 32'b0;
        end
        else
        begin
            rdata2=regts[raddr2];
        end
 $monitor($time,,"Read R %d data2=%d",raddr2,rdata2);
end
    always @(posedge clk)
    begin
        # 1 if((we==1'b1)&&(waddr!=5'b00000))
        begin
            regts[waddr]<=wdata;
            $monitor($time,,"write %h to data=%d" ,waddr,wdata);
        end
    end
endmodule
