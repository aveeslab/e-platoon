1. Clone 'electric-truck-platoon' repository 
```
git clone https://github.com/AveesLab/electric-truck-platoon.git
```

2. Open 'EV_Truck.m' and execute
3. Open 'EV_Modeling.slx' file and execute simulation repeatedly.
- Input(LV)
  - Target Speed: Contant Speed(80km/h)
  - Position (ego)
  - Velocity (ego)
  - State of Charge (ego)
  - Position of following Vehicle(FV1) – used for calculating IVD
- Output (LV)
  - Acceleration(m/s²)
  - Speed(m/s)
  - Position(m)
  - Battery SOC(%)
- Simulation condition: The simulation continues until the Battery SOC drops below 20%, at which point it automatically stops.

