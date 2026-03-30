`timescale 1ns/1ps

module tb_arithmetic_step2;

  reg [3:0] a, b;
  reg cin;
  wire [3:0] y_add, y_sub, y_div, y_rem;
  wire [7:0] y_mul;
  wire cout, bout;

  integer errors;

  add4 add4_dut (.a(a), .b(b), .cin(cin), .y(y_add), .cout(cout));
  sub4 sub4_dut (.a(a), .b(b), .y(y_sub), .bout(bout));
  mul4 mul4_dut (.a(a), .b(b), .y(y_mul));
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
    $dumpfile("waves/arithmetic_step2.vcd");
    $dumpvars(0, tb_arithmetic_step2);

    // Test ADD
    a=4'd5; b=4'd3; cin=0; #5; check("ADD", {1'b0, cout, y_add}, 8);
    a=4'd9; b=4'd8; cin=1; #5; check("ADD", {1'b0, cout, y_add}, 18);

    // Test SUB
    a=4'd5; b=4'd3; #5; check("SUB", y_sub, 2);
    a=4'd3; b=4'd5; #5; check("SUB", $signed(y_sub), -2);

    // Test MUL
    a=4'd5; b=4'd3; #5; check("MUL", y_mul, 15);
    a=4'd9; b=4'd8; #5; check("MUL", y_mul, 72);

    // Test DIV
    a=4'd7; b=4'd3; #5; check("DIV", {y_div, y_rem}, 8'b0010_0001); // 7/3 = 2 rem 1
    a=4'd15; b=4'd4; #5; check("DIV", {y_div, y_rem}, 8'b0011_0011); // 15/4 = 3 rem 3

    if (errors == 0) $display("ARITHMETIC_STEP2: ALL TESTS PASSED ✅");
    else             $display("ARITHMETIC_STEP2: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule
