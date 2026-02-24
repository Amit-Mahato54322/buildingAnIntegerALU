IVERILOG = iverilog
VVP      = vvp

SRC = verilog/gates_step1.v verilog/ashift4_step1.v

WAVES_DIR = waves

all: test_not test_nand test_nor test_shift

test_not: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/not1.out $(SRC) tests/tb_not1.v
	$(VVP) $(WAVES_DIR)/not1.out

test_nand: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/nand1.out $(SRC) tests/tb_nand1.v
	$(VVP) $(WAVES_DIR)/nand1.out

test_nor: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/nor1.out $(SRC) tests/tb_nor1.v
	$(VVP) $(WAVES_DIR)/nor1.out

test_shift: $(WAVES_DIR)
	$(IVERILOG) -g2012 -o $(WAVES_DIR)/ashift4_by1.out $(SRC) tests/tb_ashift4_by1.v
	$(VVP) $(WAVES_DIR)/ashift4_by1.out

$(WAVES_DIR):
	mkdir -p $(WAVES_DIR)

clean:
	rm -f $(WAVES_DIR)/*.out $(WAVES_DIR)/*.vcd

wave_not:
	gtkwave $(WAVES_DIR)/not1.vcd

wave_nand:
	gtkwave $(WAVES_DIR)/nand1.vcd

wave_nor:
	gtkwave $(WAVES_DIR)/nor1.vcd

wave_shift:
	gtkwave $(WAVES_DIR)/ashift4_by1.vcd