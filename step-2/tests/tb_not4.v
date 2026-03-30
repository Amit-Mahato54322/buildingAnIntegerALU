`timescale 1ns/1ps

module tb_not4;

  reg [3:0] a;
  wire [3:0] y;

  integer errors;

  not4 dut (.a(a), .y(y));

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
    $dumpfile("waves/not4.vcd");
    $dumpvars(0, tb_not4);

    a = 4'b0101; #5; check4("~0101", y, 4'b1010);
    a = 4'b1100; #5; check4("~1100", y, 4'b0011);
    a = 4'b1111; #5; check4("~1111", y, 4'b0000);
    a = 4'b0000; #5; check4("~0000", y, 4'b1111);

    if (errors == 0) $display("NOT4: ALL TESTS PASSED ✅");
    else             $display("NOT4: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule
