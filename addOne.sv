`timescale 1ns / 1ps


(* dont_touch = "yes" *)
module addOne #(parameter DINA_WIDTH = 32,parameter WIDTH = 3)
                (clk100,enable,iData,shEnable,oDataAddOne);
                   
input   logic clk100;
input   logic enable;
input   logic [DINA_WIDTH-1:0] iData;
output  logic shEnable;
output  logic [DINA_WIDTH-1:0] oDataAddOne;
        
    reg [WIDTH-1:0] shreg;
    
    assign shEnable = shreg[WIDTH-1];
    always @(posedge clk100)
        begin
            shreg = {shreg[WIDTH-2:0], enable};
        end

    always@(posedge shEnable)
        begin
            oDataAddOne = iData+1;
        end
endmodule
