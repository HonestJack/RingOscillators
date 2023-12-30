//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.07.2023 10:51:33
// Design Name: 
// Module Name: OscillatorModule
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

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

	(* keep = "true" *) wire [N-1:0] notGate /* synthesis syn_keep=1 */;
	
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
		
		output reg and_1   /*synthesis keep*/
	);
//
	(* dont_touch = "true" *) reg [N-1:0] notGate /* synthesis syn_keep=1 */;
	
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

module OscillatorModule
	(
		input en,
		output run,
		output out3, out5, out7, out101, out1001, out4999, out1001_M
	);
	
	assign run = en;
	
	// RingOscillatorBase #(.N(3)) ring3(en, out3);
	// RingOscillatorBase #(.N(5)) ring5(en, out5);
	// RingOscillatorBase #(.N(7)) ring7(en, out7);
	// RingOscillatorBase #(.N(101)) ring101(en, out101);
	RingOscillatorBase #(.N(1001)) ring1001(en, out1001);
	RingOscillatorBase #(.N(4999)) ring4999(en, out4999);
	// RingOscillatorModule #(.N(1001)) ring1001_M(en, out1001_M);
endmodule

