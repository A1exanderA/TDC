`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2023 11:04:00 AM
// Design Name: 
// Module Name: mainCounter
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

(* dont_touch = "yes" *)
module mainCounter (clk,reset,count);
    input clk,reset;
    output reg [31:0] count;

    always@(posedge clk) 
        begin
            if(reset)   count <= 1;
            else        count <= count + 1;
        end
endmodule 