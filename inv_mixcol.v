`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2023 15:53:47
// Design Name: 
// Module Name: inv_mixcol
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


module inv_mixcol(in,out);
input [0:127]in;
output reg [0:127]out;
integer col;

always@*
begin
for(col=0;col<4;col=col+1)
begin
out[(col*32)+:8]=mb0e(in[(col*32)+:8])^mb0b(in[((col*32)+(1*8))+:8])^mb0d(in[((col*32)+(2*8))+:8])^mb09(in[((col*32)+(3*8))+:8]);
out[((col*32)+(1*8))+:8]=mb09(in[(col*32)+:8])^mb0e(in[((col*32)+(1*8))+:8])^mb0b(in[((col*32)+(2*8))+:8])^mb0d(in[((col*32)+(3*8))+:8]);
out[((col*32)+(2*8))+:8]=mb0d(in[(col*32)+:8])^mb09(in[((col*32)+(1*8))+:8])^mb0e(in[((col*32)+(2*8))+:8])^mb0b(in[((col*32)+(3*8))+:8]);
out[((col*32)+(3*8))+:8]=mb0b(in[(col*32)+:8])^mb0d(in[((col*32)+(1*8))+:8])^mb09(in[((col*32)+(2*8))+:8])^mb0e(in[((col*32)+(3*8))+:8]);
end
end

function [0:7]mb0e(input [0:7]in);
begin
mb0e=op2(in,3)^op2(in,2)^op2(in,1);
end
endfunction

function [0:7]mb0b(input [0:7]in);
begin
mb0b=op2(in,3)^op2(in,1)^in;
end
endfunction

function [0:7]mb0d(input [0:7]in);
begin
mb0d=op2(in,3)^op2(in,2)^in;
end
endfunction

function [0:7]mb09(input [0:7]in);
begin
mb09=op2(in,3)^in;
end
endfunction



function [0:7]op2(input [0:7]in,input integer n);
integer i;
begin

for(i=0;i<n;i=i+1)
begin
if(in[0]) in=(in<<1)^(8'h1b);
else in=in<<1;
end

op2=in;

end
endfunction

endmodule
