
`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 09:30:54 PM
// Design Name: 
// Module Name: Top_tb
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


module tb_Top();

logic [3:0] clk;
logic clk100,clk100_90,clkEvt,clk_180,clk_270;
logic pin_in,ena;
logic pin_out;
logic [1:0] addrb;

Top DUT_Top(
    .addrb(addrb),
    .clkEvent(clkEvt),
    .clk100(clk100),
    .clk100_90(clk100_90),
    .pin_in(pin_in),
    .ena(ena),
    .pin_out(pin_out));


time t_time;
parameter T_Serdes = 10ns;
parameter T_mainClk = 100ns;
    
initial  begin : initial_block
    clk100=0; clk100_90=0; pin_in=0;addrb=0;
    #500ns addrb=1;
    #500ns addrb=2;
    #500ns addrb=3;
    #500ns addrb=0;
    #500ns addrb=1;
    #500ns addrb=2;
    #500ns addrb=3;
end

initial begin : clk100_block
     forever #(T_Serdes/2) begin clk100 <= ~clk100; clk_180 = ~ clk100;  end
    end : clk100_block
initial begin : clk100_90_block
 #(T_Serdes/4);
 forever #(T_Serdes/2) begin clk100_90 <= ~clk100_90; clk_270 = ~ clk100_90; end 
end 
initial begin : clkEvt_block
     forever #(T_mainClk/2) clkEvt <= ~clkEvt;
    end : clkEvt_block

initial begin 
    pin_in =0; clkEvt =1; clk100 =1; clk100_90 =1; ena=1; clk_180=1; clk_270 =1;
end 

always@(*) begin
    clk = {clk_270,clk_180,clk100_90,clk100};
end

always@(posedge clkEvt) 
    begin
        t_time = $urandom_range(5000,20000);
        #(t_time); pin_in =1; #50ns; pin_in =0;
    end
endmodule