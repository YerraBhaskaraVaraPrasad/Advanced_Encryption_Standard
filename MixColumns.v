`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2023 23:09:36
// Design Name: 
// Module Name: MixColumns
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


module MixColumns(in,out);
input [0:127]in;
output reg [0:127]out;
integer col;

always@*
begin

for(col=0;col<4;col=col+1)
begin
out[(col*32)+:8]=op2(in[(col*32)+:8])^op3(in[((col*32)+(1*8))+:8])^in[((col*32)+(2*8))+:8]^in[((col*32)+(3*8))+:8];
out[((col*32)+(1*8))+:8]=(in[(col*32)+:8])^op2(in[((col*32)+(1*8))+:8])^op3(in[((col*32)+(2*8))+:8])^in[((col*32)+(3*8))+:8];
out[((col*32)+(2*8))+:8]=(in[(col*32)+:8])^(in[((col*32)+(1*8))+:8])^op2(in[((col*32)+(2*8))+:8])^op3(in[((col*32)+(3*8))+:8]);
out[((col*32)+(3*8))+:8]=op3(in[(col*32)+:8])^(in[((col*32)+(1*8))+:8])^in[((col*32)+(2*8))+:8]^op2(in[((col*32)+(3*8))+:8]);
end

end

function [0:7]op2(input [0:7]in);
begin
if(in[0]) op2=(in<<1)^(8'h1b);
else op2=in<<1;
end
endfunction

function [0:7]op3(input [0:7]in);
begin
op3=in^op2(in);
end
endfunction

endmodule
