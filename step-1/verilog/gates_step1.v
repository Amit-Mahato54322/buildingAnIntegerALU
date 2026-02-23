`timescale 1ns/1ps

// 1-bit NOT gate
module not1 (
    input  wire a,
    output wire y
);
    assign y = ~a;
endmodule

// 1-bit NAND gate
module nand1 (
    input  wire a,
    input  wire b,
    output wire y
);
    assign y = ~(a & b);
endmodule

// 1-bit NOR gate
module nor1 (
    input  wire a,
    input  wire b,
    output wire y
);
    assign y = ~(a | b);
endmodule