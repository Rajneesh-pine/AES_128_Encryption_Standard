module AESDecryptTestBench;
  reg [127:0] in1;
  wire [127:0] out1;
  reg [127:0] key1;

  AESDecrypt a(in1, key1, out1);

  initial begin
    // Test for 128-bit AES
    $monitor("in128 = %h, key128 = %h, out128 = %h", in1, key1, out1);
    
    in1 = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
    key1 = 128'h000102030405060708090a0b0c0d0e0f;

    #10;
  end
endmodule
