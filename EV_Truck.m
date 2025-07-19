%clear all
%close all
%clc


opts = detectImportOptions('MCT.csv','NumHeaderLines',0,'PreserveVariableNames',true);

Raw_Data = readtable('MCT.csv',opts) ;
Cycle_Data = readtable('HWFET.csv',opts) ; 


%electric_consumption = table2array(readtable('electric_consumption.csv'));
%electric_consumption = table2array(readtable('electric_consumption_LSTM.csv'));
electric_consumption = table2array(readtable('electric_consumption_LSTM.csv'));
%battery_SOC = table2array(readtable('battery_SOC.csv'));
%battery_SOC = table2array(readtable('battery_SOC_INR.csv'));
battery_SOC = table2array(readtable('battery_SOC_U2736XP.csv'));
%motor_torque = readtable('motor_torque.csv');
%motor_efficiency = readtable('motor_efficiency.csv');
motor_torque = readtable('motor_torque_eactros600.csv');
motor_efficiency = readtable('motor_efficiency_eactros600.csv');
%drag_coefficient = readtable('drag_coefficient.csv');


battery_SOC_SOC = battery_SOC(:,1);
battery_SOC_voltage = battery_SOC(:,2);
battery_SOC_resistance = battery_SOC(:,3);
%electric_consumption_voltage = electric_consumption(:,1);
%electric_consumption_ressistancce = electric_consump   tion(:,2);
electric_consumption_voltage = electric_consumption(:,1);
electric_consumption_ressistancce = electric_consumption(:,2);


motor_efficiency_RPM = table2array(motor_efficiency(2:height(motor_efficiency),1));
motor_efficiency_torque = table2array(motor_efficiency(1,2:width(motor_efficiency)));
motor_efficiency_efficiency = table2array(motor_efficiency(2:height(motor_efficiency),2:width(motor_efficiency)));
motor_efficiency_torque = transpose(motor_efficiency_torque);


Cycle_Speed = table2array(Raw_Data(:,:));
HWFET_Speed = table2array(Cycle_Data(:,:));
motor_torque_RPM = table2array(motor_torque(1:6,2));
motor_RPM_torque = table2array(motor_torque(1:6,1));

slope = [1,0];
Tire_Inertia_Moment = [1,0.1431];
Brake_Inertia_Moment = [1,0.02];
Differential_Inertia_Moment_In = [1,0.015];
Differential_Inertia_Moment_Out1 = [1,0.015];
Differential_Inertia_Moment_Out2 = [1,0.015];
Final_Drive_Inertia_Moment_In = [1,0.01];
Final_Drive_Inertia_Moment_Out = [1,0.015];
Motor_Inertia_Moment_In = [1,0.0226];
Vehicle_Weight = [1,44000];
Amb_Temp = [1,25];
Amb_Press = [1,101.325];
Wheel_Radius = [1,0.52];
Differential_Efficiency = [1,0.96];
Final_Drive_Efficiency = [1,0.96];
Final_Gear_Ratio = [1,5.29];
Acceleration_gravity = [1,9.81];
%Resistance_F0 = [1,53.905];
Resistance_rolling = [1,0.006];
Resistance_friction = [1,0.21857];
%Resistance_aero = [1,0.029304];
Air_density = [1,1.225];
Frontal_of_vehicle = [1, 9.84];
Regenerative_percent = [1,0.7];
Battery_Capacity = [1,4500];

%Total_time = [1,length(Cycle_Speed)];
Total_time = [1,inf];

simulation_time = inf ;
load ('EV_Modeling.mat');
load ('recurrentNet.mat');
load ('Batteries.mat');
net = recurrentNet;
statefulLSTMNet = net;
sim_outputs = sim('EV_Modeling',simulation_time);

output_data = sim_outputs.yout;

t = output_data{8}.Values.Time;
R_Out_Battery_SOC = output_data{4}.Values.Data;
R_Out_Battery_Temp = output_data{5}.Values.Data;
R_Out_Battery_Vol = output_data{6}.Values.Data;
R_Out_Battery_Curr = output_data{7}.Values.Data;

idx = abs(fix(t) - t) < 1e-6;

Time_sec   = t(idx);
SoC = R_Out_Battery_SOC(idx);
Temp = R_Out_Battery_Temp(idx);
Vol = R_Out_Battery_Vol(idx);
Curr = R_Out_Battery_Curr(idx);

% 테이블 생성
T = table(Time_sec, SoC, Temp, Vol, Curr, ...
          'VariableNames', ["Time", "SoC", "Temp", ...
                            "Vol", "Curr"]);

% CSV 저장
writetable(T, 'battery_outputs.csv');
disp("SAVE CSV COMPLETELY: battery_outputs.csv");

