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

// 4-bit Subtractor with borrow out
module sub4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] y,
    output wire       bout
);
    assign {bout, y} = a - b;
endmodule

// 4-bit Multiplier
module mul4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [7:0] y
);
    assign y = a * b;
endmodule

// 4-bit Divider
module div4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] y,
    output wire [3:0] rem
);
    assign y = a / b;
    assign rem = a % b;
endmodule
