module KeyExpansionTestBench;
  reg [127:0] k1;
  wire [1407:0] out1;

  KeyExpansion #(4, 10) ks(.key(k1), .w(out1));

  initial begin
    $monitor("k128= %h , out128= %h", k1, out1);
    k1 = 128'h2b7e151628aed2a6abf7158809cf4f3c;
  end
endmodule
