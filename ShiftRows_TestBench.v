module ShiftRows_TestBench;

  reg [127:0] in;
  wire [127:0] out;
  reg clk;

  ShiftRows m (in, out);

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $monitor("input= %H , output= %h", in, out);
    
    // First test case
    in = 128'h_d42711ae_e0bf98f1_b8b45de5_1e415230;
    #10;

    // Second test case
    in = 128'h_49ded289_45db96f1_7f39871a_7702533b;
    #10;

    // Third test case
    in = 128'h_ac73cf7b_efc111df_13b5d6b5_45235ab8;
    
    #10; $finish;
  end
endmodule
