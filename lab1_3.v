module lab1_3 (a, b, aluctr, d);
input [3:0] a,b;
input [1:0] aluctr;
output [3:0] d;
reg sub;
wire [3:0] out;

lab1_2 aluu(.a(a),.b(b),.sub(sub),.d(out));

always@* begin
    case(aluctr)
        2'b00: begin
            sub = 1'b0;
        end
        2'b01: begin
            sub = 1'b1;
        end
        2'b10: begin
            sub = 2'd2;
        end
        default: begin
            sub = 2'd2;
        end
    endcase
end

assign d = (aluctr == 2'b00 || aluctr == 2'b01) ? out : (aluctr == 2'b10) ? (a & b) : (a ^ b) ;


endmodule