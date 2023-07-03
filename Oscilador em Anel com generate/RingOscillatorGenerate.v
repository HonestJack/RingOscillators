module inverter
	(
		input in,
		output reg out
	);
	
	always @ (*)
	begin
		out <= ~in;
	end
	
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
			for (i = 1; i < N; i = i +1)
			begin: inverter_chain
				//notGate[i] <= ~notGate[i - 1];
				inverter inv(notGate[i - 1], notGate[i]);
			end
		end
	endgenerate
endmodule

module RingOscillatorGenerate
	(
		input en,
		output out3, out5, out7
	);
	
	RingOscillatorBase #(.N(3)) ring3(en, out3);
	RingOscillatorBase #(.N(5)) ring5(en, out5);
	RingOscillatorBase #(.N(7)) ring7(en, out7);
endmodule
