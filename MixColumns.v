module MixColumns(state_in, state_out);
  input [127:0] state_in;
  output [127:0] state_out;

  function [7:0] mb2;
    input [7:0] x;
    begin
      if (x[7] == 1)
        mb2 = ((x << 1) ^ 8'h1b);
      else
        mb2 = x << 1;
    end
  endfunction

  function [7:0] mb3;
    input [7:0] x;
    begin
      mb3 = mb2(x) ^ x;
    end
  endfunction

  genvar i;

  generate
    for (i = 0; i < 16; i = i + 1) begin : m_col
      assign state_out[(i * 8 + 7) +: 1] = mb2(state_in[(i * 8 + 7) +: 1]) ^ mb3(state_in[(i * 8 + 6) +: 1]) ^ state_in[(i * 8 + 5) +: 1] ^ state_in[(i * 8 + 4) +: 1];
      assign state_out[(i * 8 + 6) +: 1] = state_in[(i * 8 + 7) +: 1] ^ mb2(state_in[(i * 8 + 6) +: 1]) ^ mb3(state_in[(i * 8 + 5) +: 1]) ^ state_in[(i * 8 + 4) +: 1];
      assign state_out[(i * 8 + 5) +: 1] = state_in[(i * 8 + 7) +: 1] ^ state_in[(i * 8 + 6) +: 1] ^ mb2(state_in[(i * 8 + 5) +: 1]) ^ mb3(state_in[(i * 8 + 4) +: 1]);
      assign state_out[(i * 8 + 4) +: 1] = mb3(state_in[(i * 8 + 7) +: 1]) ^ state_in[(i * 8 + 6) +: 1] ^ state_in[(i * 8 + 5) +: 1] ^ mb2(state_in[(i * 8 + 4) +: 1]);
    end
  endgenerate

endmodule
