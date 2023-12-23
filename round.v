`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2023 10:33:29
// Design Name: 
// Module Name: round
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



module round(in,key,out);
input [0:127]in,key;
output [0:127]out;
wire [0:127] inv_shift_res,inv_sub_res,add_res;
inv_shift_rows duv1(in,inv_shift_res);
inv_sub_bytes duv2(inv_shift_res,inv_sub_res);
AddRoundKey duv3(inv_sub_res,key,add_res);
inv_mixcol duv4(add_res,out);

endmodule
