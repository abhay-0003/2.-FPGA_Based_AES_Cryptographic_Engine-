`timescale 1ns / 1ps

module decryption(clk,datain,dataout);

    input clk;
    input [127:0] datain;
    //input [127:0] key;
    output  [127:0] dataout;
    
    wire [127:0] key;
    assign key = 128'h000102030405060708090a0b0c0d0e0f;
    wire [127:0] r0_out;
    wire [127:0] r1_out,r2_out,r3_out,r4_out,r5_out,r6_out,r7_out,r8_out,r9_out;
    
    wire [127:0] keyout1,keyout2,keyout3,keyout4,keyout5,keyout6,keyout7,keyout8,keyout9,keyout10;
    
    KeyGeneration k1(.rc(4'b0000),.keyin(key),.keyout(keyout1));
    KeyGeneration k2(.rc(4'b0001),.keyin(keyout1),.keyout(keyout2));
    KeyGeneration k3(.rc(4'b0010),.keyin(keyout2),.keyout(keyout3));
    KeyGeneration k4(.rc(4'b0011),.keyin(keyout3),.keyout(keyout4));
    KeyGeneration k5(.rc(4'b0100),.keyin(keyout4),.keyout(keyout5));
    KeyGeneration k6(.rc(4'b0101),.keyin(keyout5),.keyout(keyout6));
    KeyGeneration k7(.rc(4'b0110),.keyin(keyout6),.keyout(keyout7));
    KeyGeneration k8(.rc(4'b0111),.keyin(keyout7),.keyout(keyout8));
    KeyGeneration k9(.rc(4'b1000),.keyin(keyout8),.keyout(keyout9));
    KeyGeneration k10(.rc(4'b1001),.keyin(keyout9),.keyout(keyout10));
	 
	 assign r0_out = datain^keyout10;
	 
    rounds r1(.clk(clk),.data(r0_out),.keyout(keyout9),.rndout(r1_out));
    rounds r2(.clk(clk),.data(r1_out),.keyout(keyout8),.rndout(r2_out));
    rounds r3(.clk(clk),.data(r2_out),.keyout(keyout7),.rndout(r3_out));
    rounds r4(.clk(clk),.data(r3_out),.keyout(keyout6),.rndout(r4_out));
    rounds r5(.clk(clk),.data(r4_out),.keyout(keyout5),.rndout(r5_out));
    rounds r6(.clk(clk),.data(r5_out),.keyout(keyout4),.rndout(r6_out));
    rounds r7(.clk(clk),.data(r6_out),.keyout(keyout3),.rndout(r7_out));
    rounds r8(.clk(clk),.data(r7_out),.keyout(keyout2),.rndout(r8_out));
    rounds r9(.clk(clk),.data(r8_out),.keyout(keyout1),.rndout(r9_out));
    rounndlast r10(.clk(clk),.rin(r9_out),.keyout(key),.fout(dataout));
    
endmodule
