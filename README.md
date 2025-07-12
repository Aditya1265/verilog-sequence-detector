#  Verilog 1001 Sequence Detector (Mealy Machine)

This project implements a **Mealy Finite State Machine (FSM)** in Verilog to detect the binary sequence `1001`. The FSM is designed to output `1` **immediately** upon detecting the sequence, and supports **overlapping patterns** like `1001001`.

---

##  Project Structure

| File                          | Description                                |
|-------------------------------|--------------------------------------------|
| `sequence_detector_1001.v`    | Main FSM module (Mealy machine for `1001`) |
| `tb_sequence_detector_1001.v` | Testbench to simulate the FSM              |
| `sim.vvp`                     | Compiled simulation output (Icarus Verilog)|
| `dump.vcd`                    | Waveform file for GTKWave visualization    |

---

##  How It Works

- The FSM transitions through 4 states: `a → b → c → d`
- On detecting `1001`, output goes high (`1`) for **one clock cycle**
- Overlapping sequences are supported
- Implemented as a **Mealy machine** for faster output

---

##  How to Run

###  Step 1: Compile with Icarus Verilog

```bash
iverilog -o sim.vvp sequence_detector_1001.v tb_sequence_detector_1001.v
