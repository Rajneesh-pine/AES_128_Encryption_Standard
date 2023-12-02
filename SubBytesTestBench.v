module SubBytesTestBench;
  reg [127:0] in;
  wire [127:0] out;

  SubBytes sb(in, out);

  initial begin
    // Test for 128-bit SubBytes
    $monitor("input = %h, output = %h", in, out);

    in = 128'h193de3bea0f4e22b9ac68d2ae9f84808;
    #10;

    in = 128'ha49c7ff2689f352b6b5bea43026a5049;
    #10;

    in = 128'haa8f5f0361dde3ef82d24ad26832469a;
    #10;

    $finish;
  end
endmodule
