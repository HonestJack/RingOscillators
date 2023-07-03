module RingOscillator3 (
   input  en,
	output reg out
   
);

	(* altera_attribute = {"-name SYNCHRONIZER_IDENTIFICATION FORCED_IF_ASYNCHRONOUS; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON;}  *)
	output reg not_3;
	(* altera_attribute = {"-name SYNCHRONIZER_IDENTIFICATION FORCED_IF_ASYNCHRONOUS; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON;}  *)
	output reg not_1;
	(* altera_attribute = {"-name SYNCHRONIZER_IDENTIFICATION FORCED_IF_ASYNCHRONOUS; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON;}  *)
   output reg not_2;
	(* altera_attribute = {"-name SYNCHRONIZER_IDENTIFICATION FORCED_IF_ASYNCHRONOUS; -name DONT_MERGE_REGISTER ON; -name PRESERVE_REGISTER ON;}  *)
   output reg and_1;
	
	always @ (*)
	begin
		 and_1 <= en & not_3;
		 not_1 <= ~and_1;
		 not_2 <= ~not_1;
		 not_3 <= ~not_2;
		 out <= not_3;
	end

endmodule


module RingOscillator5 (
   input  en,
   output reg not_1 /*synthesis keep*/,
				  not_2 /*synthesis keep*/,
              not_3 /*synthesis keep*/,
				  not_4 /*synthesis keep*/,
				  not_5 /*synthesis keep*/,
              and_1 /*synthesis keep*/
);

	always @ (*)
	begin
		 and_1 <= en & not_5;
		 not_1 <= ~and_1;
		 not_2 <= ~not_1;
		 not_3 <= ~not_2;
		 not_4 <= ~not_3;
		 not_5 <= ~not_4;
	end

endmodule


module RingOscillator (
   input  en3, en5,
	
   output out3,
				  
	output not5_1 /*synthesis keep*/,
				  not5_2 /*synthesis keep*/,
              not5_3 /*synthesis keep*/,
				  not5_4 /*synthesis keep*/,
				  not5_5 /*synthesis keep*/,
              and5_1 /*synthesis keep*/
);

	RingOscillator3 ring3 (en3, out3);
	
	RingOscillator5 ring5 (en5, not5_1, not5_2, not5_3, not5_4, not5_5, and5_1);

endmodule