# Parametric Low-Power ALU Design with Clock Gating and Operand Isolation in Verilog

This project implements a **parameterized Arithmetic Logic Unit (ALU)** in Verilog, optimized for **low-power operation** through the use of **clock gating** and **operand isolation**. The ALU supports 12 operations and scalable bit-widths (default: 16-bit), making it adaptable for a variety of digital system designs.

---

## ✅ Key Features

- 🧮 **12 ALU Operations**:
  - ADD, SUB, AND, OR, XOR, NOT, INC, DEC
  - SHL (Shift Left), SHR (Shift Right), ROL (Rotate Left), ROR (Rotate Right)

- ⚙️ **Parametric Bit-Width**:
  - Configurable via the `WIDTH` parameter (default is 16-bit)

- ⚡ **Low Power Techniques**:
  - **Clock Gating**: Reduces unnecessary clock activity
  - **Operand Isolation**: Minimizes switching activity by isolating unused operands

- 🧱 **Modular Verilog Design**:
  - `alu.v`: ALU logic with power optimization
  - `clock_gating.v`: Clock gating module
  - `tb_alu.v`: Testbench for simulation

---

## 💡 Low-Power Techniques Explained

### 🔌 Clock Gating
Implemented using a control signal (`en`) to gate the clock input. Logic executes only when enabled, saving dynamic power.

### 🚧 Operand Isolation
For operations that don’t use operand `B` (e.g., NOT, INC, SHL), the `B` input is zeroed out to prevent unnecessary signal transitions and reduce power consumption.

---

## 🧮 Operation Codes

| Opcode | Operation | B Used | Operand Isolated |
|--------|-----------|--------|------------------|
| `0000` | A + B     | Yes    | No               |
| `0001` | A - B     | Yes    | No               |
| `0010` | A & B     | Yes    | No               |
| `0011` | A \| B    | Yes    | No               |
| `0100` | A ^ B     | Yes    | No               |
| `0101` | ~A        | No     | ✅ Yes            |
| `0110` | A + 1     | No     | ✅ Yes            |
| `0111` | A - 1     | No     | ✅ Yes            |
| `1000` | A << 1    | No     | ✅ Yes            |
| `1001` | A >> 1    | No     | ✅ Yes            |
| `1010` | ROL A     | No     | ✅ Yes            |
| `1011` | ROR A     | No     | ✅ Yes            |

---

## 📂 Project Files

| File Name               | Description                                     |
|-------------------------|-------------------------------------------------|
| `alu.v`                 | Parametric ALU with 12 operations               |
| `clock_gating.v`        | Clock gating logic module                       |
| `tb_alu.v`              | Testbench for simulation                        |
| `parametric_alu_waveform.png` | Screenshot of waveform simulation results    |

---

## 🖼️ Waveform Output

Waveform simulation results for mare shown below.

> 📷 **Note**: Instead of uploading a `.vcd` file, the waveform is shared as a screenshot image.

![Waveform Output](parametric_alu_waveform.png)

---

## ▶️ Simulated Using

- **Tool**: Xilinx Vivado WebPACK (Free Version)
- **Top Simulation Module**: `tb_alu`
- **Simulation Type**: Behavioral Simulation

### ✅ Vivado Setup Instructions

1. Create a new project in **Vivado WebPACK**.
2. Add the following Verilog source files:
   - `alu.v`
   - `clock_gating.v`
   - `tb_alu.v`
3. Go to **Simulation Settings** → Set **Simulation Top Module Name** to `tb_alu`.
4. Run **Behavioral Simulation**.
5. Use the **Waveform Viewer** to inspect signal transitions.

---

## 📌 Applications

- Power-efficient FPGA and ASIC ALU components
- Embedded systems requiring configurable arithmetic units
- Energy-aware SoC and processor subsystems

---
