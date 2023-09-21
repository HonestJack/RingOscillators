module inverter
	(
		input in,
		output out
	);
	
	assign out = ~in;
	
endmodule

module RingOscillatorModule 
	#(parameter N = 5)
	(
		input  en,
		
		output and_1
	);

	wire [N-1:0] notGate /* synthesis syn_keep=1 */;
	
	genvar i;
	generate
		assign and_1 = en & notGate[N-1];
		assign notGate[0] = ~and_1;
		for (i = 1; i < N; i = i +1) begin: inverter_chain
			inverter inv(notGate[i - 1], notGate[i]);
		end
	endgenerate
endmodule

module RingOscillatorBase 
	#(parameter N = 5)
	(
		input  en,
		
		output reg and_1
	);

	reg [N-1:0] notGate /* synthesis syn_keep=1 */;
	
	integer i;
	generate
	always @ (*) begin
			and_1 <= en & notGate[N-1];
			notGate[0] <= ~and_1;
			for (i = 1; i < N; i = i +1) begin: inverter_chain
				notGate[i] <= ~notGate[i - 1];
			end
	end
	endgenerate
endmodule

module RingOscillatorGenerate
	(
		input en,
		output run,
		output out3, out5, out7, out101, out1001, out4999, out1000, out1001_M
	);
	
	OSCH #(.NOM_FREQ("133.00")) rc_oscillator(.STDBY(1'b0), .OSC(fpga_clock));
	
	assign run = en;
	
	//RingOscillatorBase #(.N(3)) ring3(en, out3);
	//RingOscillatorBase #(.N(5)) ring5(en, out5);
	RingOscillatorBase #(.N(7)) ring7(en, out7);
	//RingOscillatorBase #(.N(101)) ring101(en, out101);
	RingOscillatorBase #(.N(1001)) ring1001(en, out1001);
	//RingOscillatorBase #(.N(1000)) ring1000(en, out1000);
	//RingOscillatorModule #(.N(1001)) ring1001_M(en, out1001_M);
	RingOscillatorBase #(.N(2999)) ring4999(en, out4999);
endmodule
