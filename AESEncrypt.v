module AESEncrypt#(parameter N=128,parameter Nr=10,parameter Nk=4)(in,key,out);
input [127:0] in;
input [N-1:0] key;
output [127:0] out;
wire [(128*(Nr+1))-1 :0] fullkeys;
wire [127:0] states [Nr+1:0] ;
wire [127:0] afterSubBytes;
wire [127:0] afterShiftRows;

keyExpansion #(Nk,Nr) ke (key,fullkeys);

AddRKey addrk1 (in,states[0],fullkeys[((128*(Nr+1))-1)-:128]);

genvar i;
generate
	
	for(i=1; i<Nr ;i=i+1)begin : loop
		encryptRound er(states[i-1],fullkeys[(((128*(Nr+1))-1)-128*i)-:128],states[i]);
		
		end
		SubBytes sb(states[Nr-1],afterSubBytes);
		ShiftRows sr(afterSubBytes,afterShiftRows);
		AddRKey addrk2(afterShiftRows,states[Nr],fullkeys[127:0]);
			assign out=states[Nr];

endgenerate
endmodule