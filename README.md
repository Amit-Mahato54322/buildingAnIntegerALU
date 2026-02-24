# buildingAnIntegerALU
<!-- README.html -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Computer Architecture – Verilog Circuit Design Project</title>
  <style>
    :root { color-scheme: light dark; }
    body {
      font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif;
      line-height: 1.5;
      margin: 24px;
      max-width: 920px;
    }
    code, pre {
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", monospace;
    }
    pre {
      padding: 12px;
      border-radius: 8px;
      overflow-x: auto;
      border: 1px solid rgba(127,127,127,0.35);
    }
    h1, h2, h3 { line-height: 1.2; }
    .muted { opacity: 0.8; }
    ul { margin-top: 6px; }
    .card {
      padding: 14px;
      border-radius: 10px;
      border: 1px solid rgba(127,127,127,0.35);
      margin: 14px 0;
    }
  </style>
</head>
<body>

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

  <h2>Folder Structure</h2>
  <pre><code>step-1/
├── verilog/
│   ├── gates_step1.v
│   └── ashift4_step1.v
├── tests/
│   ├── tb_not1.v
│   ├── tb_nand1.v
│   ├── tb_nor1.v
│   └── tb_ashift4_by1.v
├── waves/
│   ├── not1.vcd
│   ├── nand1.vcd
│   ├── nor1.vcd
│   └── ashift4_by1.vcd
└── Makefile</code></pre>

  <h2>How to Run</h2>

  <h3>1) Compile and Run All Tests</h3>
  <pre><code>make</code></pre>
  <p>
    This will compile each module with its testbench, run the simulations, and generate VCD waveform files
    in the <code>waves/</code> directory.
  </p>

  <h3>2) Open Waveforms in GTKWave</h3>
  <pre><code>gtkwave waves/not1.vcd
gtkwave waves/nand1.vcd
gtkwave waves/nor1.vcd
gtkwave waves/ashift4_by1.vcd</code></pre>

  <h3>3) Clean Generated Outputs</h3>
  <pre><code>make clean</code></pre>

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
