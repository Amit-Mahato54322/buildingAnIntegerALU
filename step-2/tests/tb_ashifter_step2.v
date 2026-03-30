`timescale 1ns/1ps

module tb_ashifter_step2;

  reg [3:0] a;
  reg [1:0] s;
  wire [3:0] y;

  integer errors;

  ashifter4 dut (.a(a), .s(s), .y(y));

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
    $dumpfile("waves/ashifter_step2.vcd");
    $dumpvars(0, tb_ashifter_step2);

    a = 4'b1011;

    s = 2'b00; #5; check4("S=00, NOP", y, 4'b1011);
    s = 2'b01; #5; check4("S=01, LSL", y, 4'b0110);
    s = 2'b10; #5; check4("S=10, LSR", y, 4'b0101);
    s = 2'b11; #5; check4("S=11, ASR", y, 4'b1101);

    if (errors == 0) $display("ASHIFTER_STEP2: ALL TESTS PASSED ✅");
    else             $display("ASHIFTER_STEP2: FAILED ❌ errors=%0d", errors);

    #5; $finish;
  end

endmodule
