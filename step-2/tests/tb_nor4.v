`timescale 1ns/1ps

module tb_nor4;

  reg [3:0] a, b;
  wire [3:0] y;

  integer errors;

  nor4 dut (.a(a), .b(b), .y(y));

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
    $dumpfile("waves/nor4.vcd");
    $dumpvars(0, tb_nor4);

    a = 4'b0101; b = 4'b1010; #5; check4("0101 NOR 1010", y, 4'b0000);
    a = 4'b1100; b = 4'b1001; #5; check4("1100 NOR 1001", y, 4'b0010);
    a = 4'b1111; b = 4'b0000; #5; check4("1111 NOR 0000", y, 4'b0000);
    a = 4'b0000; b = 4'b0000; #5; check4("0000 NOR 0000", y, 4'b1111);

    if (errors == 0) $display("NOR4: ALL TESTS PASSED ✅");
    else             $display("NOR4: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule
