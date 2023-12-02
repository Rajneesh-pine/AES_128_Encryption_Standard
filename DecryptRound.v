module DecryptRound(
  input [127:0] in,
  input [127:0] key,
  output [127:0] out
);
  wire [127:0] afterSubBytes;
  wire [127:0] afterShiftRows;
  wire [127:0] afterMixColumns;
  wire [127:0] afterAddroundKey;

  // Inverse ShiftRows operation
  InvShiftRows r(in, afterShiftRows);
  
  // Inverse SubBytes operation
  InvSubBytes s(afterShiftRows, afterSubBytes);
  
  // AddRoundKey operation
  AddRKey b(afterSubBytes, afterAddroundKey, key);
  
  // Inverse MixColumns operation
  InvMixColumns m(afterAddroundKey, out);
		
endmodule
