`timescale 1ns/1ps

module tb_nand1;

  reg a, b;
  wire y;

  integer errors;

  nand1 dut (.a(a), .b(b), .y(y));

  task check;
    input [255:0] label;
    input got;
    input exp;
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

    $dumpfile("waves/nand1.vcd");
    $dumpvars(0, tb_nand1);

    a=0; b=0; #5; check("NAND 0,0", y, 1);
    a=0; b=1; #5; check("NAND 0,1", y, 1);
    a=1; b=0; #5; check("NAND 1,0", y, 1);
    a=1; b=1; #5; check("NAND 1,1", y, 0);

    if (errors == 0) $display("NAND1: ALL TESTS PASSED ✅");
    else             $display("NAND1: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule