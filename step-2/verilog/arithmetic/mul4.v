`timescale 1ns/1ps

// 4-bit Multiplier
module mul4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [7:0] y
);
    assign y = a * b;
endmodule
