`timescale 1ns / 1ps

module inv_subbytes(isr,isb);

input [127:0] isr;
output [127:0] isb;

     inv_sbox q0( .a(isr[127:120]),.c(isb[127:120]) );
     inv_sbox q1( .a(isr[119:112]),.c(isb[119:112]) );
     inv_sbox q2( .a(isr[111:104]),.c(isb[111:104]) );
     inv_sbox q3( .a(isr[103:96]),.c(isb[103:96]) );
     
     inv_sbox q4( .a(isr[95:88]),.c(isb[95:88]) );
     inv_sbox q5( .a(isr[87:80]),.c(isb[87:80]) );
     inv_sbox q6( .a(isr[79:72]),.c(isb[79:72]) );
     inv_sbox q7( .a(isr[71:64]),.c(isb[71:64]) );
     
     inv_sbox q8( .a(isr[63:56]),.c(isb[63:56]) );
     inv_sbox q9( .a(isr[55:48]),.c(isb[55:48]) );
     inv_sbox q10(.a(isr[47:40]),.c(isb[47:40]) );
     inv_sbox q11(.a(isr[39:32]),.c(isb[39:32]) );
     
     inv_sbox q12(.a(isr[31:24]),.c(isb[31:24]) );
     inv_sbox q13(.a(isr[23:16]),.c(isb[23:16]) );
     inv_sbox q14(.a(isr[15:8]),.c(isb[15:8]) );
     inv_sbox q16(.a(isr[7:0]),.c(isb[7:0]) );
	  
endmodule

