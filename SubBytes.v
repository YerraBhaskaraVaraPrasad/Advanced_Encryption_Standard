`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2023 16:50:14
// Design Name: 
// Module Name: SubBytes
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


module SubBytes(in,out);
input [0:127]in;
output [0:127]out;
genvar i;
generate
for(i=0;i<16;i=i+1)
begin
sbox s(in[(i*8)+:8],out[(i*8)+:8]);
end
endgenerate

endmodule
