

  <h1>Computer Architecture – Verilog Circuit Design Project</h1>
  <p class="muted">
    Digital circuit design project for a Computer Architecture course using Verilog, unit testbenches,
    and waveform verification with GTKWave.
  </p>

  <h2>Project Overview</h2>
  <p>
    This repository contains the implementation of basic combinational logic circuits and a 4-bit arithmetic
    shift circuit developed in Verilog. Each module is tested using a dedicated unit testbench, and VCD
    waveforms are generated for debugging and verification.
  </p>

  <div class="card">
    <strong>Key concepts covered:</strong>
    <ul>
      <li>Verilog module design (combinational logic)</li>
      <li>Two’s complement representation</li>
      <li>Arithmetic shifting and sign-extension</li>
      <li>Testbench development</li>
      <li>Waveform debugging using VCD + GTKWave</li>
      <li>Build automation using Make</li>
    </ul>
  </div>

  <h2>Implemented Circuits (Step-1)</h2>

  <h3>1-bit Logic Gates</h3>
  <ul>
    <li>NOT gate</li>
    <li>NAND gate</li>
    <li>NOR gate</li>
  </ul>

  <h3>4-bit Arithmetic Shift Circuit</h3>
  <ul>
    <li>4-bit input</li>
    <li>4-bit output</li>
    <li>Shift amount: 1</li>
    <li>Direction chosen: <strong>Arithmetic Right Shift</strong></li>
    <li>Includes <strong>sign-extension</strong> (MSB preserved)</li>
  </ul>

  <h2>Implemented Circuits (Step-2)</h2>

  <h3>4-bit Logic Gates</h3>
  <ul>
    <li>AND</li>
    <li>NAND</li>
    <li>OR</li>
    <li>NOR</li>
    <li>XOR</li>
    <li>XNOR</li>
    <li>NOT</li>
  </ul>

  <h3>4-bit Arithmetic Circuits</h3>
  <ul>
    <li><strong>Adder:</strong> 4-bit adder with carry-in and carry-out.</li>
    <li><strong>Subtractor:</strong> 4-bit subtractor with borrow-out.</li>
    <li><strong>Multiplier:</strong> 4-bit multiplier with an 8-bit result.</li>
    <li><strong>Divider:</strong> 4-bit divider that produces a 4-bit quotient and a 4-bit remainder.</li>
  </ul>

  <h3>4-bit Barrel Shifter</h3>
  <p>A 2x4-bit input barrel shifter with a 2-bit select line to control the operation:</p>
  <ul>
    <li><code>00</code>: No-op (output = input)</li>
    <li><code>01</code>: Logical Shift Left by 1</li>
    <li><code>10</code>: Logical Shift Right by 1</li>
    <li><code>11</code>: Arithmetic Shift Right by 1 (with sign extension)</li>
  </ul>

  <h2>Folder Structure</h2>
  <pre><code>.
├── step-1/
│   ├── verilog/
│   ├── tests/
│   ├── waves/
│   └── Makefile
└── step-2/
    ├── verilog/
    │   ├── gates_step2.v
    │   ├── arithmetic_step2.v
    │   └── ashifter_step2.v
    ├── tests/
    │   ├── tb_gates_step2.v
    │   ├── tb_arithmetic_step2.v
    │   └── tb_ashifter_step2.v
    ├── waves/
    │   ├── gates_step2.vcd
    │   ├── arithmetic_step2.vcd
    │   └── ashifter_step2.vcd
    └── Makefile
</code></pre>

  <h2>How to Run</h2>

  <p>Commands should be run from the root of the project directory.</p>

  <h3>Step-1 Tests</h3>
  <pre><code># Run all tests for Step-1
make -C step-1

# Open waveforms for Step-1
make -C step-1 wave_not
make -C step-1 wave_nand
make -C step-1 wave_nor
make -C step-1 wave_shift

# Clean generated files for Step-1
make -C step-1 clean</code></pre>

  <h3>Step-2 Tests</h3>
  <pre><code># Run all tests for Step-2
make -C step-2

# Open waveforms for Step-2
make -C step-2 wave_gates
make -C step-2 wave_arithmetic
make -C step-2 wave_shifter

# Clean generated files for Step-2
make -C step-2 clean</code></pre>

  <h2>Example: Arithmetic Right Shift Behavior</h2>
  <p>
    Arithmetic right shift preserves the sign bit (MSB) for signed numbers (two’s complement).
    For example:
  </p>
  <pre><code>A = 1000
Y = 1100</code></pre>
  <p>
    The MSB remains <code>1</code> due to sign-extension, maintaining correct signed behavior.
  </p>

  <h2>Tools Used</h2>
  <ul>
    <li>Icarus Verilog (iverilog + vvp)</li>
    <li>GTKWave (waveform viewer)</li>
    <li>Make (build automation)</li>
    <li>LaTeX (report preparation, optional/extra credit depending on course)</li>
  </ul>

  <h2>Next Steps</h2>
  <p>
    Future stages of this project expand into a full ALU implementation including logic operations,
    arithmetic operations (add/sub/mul/div), a control module with opcodes, and extended bit-width options
    (8/16/32-bit).
  </p>

</body>
</html>
