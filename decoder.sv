`timescale 1ns / 1ps


(* dont_touch = "yes" *)
module decoder(clk100,ISER_BITS,enable,AddrA);
    input  logic clk100;
    input  logic [3:0] ISER_BITS;
    output logic enable;
    output logic [1:0] AddrA;
   
   reg[1:0] r_AddrA; 
      
    always@(*) begin
        case(ISER_BITS)
            4'b0000 : enable = 0; 
            default : enable = 1;
        endcase
    end
   
    always@(posedge enable) 
        begin
            case(ISER_BITS)
                4'b0001 : begin r_AddrA = 0; end//q1
                4'b0101 : begin r_AddrA = 0; end//q1
                4'b0111 : begin r_AddrA = 0; end//q1
                4'b1111 : begin r_AddrA = 0; end//q1
                //   
                4'b0100 : begin r_AddrA = 1; end//q3
                4'b0110 : begin r_AddrA = 1; end//q3                               
                4'b1110 : begin r_AddrA = 1; end//q3
                //   
                4'b0010 : begin r_AddrA = 2; end//q2
                4'b1010 : begin r_AddrA = 2; end//q2
                //
                4'b1000 : begin r_AddrA = 3; end//q4
                    default : r_AddrA = r_AddrA;
            endcase
        end
       
    assign AddrA = r_AddrA;
    
endmodule