IVERILOG = iverilog
VVP      = vvp

SRC_GATES = verilog/gates_step2.v
SRC_ARITH = verilog/arithmetic/add4.v verilog/arithmetic/sub4.v verilog/arithmetic/mul4.v verilog/arithmetic/div4.v
SRC_SHIFT = verilog/ashifter_step2.v

WAVES_DIR = waves

all: test_gates test_arithmetic test_shifter

test_gates: test_and4 test_nand4 test_or4 test_nor4 test_xor4 test_xnor4 test_not4

test_and4: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/and4.out $(SRC_GATES) tests/tb_and4.v
	$(VVP) $(WAVES_DIR)/and4.out

test_nand4: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/nand4.out $(SRC_GATES) tests/tb_nand4.v
	$(VVP) $(WAVES_DIR)/nand4.out

test_or4: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/or4.out $(SRC_GATES) tests/tb_or4.v
	$(VVP) $(WAVES_DIR)/or4.out

test_nor4: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/nor4.out $(SRC_GATES) tests/tb_nor4.v
	$(VVP) $(WAVES_DIR)/nor4.out

test_xor4: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/xor4.out $(SRC_GATES) tests/tb_xor4.v
	$(VVP) $(WAVES_DIR)/xor4.out

test_xnor4: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/xnor4.out $(SRC_GATES) tests/tb_xnor4.v
	$(VVP) $(WAVES_DIR)/xnor4.out

test_not4: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/not4.out $(SRC_GATES) tests/tb_not4.v
	$(VVP) $(WAVES_DIR)/not4.out

test_arithmetic: test_add4 test_sub4 test_mul4 test_div4

test_add4: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/add4.out verilog/arithmetic/add4.v tests/arithmetic/tb_add4.v
	$(VVP) $(WAVES_DIR)/add4.out

test_sub4: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/sub4.out verilog/arithmetic/sub4.v tests/arithmetic/tb_sub4.v
	$(VVP) $(WAVES_DIR)/sub4.out

test_mul4: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/mul4.out verilog/arithmetic/mul4.v tests/arithmetic/tb_mul4.v
	$(VVP) $(WAVES_DIR)/mul4.out

test_div4: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/div4.out verilog/arithmetic/div4.v tests/arithmetic/tb_div4.v
	$(VVP) $(WAVES_DIR)/div4.out

test_shifter: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/ashifter.out $(SRC_SHIFT) tests/tb_ashifter_step2.v
	$(VVP) $(WAVES_DIR)/ashifter.out

$(WAVES_DIR):
	mkdir -p $(WAVES_DIR)

clean:
	rm -f $(WAVES_DIR)/*.out $(WAVES_DIR)/*.vcd

wave_gates:
	gtkwave $(WAVES_DIR)/and4.vcd $(WAVES_DIR)/nand4.vcd $(WAVES_DIR)/or4.vcd $(WAVES_DIR)/nor4.vcd $(WAVES_DIR)/xor4.vcd $(WAVES_DIR)/xnor4.vcd $(WAVES_DIR)/not4.vcd

wave_arithmetic:
	gtkwave $(WAVES_DIR)/arithmetic_step2.vcd

wave_shifter:
	gtkwave $(WAVES_DIR)/ashifter_step2.vcd
