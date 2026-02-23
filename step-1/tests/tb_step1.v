`timescale 1ns/1ps

module tb_step1;

    // Inputs for gates
    reg a, b;
    wire y_not, y_nand, y_nor;

    // Input for shifter
    reg  [3:0] A;
    wire [3:0] Y;

    integer errors;

    // DUTs
    not1       u_not   (.a(a), .y(y_not));
    nand1      u_nand  (.a(a), .b(b), .y(y_nand));
    nor1       u_nor   (.a(a), .b(b), .y(y_nor));
    ashift4_by1 u_shft (.a(A), .y(Y));

    // Simple checker task
    task check;
        input [255:0] label;
        input [31:0] got;
        input [31:0] exp;
        begin
            if (got !== exp) begin
                $display("FAIL: %s | got=%0d (0x%0h) exp=%0d (0x%0h)",
                         label, got, got, exp, exp);
                errors = errors + 1;
            end else begin
                $display("PASS: %s", label);
            end
        end
    endtask

    initial begin
        errors = 0;

        // Dump waveforms to your waves/ folder
        $dumpfile("waves/step1.vcd");
        $dumpvars(0, tb_step1);

        // -------------------------
        // NOT gate tests
        // -------------------------
        $display("\n=== Testing NOT ===");
        a = 0; #1; check("NOT a=0", y_not, 1);
        a = 1; #1; check("NOT a=1", y_not, 0);

        // -------------------------
        // NAND gate truth table tests
        // -------------------------
        $display("\n=== Testing NAND ===");
        a = 0; b = 0; #1; check("NAND 0,0", y_nand, 1);
        a = 0; b = 1; #1; check("NAND 0,1", y_nand, 1);
        a = 1; b = 0; #1; check("NAND 1,0", y_nand, 1);
        a = 1; b = 1; #1; check("NAND 1,1", y_nand, 0);

        // -------------------------
        // NOR gate truth table tests
        // -------------------------
        $display("\n=== Testing NOR ===");
        a = 0; b = 0; #1; check("NOR 0,0", y_nor, 1);
        a = 0; b = 1; #1; check("NOR 0,1", y_nor, 0);
        a = 1; b = 0; #1; check("NOR 1,0", y_nor, 0);
        a = 1; b = 1; #1; check("NOR 1,1", y_nor, 0);

        // -------------------------
        // Arithmetic shift by 1 tests (ASR1)
        // Y = {A[3], A[3:1]}
        // -------------------------
        $display("\n=== Testing 4-bit Arithmetic RIGHT Shift by 1 (ASR1) ===");

        A = 4'b0000; #1; check("ASR1 A=0000", Y, 4'b0000);
        A = 4'b0001; #1; check("ASR1 A=0001", Y, 4'b0000);
        A = 4'b0010; #1; check("ASR1 A=0010", Y, 4'b0001);
        A = 4'b0101; #1; check("ASR1 A=0101", Y, 4'b0010);
        A = 4'b0111; #1; check("ASR1 A=0111", Y, 4'b0011);

        // MSB=1 cases show sign-extension
        A = 4'b1000; #1; check("ASR1 A=1000", Y, 4'b1100);
        A = 4'b1001; #1; check("ASR1 A=1001", Y, 4'b1100);
        A = 4'b1011; #1; check("ASR1 A=1011", Y, 4'b1101);
        A = 4'b1111; #1; check("ASR1 A=1111", Y, 4'b1111);

        // Summary
        $display("\n=== TEST SUMMARY ===");
        if (errors == 0) $display("ALL TESTS PASSED ✅");
        else             $display("TESTS FAILED ❌ errors=%0d", errors);

        #5;
        $finish;
    end

endmodule