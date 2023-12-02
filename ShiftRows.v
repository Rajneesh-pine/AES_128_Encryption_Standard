module ShiftRows (
  input [127:0] in,
  output [127:0] shifted
);

  // First row (r = 0) is not shifted
  assign shifted[0+:32] = in[0+:32];
  assign shifted[32+:32] = in[32+:32];
  assign shifted[64+:32] = in[64+:32];
  assign shifted[96+:32] = in[96+:32];
  
  // Second row (r = 1) is cyclically left shifted by 1 offset
  assign shifted[8+:32] = in[40+:32];
  assign shifted[40+:32] = in[72+:32];
  assign shifted[72+:32] = in[104+:32];
  assign shifted[104+:32] = in[8+:32];
  
  // Third row (r = 2) is cyclically left shifted by 2 offsets
  assign shifted[16+:32] = in[80+:32];
  assign shifted[48+:32] = in[112+:32];
  assign shifted[80+:32] = in[16+:32];
  assign shifted[112+:32] = in[48+:32];
  
  // Fourth row (r = 3) is cyclically left shifted by 3 offsets
  assign shifted[24+:32] = in[120+:32];
  assign shifted[56+:32] = in[24+:32];
  assign shifted[88+:32] = in[56+:32];
  assign shifted[120+:32] = in[88+:32];
endmodule
