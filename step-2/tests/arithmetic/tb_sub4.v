`timescale 1ns/1ps

module tb_sub4;

  reg [3:0] a, b;
  wire [3:0] y_sub;
  wire bout;
  integer errors;

  sub4 sub4_dut (.a(a), .b(b), .y(y_sub), .bout(bout));

  task check;
    input [255:0] label;
    input signed [31:0] got;
    input signed [31:0] exp;
    begin
      if (got !== exp) begin
        $display("FAIL: %s | got=%d exp=%d", label, got, exp);
        errors = errors + 1;
      end else begin
        $display("PASS: %s", label);
      end
    end
  endtask

  initial begin
    errors = 0;
    $dumpfile("waves/sub4.vcd");
    $dumpvars(0, tb_sub4);

    // Test SUB
    a=4'd5; b=4'd3; #5; check("SUB", y_sub, 2);
    a=4'd3; b=4'd5; #5; check("SUB", $signed(y_sub), -2);

    if (errors == 0) $display("SUB4: ALL TESTS PASSED ✅");
    else             $display("SUB4: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule
