module InvSubBytes_TestBench;
  reg [127:0] in;
  wire [127:0] out;

  InvSubBytes isb(in, out);

  initial begin
    $monitor("input = %h, output = %h", in, out);
    in = 128'h7a9f102789d5f50b2beffd9f3dca4ea7;
    #10; // Delay to allow the simulation to run
    $finish; // End simulation
  end
endmodule
