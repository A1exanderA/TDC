`timescale 1ns / 1ps




(* dont_touch = "yes" *)
module preciseCount (clk,reset,count,clkEvent);
    input clk,reset,clkEvent;
    output reg [10:0] count;
    
    reg start;
    reg [3:0] r_count;
  
    always@(posedge clkEvent, posedge reset) 
        begin
            if(reset) start <= 0; 
            else start <= 1;
        end
 
    always@(posedge clk) 
        begin
            if(~start) r_count <= 1;
            else 
                begin 
                    r_count = r_count + 1;
                    count = r_count; 
                end
        end
endmodule 
