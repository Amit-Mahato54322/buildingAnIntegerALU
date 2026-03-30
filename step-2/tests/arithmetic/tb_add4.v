`timescale 1ns/1ps

module tb_add4;

  reg [3:0] a, b;
  reg cin;
  wire [3:0] y_add;
  wire cout;
  integer errors;

  add4 add4_dut (.a(a), .b(b), .cin(cin), .y(y_add), .cout(cout));

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
    $dumpfile("waves/add4.vcd");
    $dumpvars(0, tb_add4);

    // Test ADD
    a=4'd5; b=4'd3; cin=0; #5; check("ADD", {1'b0, cout, y_add}, 8);
    a=4'd9; b=4'd8; cin=1; #5; check("ADD", {1'b0, cout, y_add}, 18);

    if (errors == 0) $display("ADD4: ALL TESTS PASSED ✅");
    else             $display("ADD4: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule
