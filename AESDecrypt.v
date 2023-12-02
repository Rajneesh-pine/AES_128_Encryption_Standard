module AESDecrypt#(parameter N=128,parameter Nr=10,parameter Nk=4)(in,key,out);
input [127:0] in;
input [N-1:0] key;
output [127:0] out;
wire [(128*(Nr+1))-1 :0] fullkeys;
wire [127:0] states [Nr+1:0] ;
wire [127:0] afterSubBytes;
wire [127:0] afterShiftRows;

keyExpansion #(Nk,Nr) ke (key,fullkeys);

AddRKey addrk1 (in,states[0],fullkeys[127:0]);

genvar i;
generate
	
	for(i=1; i<Nr ;i=i+1)begin : loop
		DecryptRound dr(states[i-1],fullkeys[i*128+:128],states[i]);
		
		end
		InvShiftRows sr(states[Nr-1],afterShiftRows);
		InvSubBytes sb(afterShiftRows,afterSubBytes);
		AddRKey addrk2(afterSubBytes,states[Nr],fullkeys[((128*(Nr+1))-1)-:128]);
			assign out=states[Nr];

endgenerate
endmodule
