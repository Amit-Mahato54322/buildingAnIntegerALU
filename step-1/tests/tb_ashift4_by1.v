`timescale 1ns/1ps

module tb_ashift4_by1;

  reg  [3:0] A;
  wire [3:0] Y;

  integer errors;

  ashift4_by1 dut (.a(A), .y(Y));

  task check4;
    input [255:0] label;
    input [3:0] got;
    input [3:0] exp;
    begin
      if (got !== exp) begin
        $display("FAIL: %s | got=%b exp=%b", label, got, exp);
        errors = errors + 1;
      end else begin
        $display("PASS: %s", label);
      end
    end
  endtask

  initial begin
    errors = 0;

    $dumpfile("waves/ashift4_by1.vcd");
    $dumpvars(0, tb_ashift4_by1);

    // Arithmetic RIGHT shift by 1: Y = {A[3], A[3:1]}

    A = 4'b0000; #5; check4("ASR1 A=0000", Y, 4'b0000);
    A = 4'b0001; #5; check4("ASR1 A=0001", Y, 4'b0000);
    A = 4'b0010; #5; check4("ASR1 A=0010", Y, 4'b0001);
    A = 4'b0101; #5; check4("ASR1 A=0101", Y, 4'b0010);
    A = 4'b0111; #5; check4("ASR1 A=0111", Y, 4'b0011);

    // MSB=1 sign-extension cases
    A = 4'b1000; #5; check4("ASR1 A=1000", Y, 4'b1100);
    A = 4'b1001; #5; check4("ASR1 A=1001", Y, 4'b1100);
    A = 4'b1011; #5; check4("ASR1 A=1011", Y, 4'b1101);
    A = 4'b1111; #5; check4("ASR1 A=1111", Y, 4'b1111);

    if (errors == 0) $display("ASHIFT4_BY1: ALL TESTS PASSED ✅");
    else             $display("ASHIFT4_BY1: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule