IVERILOG = iverilog
VVP      = vvp

SRC_GATES = verilog/gates_step2.v
SRC_ARITH = verilog/arithmetic_step2.v
SRC_SHIFT = verilog/ashifter_step2.v

WAVES_DIR = waves

all: test_gates test_arithmetic test_shifter

test_gates: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/gates.out $(SRC_GATES) tests/tb_gates_step2.v
	$(VVP) $(WAVES_DIR)/gates.out

test_arithmetic: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/arithmetic.out $(SRC_ARITH) tests/tb_arithmetic_step2.v
	$(VVP) $(WAVES_DIR)/arithmetic.out

test_shifter: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/ashifter.out $(SRC_SHIFT) tests/tb_ashifter_step2.v
	$(VVP) $(WAVES_DIR)/ashifter.out

$(WAVES_DIR):
	mkdir -p $(WAVES_DIR)

clean:
	rm -f $(WAVES_DIR)/*.out $(WAVES_DIR)/*.vcd

wave_gates:
	gtkwave $(WAVES_DIR)/gates_step2.vcd

wave_arithmetic:
	gtkwave $(WAVES_DIR)/arithmetic_step2.vcd

wave_shifter:
	gtkwave $(WAVES_DIR)/ashifter_step2.vcd
