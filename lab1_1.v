module lab1_1 (a, b, c, sub, d, e);
input a, b, c;
input sub;
output d, e;
reg xor1, and1, and2;
reg d, e;
// add your design here

always@* begin
    case(sub)
        1'b0: begin
            xor1 = a ^ b;
            d = xor1 ^ c;
            and1 = xor1 & c;
            and2 = a & b;
            e = and1 | and2; 
        end
        1'b1: begin
            xor1 = a ^ ~b;
            d = xor1 ^ c;
            and1 = xor1 & c;
            and2 = a & ~b;
            e = and1 | and2;
        end
        default: begin
        end
    endcase
           
end

endmodule