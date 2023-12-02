module InvShiftRows (
  input [127:0] in,
  output [127:0] shifted
);

  // First row (r = 0) is not shifted
  assign shifted[0+:32] = in[0+:32];

  // Second row (r = 1) is cyclically right shifted by 1 offset
  assign shifted[32+:32] = in[96+:32];
  
  // Third row (r = 2) is cyclically right shifted by 2 offsets
  assign shifted[64+:32] = in[64+:32];

  // Fourth row (r = 3) is cyclically right shifted by 3 offsets
  assign shifted[96+:32] = in[32+:32];

endmodule
