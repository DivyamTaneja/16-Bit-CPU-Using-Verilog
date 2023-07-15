`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2023 23:49:24
// Design Name: 
// Module Name: MPU
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


module MPU(
    input wire clk, enable, reset,
    
    output reg [15:0] y,
    output reg zx, nx, zy, ny, f, no,
    
    output reg [9:0] PC_in,
    output reg [15:0] IR_in,
    input wire [9:0] PC_out, 
    input wire [15:0] IR_out,
    input wire [15:0] AC_out,
    
    output reg write,
    output reg [9:0] address_data,
    output reg [15:0] input_data,
    input wire [15:0] output_data
);

CPU cpu(.clk(clk), .y(y), .zx(zx), .nx(nx), .zy(zy), .ny(ny), .f(f), .no(no), .PC_in(PC_in), .IR_in(IR_in), .PC_out(PC_out), .IR_out(IR_out), .AC_out(AC_out));
MU mu(.clk(clk), .write(write), .address_data(address_data), .input_data(input_data), .output_data(output_data));

always @(posedge clk) begin
    if(reset==1'b1)
        PC_in = 10'd1023;
end

always @(posedge clk && enable==1'b1) begin
    PC_in = PC_in + 10'd1;
end

endmodule
