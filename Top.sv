`timescale 1ns / 1ps




module Top( clk100,clk100_90,clkEvent,pin_in,ena,addrb,pin_out);
    input clk100,clk100_90,clkEvent;
    input pin_in,ena;
    input  [1:0] addrb;
    output pin_out;


wire wEnable,wShEnable;
wire[1:0] wAddrA;
wire[3:0] wISER_BITS;
(* dont_touch = "yes" *) wire[31:0] wDouta,w_dob,wDataAddOne;

serDes inst_serDes(
    .pin_in(pin_in), 
    .pin_out(pin_out),  
    .clk100(clk100),  
    .clk100_90(clk100_90),  
    .ISER_BITS(wISER_BITS));                 

decoder inst_decoder(
    .clk100(clk100),
    .ISER_BITS(wISER_BITS),
    .enable(wEnable),                 
    .AddrA(wAddrA));                     

blk_mem_gen_0 your_instance_name (
    .clka(clk100),    // input wire clka
    .ena(ena),      // input wire ena
    .wea(wShEnable),      // input wire [0 : 0] wea
    .addra(wAddrA),  // input wire [1 : 0] addra
    .dina(wDataAddOne),    // input wire [31 : 0] dina
    .douta(wDouta),  // output wire [31 : 0] douta
    .clkb(clk100),    // input wire clkb
    .enb(1),      // input wire enb
    .web(0),      // input wire [0 : 0] web
    .addrb(addrb),  // input wire [1 : 0] addrb
    .dinb(0),    // input wire [31 : 0] dinb
    .doutb(w_dob));  // output wire [31 : 0] doutb

addOne inst_addOne (
    .clk100(clk100),
    .enable(wEnable),
    .iData(wDouta),
    .shEnable(wShEnable),
    .oDataAddOne(wDataAddOne));

mainCounter inst_mainCounter(
    .clk(clkEvent),
    .reset(0),
    .count());
    
preciseCount inst_preciseCount(
    .clkEvent(clkEvent),
    .clk(clk100),
    .reset(wEnable),
    .count());

endmodule
