`timescale 1ns/1ps

// 4-bit AND gate
module and4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] y
);
    assign y = a & b;
endmodule

// 4-bit NAND gate
module nand4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] y
);
    assign y = ~(a & b);
endmodule

// 4-bit OR gate
module or4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] y
);
    assign y = a | b;
endmodule

// 4-bit NOR gate
module nor4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] y
);
    assign y = ~(a | b);
endmodule

// 4-bit XOR gate
module xor4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] y
);
    assign y = a ^ b;
endmodule

// 4-bit XNOR gate
module xnor4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    output wire [3:0] y
);
    assign y = ~(a ^ b);
endmodule

// 4-bit NOT gate
module not4 (
    input  wire [3:0] a,
    output wire [3:0] y
);
    assign y = ~a;
endmodule
