# Electric Truck Platooning with CACC

<img width="1316" height="273" alt="Electric Truck Platooning with CACC" src="https://github.com/user-attachments/assets/b27d3acf-a832-4b30-9f98-30c6296e1413" />

MATLAB/Simulink model for **3-truck electric platooning** featuring **CACC-based longitudinal control** and **battery SOC estimation (Coulomb counting)**.

This repository focuses on simulating and validating longitudinal platoon behavior, including:

- speed tracking
- inter-vehicle spacing control
- cooperative response to lead/preceding vehicle motion
- SOC estimation via current integration (Coulomb counting)

The current scope is limited to **longitudinal control**. **Lateral control** and **full vehicle integration** are not included.

---

## Overview

This project provides a Simulink-based platooning model for electric trucks.  
Each truck includes:

- **CACC longitudinal controller** (lead/follow behavior)
- **battery SOC estimation** using **current integration (Coulomb counting)**

The model is intended for:

- cooperative longitudinal control algorithm development
- SOC estimation logic validation under platooning scenarios
- simulation-based evaluation and comparison
- model-based design (MBD) workflow
- future extension to code generation or higher-level integration

---


## Requirements

### Environment

- **OS**: Windows  
- **MATLAB**: R2024b or later  
- **Simulink**

### Optional toolboxes
- **Model Predictive Control Toolbox**

Depending on what you want to do, you may need:
- **Simscape** (Required if you create or modify battery-related physical models)
- **Simulink Coder** (Required for code generation)
- **Embedded Coder** (Required for embedded deployment-oriented code generation)

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/avees-dev/electric-truck-platoon.git
```

### 2. Open the project in MATLAB

Launch MATLAB and move to the repository folder 'electric-truck-platoon'.

### 3. Open the script file and run

Open the live script 'E-Platoon.mlx' and click the 'Run' button

```matlab
open('E-Platoon.mlx')
```
## Model Description

This repository contains a Simulink model for **electric truck platooning** for 3 trucks (LV,FV1,FV2) and single truck for comparison.
Two model variants are provided depending on the battery estimation approach:
1) EV_modelig.slx : Battery SOC estimation via **Coulomb counting**
2) EV_modeling_simscape.slx : Battery modeled using **Simscape** (physical model)


### What the model includes

- **CACC (Cooperative Adaptive Cruise Control)** logic for follower vehicles
- vehicle speed and spacing response evaluation
- battery SOC estimation via **Coulomb counting**
- simulation signals for controller behavior and SOC trend analysis

The model is mainly intended for validating **longitudinal platoon control performance** and the **resulting battery state estimation** in a simulation environment.

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
