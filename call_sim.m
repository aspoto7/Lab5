close all
clear all
clc

%% System parameters
m = 1.30;   % mass [kg] 
k = 503.09;    % stiffness [N/m]
c = 1.20;      % damping coefficient [Ns/m]    
 
% Initial conditions
x0 = 0;     % initial displacement   
v0 = 0;     % initial velocity 
 
% Controller parameters
Kp = 2;     % proportional gain
Ki = 22;     % integral gain
Kd = 0.05;     % derivative gain

%%
Tsim = 10; % Simulation Time
sim ('sim_control_old_version'); % call the simulation

% Compare simulated to experimental results

[t1,cont1,disp1]=readf4('e3t9.txt');

figure(1);
plot(t1,disp1)
hold on
plot(x.Time,x.Data);
ylabel('Displacement [mm]')
xlabel('Time (s)')
legend('Experimental Data', 'Simulated Data')
title('Experiment 3 Test 9')

figure(2)
plot(t1,cont1)
hold on
plot(c_eff.Time,c_eff.Data);
xlabel('Time(s)')
ylabel('Control Effort (N)')
legend('Experimental Data', 'Simulated Data')
title('Experiment 3 Test 9')