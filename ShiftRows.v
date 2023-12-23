`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2023 20:16:30
// Design Name: 
// Module Name: ShiftRows
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


module ShiftRows(in,out);
input [0:127]in;
output reg [0:127]out;
integer col,row;
reg [0:127]tmp1,tmp2;

always@*
begin

for(row=0;row<4;row=row+1)
begin
for(col=0;col<4;col=col+1)
begin
tmp1[((8*col)+(32*row))+:8]=in[((8*row)+(32*col))+:8];
end
end
end

always@*
begin
for(row=0;row<4;row=row+1)
begin
tmp2[(32*row)+:32]=sift(row,tmp1[(32*row)+:32]); //tmp1[(8*row)+:8*(4-row)];
end
end

always@*
begin

for(row=0;row<4;row=row+1)
begin
for(col=0;col<4;col=col+1)
begin
out[((8*col)+(32*row))+:8]=tmp2[((8*row)+(32*col))+:8];
end
end
end

function [0:31]sift(input [0:1]row,input [0:31]a);
begin
case(row)
0: sift[0:31]=a[0:31];
1: sift[0:31]={a[8+:24],a[0+:8]};
2: sift[0:31]={a[16+:16],a[0+:16]};
3: sift[0:31]={a[24+:8],a[0+:24]};
endcase
end
endfunction

endmodule
