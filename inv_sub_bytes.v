`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2023 13:13:48
// Design Name: 
// Module Name: inv_sub_bytes
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


module inv_sub_bytes(in,out);
input [0:127]in;
output [0:127]out;

genvar i;
generate
for(i=0;i<127;i=i+8)
begin
inv_sbox dut(in[i+:8],out[i+:8]);
end
endgenerate

endmodule
