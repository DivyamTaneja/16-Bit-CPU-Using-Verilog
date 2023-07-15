`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2023 21:44:37
// Design Name: 
// Module Name: CPU
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


module CPU(
    input wire clk,
    
    input wire [15:0] y,
    input wire zx, nx, zy, ny, f, no,
    
    input wire [9:0] PC_in, 
    input wire [15:0] IR_in, 
    output reg [9:0] PC_out,
    output reg [15:0] IR_out,
    output reg [15:0] AC_out
);

wire [15:0] ALU_out;
wire zr, ng;
ALU Calc(.x(AC_out), .y(y), .zx(zx), .nx(nx), .zy(zy), .ny(ny), .f(f), .no(no), .o(ALU_out), .zr(zr), .ng(ng));

always @(posedge clk) begin
    IR_out = IR_in;
    PC_out = PC_in;
    AC_out = ALU_out;
end

endmodule
