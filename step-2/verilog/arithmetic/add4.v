`timescale 1ns/1ps

// 4-bit Adder with carry in and carry out
module add4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       cin,
    output wire [3:0] y,
    output wire       cout
);
    assign {cout, y} = a + b + cin;
endmodule
