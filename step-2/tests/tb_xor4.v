`timescale 1ns/1ps

module tb_xor4;

  reg [3:0] a, b;
  wire [3:0] y;

  integer errors;

  xor4 dut (.a(a), .b(b), .y(y));

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
    $dumpfile("waves/xor4.vcd");
    $dumpvars(0, tb_xor4);

    a = 4'b0101; b = 4'b1010; #5; check4("0101 ^ 1010", y, 4'b1111);
    a = 4'b1100; b = 4'b1001; #5; check4("1100 ^ 1001", y, 4'b0101);
    a = 4'b1111; b = 4'b1111; #5; check4("1111 ^ 1111", y, 4'b0000);
    a = 4'b0000; b = 4'b1111; #5; check4("0000 ^ 1111", y, 4'b1111);

    if (errors == 0) $display("XOR4: ALL TESTS PASSED ✅");
    else             $display("XOR4: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule
