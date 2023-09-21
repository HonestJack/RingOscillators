`timescale 1ns / 1ns

module testbench;
	reg en;
	wire run, out3, out5, out7, out101, out1001, out4999, out1000, out1001_M;
	
	
	RingOscillatorGenerate osc(.en(en), .run(run), .out3(out3), .out5(out5), .out7(out7), .out101(out101), .out1001(out1001), .out1000(out1000), .out4999(out4999), .out1001_M(out1001_M));

	initial
	begin
		en = 0;
		#1000
		en = 1;
		#1000000000
		$finish;
	end


endmodule
	