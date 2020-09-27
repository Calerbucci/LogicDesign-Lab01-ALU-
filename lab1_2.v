`timescale 1ns/100ps

module lab1_2 (a, b, sub, d);
input[3:0] a, b;
input sub;
output[3:0] d;
// add your design here
wire e[3:0];
// add your design here

lab1_1 full_adder1(.e(e[0]),.d(d[0]),.a(a[0]),.b(b[0]),.c(sub),.sub(sub));
lab1_1 full_adder2(.e(e[1]),.d(d[1]),.a(a[1]),.b(b[1]),.c(e[0]),.sub(sub));
lab1_1 full_adder3(.e(e[2]),.d(d[2]),.a(a[2]),.b(b[2]),.c(e[1]),.sub(sub));
lab1_1 full_adder4(.e(e[3]),.d(d[3]),.a(a[3]),.b(b[3]),.c(e[2]),.sub(sub));

           
endmodule