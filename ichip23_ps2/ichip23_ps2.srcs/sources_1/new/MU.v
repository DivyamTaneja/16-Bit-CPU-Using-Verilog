`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2023 02:27:07
// Design Name: 
// Module Name: MU
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


module MU(
    input wire clk,
    
    input wire write,
    input wire [9:0] address_data,
    input wire [15:0] input_data,
    output wire [15:0] output_data
);

reg [15:0] memory[0:1023];

always @(posedge clk) begin
    if(write==1'b1)
        memory[address_data] = input_data;
end

assign output_data = memory[address_data];

endmodule
