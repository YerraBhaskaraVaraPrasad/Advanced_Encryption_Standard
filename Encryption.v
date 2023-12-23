`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.10.2023 11:32:51
// Design Name: 
// Module Name: encryption
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


module Encryption #(parameter Nr=10,parameter Ns=4,parameter N=128)(in,key,out);

input [0:127]in,key;
output [0:127] out;



wire [0:(((Nr+1)*N)-1)]full_keys;

wire [0:127]state[0:Nr-1];
wire [0:127]sub_res,shift_res;

KeyExpansion dut1(key,full_keys);
AddRoundKey dut2(in,key,state[0]);

genvar i;
generate
for(i=1;i<Nr;i=i+1)
begin:rounds
round dut3(state[i-1],full_keys[(i*N)+:128],state[i]);
end:rounds
endgenerate

SubBytes dut4(state[Nr-1],sub_res);
ShiftRows dut5(sub_res,shift_res);
AddRoundKey dut6(shift_res,full_keys[(Nr*N)+:128],out);

endmodule
