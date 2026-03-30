`timescale 1ns/1ps

module tb_div4;

  reg [3:0] a, b;
  wire [3:0] y_div, y_rem;
  integer errors;

  div4 div4_dut (.a(a), .b(b), .y(y_div), .rem(y_rem));

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
    $dumpfile("waves/div4.vcd");
    $dumpvars(0, tb_div4);

    // Test DIV
    a=4'd7; b=4'd3; #5; check("DIV", {y_div, y_rem}, 8'b0010_0001); // 7/3 = 2 rem 1
    a=4'd15; b=4'd4; #5; check("DIV", {y_div, y_rem}, 8'b0011_0011); // 15/4 = 3 rem 3

    if (errors == 0) $display("DIV4: ALL TESTS PASSED ✅");
    else             $display("DIV4: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule
