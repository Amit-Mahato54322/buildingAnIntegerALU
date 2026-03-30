`timescale 1ns/1ps

module tb_mul4;

  reg [3:0] a, b;
  wire [7:0] y_mul;
  integer errors;

  mul4 mul4_dut (.a(a), .b(b), .y(y_mul));

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
    $dumpfile("waves/mul4.vcd");
    $dumpvars(0, tb_mul4);

    // Test MUL
    a=4'd5; b=4'd3; #5; check("MUL", y_mul, 15);
    a=4'd9; b=4'd8; #5; check("MUL", y_mul, 72);

    if (errors == 0) $display("MUL4: ALL TESTS PASSED ✅");
    else             $display("MUL4: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule
