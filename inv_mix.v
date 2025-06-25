`timescale 1ns / 1ps

module inv_mixcolumns(
    input  [127:0] state_in,
    output [127:0] state_out
);

    // GF(2^8) multiplication functions
    function [7:0] gmul_2;
        input [7:0] a;
        gmul_2 = (a[7]) ? ((a << 1) ^ 8'h1b) : (a << 1);
    endfunction

    function [7:0] gmul_3;
        input [7:0] a;
        gmul_3 = gmul_2(a) ^ a;
    endfunction

    function [7:0] gmul;
        input [7:0] a;
        input [7:0] b;
        reg [7:0] p;
        reg [7:0] hi_bit_set;
        integer i;
        begin
            p = 0;
            for (i = 0; i < 8; i = i + 1) begin
                if (b[0]) p = p ^ a;
                hi_bit_set = a[7];
                a = a << 1;
                if (hi_bit_set) a = a ^ 8'h1b;
                b = b >> 1;
            end
            gmul = p;
        end
    endfunction

    // Apply InvMixColumns to each of the 4 columns
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : col_loop
            wire [7:0] s0, s1, s2, s3;
            assign s0 = state_in[127 - (i*32) -: 8];
            assign s1 = state_in[119 - (i*32) -: 8];
            assign s2 = state_in[111 - (i*32) -: 8];
            assign s3 = state_in[103 - (i*32) -: 8];

            assign state_out[127 - (i*32) -: 8] = 
                gmul(s0, 8'h0e) ^ gmul(s1, 8'h0b) ^ gmul(s2, 8'h0d) ^ gmul(s3, 8'h09);
            assign state_out[119 - (i*32) -: 8] = 
                gmul(s0, 8'h09) ^ gmul(s1, 8'h0e) ^ gmul(s2, 8'h0b) ^ gmul(s3, 8'h0d);
            assign state_out[111 - (i*32) -: 8] = 
                gmul(s0, 8'h0d) ^ gmul(s1, 8'h09) ^ gmul(s2, 8'h0e) ^ gmul(s3, 8'h0b);
            assign state_out[103 - (i*32) -: 8] = 
                gmul(s0, 8'h0b) ^ gmul(s1, 8'h0d) ^ gmul(s2, 8'h09) ^ gmul(s3, 8'h0e);
        end
    endgenerate

endmodule

