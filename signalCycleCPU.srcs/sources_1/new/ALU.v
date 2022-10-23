`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 16:38:14
// Design Name: 
// Module Name: ALU
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


module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] op,
    output [31:0] f,
    output z
     );
    reg [31:0]result;
    always@(*)
    begin
        case(op)
        4'b0000:result=32'b0;
        4'b0001:result=a+b;
        4'b0010:result=a-b;
        4'b0011:result=a&b;
        4'b0100:result=a|b;
        4'b0101:result=a^b;
        4'b0110:result=b<<a;
        4'b0111:result=b>>a;
        4'b1000:result=$signed(b)>>>a;
        4'b1001:result={b,{16{1'b0}}};
        default:result=32'b0;
    endcase
end
    assign f=result;
    assign z=~(|result);
    initial
    $monitor($time,,"alu:a:%h,b:%h,op:%h," ,a,b,op);
    initial
    $monitor($time,,"alu:f:%h,z:%b" ,f,z);
endmodule
