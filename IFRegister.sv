`timescale 1ns/1ns

module IFRegister(freeze, flush, rst, clk, instruction, PC, IFOutput, PCOut);

input clk, rst, flush, freeze;
input [31:0]instruction;
input [9:0]PC;

output reg [31:0]IFOutput;
output reg [9:0]PCOut;

always@(posedge clk)begin
	if(rst | flush)begin
		IFOutput <= 0;
		PCOut <= 0;
	end
	else if (!freeze)begin
		IFOutput <= instruction;
		PCOut <= PC;
	end
end

endmodule