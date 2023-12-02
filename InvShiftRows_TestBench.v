module InvShiftRows_TestBench;
  reg [127:0] in;
  wire [127:0] out;

  InvShiftRows m(in, out);

  initial begin
    $monitor("input = %H, output = %h", in, out);
    in = 128'h7ad5fda789ef4e272bca100b3d9ff59f;
    #10; // Delay to allow the simulation to run
    $finish; // End simulation
  end
endmodule
