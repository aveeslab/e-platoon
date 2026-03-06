# Electric Truck Platooning with CACC

MATLAB/Simulink model for **electric truck platooning** with **CACC-based longitudinal control**.

This repository focuses on simulating and validating longitudinal platoon behavior, including:

- speed tracking
- inter-vehicle spacing control
- cooperative response to lead/preceding vehicle motion

The current scope is limited to **longitudinal control**. **Lateral control** and **full vehicle integration** are not included in this repository.

---

## Overview

This project provides a Simulink-based platooning model for electric trucks using **Cooperative Adaptive Cruise Control (CACC)**.

The model is intended for:

- control algorithm development
- simulation-based validation
- model-based design (MBD) workflow
- future extension to code generation or higher-level integration

It is designed as a simulation-oriented model for testing how follower vehicles regulate spacing and speed using shared information from the platoon.

---

## Requirements

### Environment

- **OS**: Windows  
- **MATLAB**: R2024b or later  
- **Simulink**

### Optional toolboxes

No additional toolbox is required for the basic simulation workflow.

Depending on what you want to do, you may need:

- **Simscape**  
  Only required if you create or modify battery-related physical models.

- **Simulink Coder**  
  Only required for code generation.

- **Embedded Coder**  
  Only required for embedded deployment-oriented code generation.

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/your-repository-name.git
cd your-repository-name
