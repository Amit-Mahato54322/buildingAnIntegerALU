`timescale 1ns/1ps

module tb_not1;

  reg a;
  wire y;

  integer errors;

  not1 dut (.a(a), .y(y));

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

    $dumpfile("waves/not1.vcd");
    $dumpvars(0, tb_not1);

    a = 0; #5; check("NOT a=0", y, 1);
    a = 1; #5; check("NOT a=1", y, 0);

    if (errors == 0) $display("NOT1: ALL TESTS PASSED ✅");
    else             $display("NOT1: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule