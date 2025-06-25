`timescale 1ns / 1ps

module rounndlast(clk,rin,keyout,fout);
input clk;
input [127:0]rin;
input [127:0]keyout;
output [127:0]fout;

wire [127:0] isb,isr,mcl;

inv_shiftrow t2(rin,isr);
inv_subbytes t1(isr,isb);

assign fout= keyout^isb;

endmodule 
