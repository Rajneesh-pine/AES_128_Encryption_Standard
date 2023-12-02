module EncryptRound(
  input [127:0] in,
  input [127:0] key,
  output [127:0] out
);
  wire [127:0] afterSubBytes;
  wire [127:0] afterShiftRows;
  wire [127:0] afterMixColumns;
  wire [127:0] afterAddroundKey;

  // SubBytes operation
  SubBytes s(in, afterSubBytes);
  
  // ShiftRows operation
  ShiftRows r(afterSubBytes, afterShiftRows);
  
  // MixColumns operation
  MixColumns m(afterShiftRows, afterMixColumns);
  
  // AddRoundKey operation
  AddRKey b(afterMixColumns, out, key);
		
endmodule
