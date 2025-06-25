`timescale 1ns / 1ps

module rounds(clk,data,keyout,rndout);
input clk;
input [127:0]data;
input [127:0]keyout;
output [127:0]rndout;

wire [127:0] isb,isr,imcl;
wire [127:0] addkey;
inv_shiftrow t0(data,isr);
inv_subbytes t1(isr,isb);
assign addkey = keyout^isb;
inv_mixcolumns t2(.state_in(addkey),.state_out(imcl));
assign rndout = imcl;

endmodule

