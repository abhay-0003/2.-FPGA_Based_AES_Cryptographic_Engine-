`timescale 1ns / 1ps

module inv_shiftrow(data,isr);

input [127:0] data;
output [127:0] isr;

assign         isr[127:120] = data[127:120];  
assign         isr[119:112] = data[23:16];
assign         isr[111:104] = data[47:40];
assign         isr[103:96] = data[71:64];
   
assign          isr[95:88] = data[95:88];
assign          isr[87:80] = data[119:112];
assign          isr[79:72] = data[15:8];
assign          isr[71:64] = data[39:32];
   
assign          isr[63:56] = data[63:56];
assign          isr[55:48] = data[87:80];
assign          isr[47:40] = data[111:104];
assign          isr[39:32] = data[7:0];
   
assign          isr[31:24] = data[31:24];
assign          isr[23:16] = data[55:48];
assign          isr[15:8] = data[79:72];
assign          isr[7:0] = data[103:96]; 


endmodule

