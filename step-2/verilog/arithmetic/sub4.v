`timescale 1ns/1ps

// 4-bit Subtractor with borrow out
module sub4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] y,
    output wire       bout
);
    assign {bout, y} = a - b;
endmodule
