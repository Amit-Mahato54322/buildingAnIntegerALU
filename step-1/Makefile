# Compiler and simulator
IVERILOG = iverilog
VVP      = vvp

# Output files
OUT      = waves/step1.out
VCD      = waves/step1.vcd

# Source files
SRC = verilog/gates_step1.v \
      verilog/ashift4_step1.v \
      tests/tb_step1.v

# Default target
all: run

# Compile
build:
	$(IVERILOG) -g2012 -o $(OUT) $(SRC)

# Run simulation
run: build
	$(VVP) $(OUT)

# Open waveform
wave:
	gtkwave $(VCD)

# Clean generated files
clean:
	rm -f waves/*.out waves/*.vcd