module fpadder(output logic [31:0] sum, output logic ready,
			    input logic [31:0] a, input logic clock, nreset);

	enum {Init, wait_ready, add, normalize} Present_State, Next_State;
			
	always_ff @(posedge clock, negedge nreset)
		begin: seq
			if (~nreset)
				Present_State <= Init;
			else
				Present_State <= Next_State;
		end
		
	always_comb
		begin: COM
			ready = '0;
			
			unique case(Present_State)
				Init:	begin
							Next_State = wait_ready;
						end
		end
endmodule