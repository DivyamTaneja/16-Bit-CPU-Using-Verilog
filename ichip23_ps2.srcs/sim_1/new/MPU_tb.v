`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2023 16:30:39
// Design Name: 
// Module Name: MPU_tb
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


module MPU_tb();

reg clk, reset;
reg [15:0] memory_in; wire read_write; wire [9:0] memory_address; wire [15:0] memory_out;
wire [9:0] PC; wire [15:0] IR; wire [15:0] AC;
wire return;
CPU cpu(.clk(clk), .reset(reset), .memory_in(memory_in), .read_write(read_write), .memory_address(memory_address), .memory_out(memory_out), .PC(PC), .IR(IR), .AC(AC), .return(return));

reg [15:0] memory[0:1023];
always @(posedge clk or negedge clk) begin
    if(clk==1'd0 && read_write==1'd0)
        memory_in = memory[memory_address];
    else if(clk==1'd1 && read_write==1'd1)
        memory[memory_address] = memory_out;
end

always begin
    #0.5; clk = ~clk;
end

initial begin
    clk = 1'd0;
    $readmemh("C:\\Users\\HP\\Desktop\\Vivado Codes\\ichip23\\ichip23_ps2\\Program.txt", memory, 0, 400);
    $readmemh("C:\\Users\\HP\\Desktop\\Vivado Codes\\ichip23\\ichip23_ps2\\Data.txt", memory, 401, 1023);
    reset = 1'd0; reset = 1'd1;
end

integer count = 0;
always @(posedge clk) begin
    count = count + 1;
    if(return==1'd0) begin
        $display("count=%d", count);
        $writememh("C:\\Users\\HP\\Desktop\\Vivado Codes\\ichip23\\ichip23_ps2\\Output.txt", memory, 401, 1023);
        $finish;
    end
end

endmodule
