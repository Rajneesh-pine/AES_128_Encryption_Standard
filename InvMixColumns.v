module InvMixColumns(
    input [127:0] state_in,
    output [127:0] state_out
);

    // Function for byte multiplication with 3
    function [7:0] multiply(input [7:0] x, input integer n);
        integer i;
        begin
            for (i = 0; i < n; i = i + 1) begin
                if (x[7] == 1) x = ((x << 1) ^ 8'h1b);
                else x = x << 1;
            end
            multiply = x;
        end
    endfunction

    // MixColumns multiplication functions for specific coefficients
    function [7:0] mb0e(input [7:0] x);
        mb0e = multiply(x, 3) ^ multiply(x, 2) ^ multiply(x, 1);
    endfunction

    function [7:0] mb0d(input [7:0] x);
        mb0d = multiply(x, 3) ^ multiply(x, 2) ^ x;
    endfunction

    function [7:0] mb0b(input [7:0] x);
        mb0b = multiply(x, 3) ^ multiply(x, 1) ^ x;
    endfunction

    function [7:0] mb09(input [7:0] x);
        mb09 = multiply(x, 3) ^ x;
    endfunction

    // Column-wise MixColumns operation
    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : m_col
            assign state_out[(i * 32 + 24) +: 8] = mb0e(state_in[(i * 32 + 24) +: 8]) ^ mb0b(state_in[(i * 32 + 16) +: 8]) ^ mb0d(state_in[(i * 32 + 8) +: 8]) ^ mb09(state_in[i * 32 +: 8]);
            assign state_out[(i * 32 + 16) +: 8] = mb09(state_in[(i * 32 + 24) +: 8]) ^ mb0e(state_in[(i * 32 + 16) +: 8]) ^ mb0b(state_in[(i * 32 + 8) +: 8]) ^ mb0d(state_in[i * 32 +: 8]);
            assign state_out[(i * 32 + 8) +: 8] = mb0d(state_in[(i * 32 + 24) +: 8]) ^ mb09(state_in[(i * 32 + 16) +: 8]) ^ mb0e(state_in[(i * 32 + 8) +: 8]) ^ mb0b(state_in[i * 32 +: 8]);
            assign state_out[i * 32 +: 8] = mb0b(state_in[(i * 32 + 24) +: 8]) ^ mb0d(state_in[(i * 32 + 16) +: 8]) ^ mb09(state_in[(i * 32 + 8) +: 8]) ^ mb0e(state_in[i * 32 +: 8]);
        end
    endgenerate

endmodule
