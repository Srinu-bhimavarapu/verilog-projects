# Verilog RTL Projects – Digital Design & Core Building Blocks

## 📌 Overview

This repository contains a **collection of fundamental Verilog RTL projects**, covering **digital design basics, FSMs, datapath/control logic, and arithmetic circuits**.

All modules are **hand-written in Verilog**, **fully synthesizable**, and **verified using individual testbenches**.
This repository represents my **strong foundation in RTL design**, which later scales into **AXI, APB, UART, SPI, and full SoC designs** (available in separate repositories).

This is an **all-in-one repository** intentionally maintained to showcase **breadth of RTL fundamentals**.

---

## 🧠 Skills Demonstrated

* Verilog RTL coding
* Digital logic design
* Finite State Machines (FSMs)
* Datapath & control separation
* Arithmetic and logical units
* Sequential & combinational circuits
* Testbench-based verification
* Simulation & waveform debugging

---

## 📂 Repository Structure

```text
src/
├── controller.v
├── counter.v
├── datapath.v
├── example.v
├── full_adder.v
├── multiplier_top.v
├── mux_8x1.v
├── mux_16x1.v
├── parallel_adder.v
├── paralleladder.v
├── parity_generator.v
├── pipe_ex.v
├── pipeline_alu.v
├── regbank_v1.v
├── ring_counter.v
├── sequence_detector.v
├── shift_register.v
├── simple_latch.v
├── traffic_signals.v
├── up_down.v
└── up_down_counter.v

testbench/
└── Individual testbenches for each module
```

> Each RTL module has a **corresponding testbench** used for functional verification.

---

## 🧩 Module Categories

### 🔹 Combinational Logic

* Full Adder
* Multiplexers (8×1, 16×1)
* Parity Generator
* Parallel Adder

---

### 🔹 Sequential Logic

* Counters
* Ring Counter
* Up / Down Counter
* Shift Register
* Simple Latch

---

### 🔹 FSM-Based Designs

* Sequence Detector
* Traffic Light Controller
* Controller Module

---

### 🔹 Datapath-Oriented Designs

* Datapath module
* Pipeline Example
* Pipelined ALU
* Register Bank

---

## 🧪 Verification Methodology

* Dedicated **Verilog testbench for each module**
* Clock and reset driven simulations
* Directed stimulus for functionality validation
* Waveform inspection for correctness

Simulation tools used:

* Xilinx Vivado (recommended)
* ModelSim / Questa
* Any Verilog-compatible simulator

---

## 🚀 How to Run Simulation (Example – Vivado)

### GUI Method

1. Open **Vivado**
2. Create a new RTL project
3. Add required RTL file from `src/`
4. Add corresponding testbench from `testbench/`
5. Set testbench as simulation top
6. Run **Behavioral Simulation**

### Tcl Method

```tcl
read_verilog src/<module_name>.v
read_verilog testbench/<module_name>_tb.v
launch_simulation
```

---

## 🎯 Learning Outcomes

* Strong foundation in RTL design principles
* Clear understanding of digital building blocks
* FSM design and timing behavior
* Datapath and control logic interaction
* RTL debugging using waveforms

---

## 🔗 Advanced Protocol & SoC Projects

This repository serves as the **base layer** for my advanced RTL work:

* AXI4 / AXI-Lite / AXI-Stream
* APB
* UART
* SPI
* AXI Interconnects & Bridges
* Full Embedded SoC Design

👉 See: **[https://github.com/Srinu-bhimavarapu](https://github.com/Srinu-bhimavarapu)**

---

## 👤 Author

**Srinu Bhimavarapu**
Electronics & Communication Engineering
Focus Areas:

* RTL Design
* Digital Systems
* SoC Architecture
* AMBA Protocols

---

## ⭐ Recruiter Note

✔ Hand-written Verilog RTL
✔ Wide coverage of digital design concepts
✔ Testbench-verified modules
✔ Strong foundation for advanced SoC design

This repository demonstrates **solid RTL fundamentals**, which are critical for **RTL Design, VLSI, and SoC roles**.
