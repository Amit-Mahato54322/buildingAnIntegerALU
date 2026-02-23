`timescale 1ns/1ps

// Step-1 requirement: 1x4-bit input / 1x4-bit output Arithmetic Shift Circuit
// We choose: arithmetic RIGHT shift by 1 (sign-extend MSB).
// Example: A=1011 -> Y=1101
module ashift4_by1 (
    input  wire [3:0] a,
    output wire [3:0] y
);
    assign y = {a[3], a[3:1]};
endmodule