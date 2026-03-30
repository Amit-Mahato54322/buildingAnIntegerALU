`timescale 1ns/1ps

module tb_gates_step2;

  reg [3:0] a, b;
  wire [3:0] y_and, y_nand, y_or, y_nor, y_xor, y_xnor, y_not;

  integer errors;

  and4 and4_dut (.a(a), .b(b), .y(y_and));
  nand4 nand4_dut (.a(a), .b(b), .y(y_nand));
  or4 or4_dut (.a(a), .b(b), .y(y_or));
  nor4 nor4_dut (.a(a), .b(b), .y(y_nor));
  xor4 xor4_dut (.a(a), .b(b), .y(y_xor));
  xnor4 xnor4_dut (.a(a), .b(b), .y(y_xnor));
  not4 not4_dut (.a(a), .y(y_not));

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
    $dumpfile("waves/gates_step2.vcd");
    $dumpvars(0, tb_gates_step2);

    // Test case 1
    a = 4'b0101; b = 4'b1010;
    #5;
    check4("AND", y_and, 4'b0000);
    check4("NAND", y_nand, 4'b1111);
    check4("OR", y_or, 4'b1111);
    check4("NOR", y_nor, 4'b0000);
    check4("XOR", y_xor, 4'b1111);
    check4("XNOR", y_xnor, 4'b0000);
    check4("NOT a", y_not, 4'b1010);

    // Test case 2
    a = 4'b1100; b = 4'b1100;
    #5;
    check4("AND", y_and, 4'b1100);
    check4("NAND", y_nand, 4'b0011);
    check4("OR", y_or, 4'b1100);
    check4("NOR", y_nor, 4'b0011);
    check4("XOR", y_xor, 4'b0000);
    check4("XNOR", y_xnor, 4'b1111);
    check4("NOT a", y_not, 4'b0011);

    if (errors == 0) $display("GATES_STEP2: ALL TESTS PASSED ✅");
    else             $display("GATES_STEP2: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule
