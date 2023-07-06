module inverter
	(
		input in,
		output out
	);
	
	assign out = ~in;
	
//	always @ (*) begin
//		out <= ~in;
//	end
	
endmodule

module RingOscillatorBase 
	#(parameter N = 5)
	(
		input  en,
		
		output reg and_1   /*synthesis keep*/
	);

	reg [N-1:0] notGate /*synthesis keep*/;
	
	integer i;
	generate
		always @ (*) begin
			and_1 <= en & notGate[N-1];
			notGate[0] <= ~and_1;
			for (i = 1; i < N; i = i +1) begin
				notGate[i] <= ~notGate[i - 1];
				//inverter inv(notGate[i - 1], notGate[i]);
			end
		end
	endgenerate
endmodule

module RingOscillatorGenerate
	(
		input en,
		output run,
		output out3, out5, out7, out101, out1001, out4999
	);
	
	assign run = en;
	
	RingOscillatorBase #(.N(3)) ring3(en, out3);
	RingOscillatorBase #(.N(5)) ring5(en, out5);
	RingOscillatorBase #(.N(7)) ring7(en, out7);
	RingOscillatorBase #(.N(101)) ring101(en, out101);
	RingOscillatorBase #(.N(1001)) ring1001(en, out1001);
	RingOscillatorBase #(.N(4999)) ring4999(en, out4999);
endmodule
