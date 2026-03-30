`timescale 1ns/1ps

// 2x4-bit input / 2x4-bit output Arithmetic Shifter
// Based on the description, this is a barrel shifter.
// S=00: y=a
// S=01: y=a <<< 1 (logical left shift)
// S=10: y=a >>> 1 (logical right shift)
// S=11: y=a >> 1 (arithmetic right shift)
module ashifter4 (
    input  wire [3:0] a,
    input  wire [1:0] s,
    output wire [3:0] y
);
    reg [3:0] y_reg;

    always @(*) begin
        case (s)
            2'b00: y_reg = a;
            2'b01: y_reg = a << 1;
            2'b10: y_reg = a >> 1;
            2'b11: y_reg = {a[3], a[3:1]}; // Arithmetic shift right
            default: y_reg = 4'bxxxx;
        endcase
    end

    assign y = y_reg;
endmodule
