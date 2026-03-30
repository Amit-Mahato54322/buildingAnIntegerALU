`timescale 1ns/1ps

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
