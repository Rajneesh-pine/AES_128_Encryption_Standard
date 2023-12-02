module AESDriverTestBench();

  reg enable;
  wire e128, d128;
  reg [127:0] plaintext;  // Assuming 128-bit plaintext input

  // Instantiate the AESDriver module
  AESDriver a(enable, plaintext, e128, d128);

  initial begin
    // Monitor relevant signals
    $monitor("Enable = %b, Encrypt128 = %b, Decrypt128 = %b", enable, e128, d128);

    // Test case 1: Enable AES
    enable = 1;
    plaintext = 128'h00112233445566778899aabbccddeeff;
    #10;

    // Test case 2: Disable AES
    enable = 0;
    #10;

    // Test case 3: Re-enable AES
    enable = 1;
    plaintext = 128'h00112233445566778899aabbccddeeff;  // Set plaintext for the next test
    #10;

    // Add more test cases as needed

    // End simulation
    $finish;
  end

endmodule
