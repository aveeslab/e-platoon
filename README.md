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
git clone https://github.com/avees-dev/electric-truck-platoon.git
```

### 2. Open the project in MATLAB

Launch MATLAB and move to the repository folder 'electric-truck-platoon'.

### 3. Open the script file and run

Run the live script and click the 'Run' button

```matlab
open('E-Platoon.mlx')
```
## Model Description

This repository contains a Simulink model for **electric truck platooning** with a focus on **CACC-based longitudinal control**.

### What the model includes

- CACC logic for follower vehicles
- vehicle speed and spacing response evaluation
- calculate the SOC(State-Of-Charge) of battery

The model is mainly intended for validating longitudinal platoon control performance (and 그 제어에 따른 배터리 실시간 상태 추정) in a simulation environment.
---

## Inputs and Outputs

### Inputs

Typical inputs include:

- lead vehicle speed profile
- initial vehicle states
- target spacing or time headway
- controller parameters

### Outputs

Typical outputs include:

- follower vehicle speed
- relative distance
- spacing error
- longitudinal control command

---

## Workflow

A typical workflow is:

1. Clone the repository
2. Open the project in MATLAB
3. Run the initialization script
4. Open the main Simulink model
5. Adjust parameters if needed
6. Run the simulation
7. Review output signals and controller behavior
