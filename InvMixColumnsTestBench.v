module InvMixColumnsTestBench;
    reg [0:127] in;
    wire [0:127] out;

    inverseMixColumns m(in, out);

    initial begin
        $monitor("input = %H, output = %h", in, out);
        in = 128'hbaa03de7a1f9b56ed5512cba5f414d23;
        #10;
        // You can add more test cases as needed
    end
endmodule
