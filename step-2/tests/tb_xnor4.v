`timescale 1ns/1ps

module tb_xnor4;

  reg [3:0] a, b;
  wire [3:0] y;

  integer errors;

  xnor4 dut (.a(a), .b(b), .y(y));

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
    $dumpfile("waves/xnor4.vcd");
    $dumpvars(0, tb_xnor4);

    a = 4'b0101; b = 4'b1010; #5; check4("0101 XNOR 1010", y, 4'b0000);
    a = 4'b1100; b = 4'b1001; #5; check4("1100 XNOR 1001", y, 4'b1010);
    a = 4'b1111; b = 4'b1111; #5; check4("1111 XNOR 1111", y, 4'b1111);
    a = 4'b0000; b = 4'b1111; #5; check4("0000 XNOR 1111", y, 4'b0000);

    if (errors == 0) $display("XNOR4: ALL TESTS PASSED ✅");
    else             $display("XNOR4: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule
