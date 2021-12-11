close all; clear all; clc;

[t1,traj1,disp1]=readf3('e2t3.txt');
[t2,traj2,disp2]=readf3('e2t2.txt');

figure;
plot(t1,disp1,'r')
hold on
plot(t2,disp2,'b')

relevantDisp = abs(3.0450 - disp1(1360:end));
xlabel('Time (s)')
ylabel('Displacement (mm)')
legend('Experiment 2 Test 3', 'Experiment 2 Test 2 (Baseline)')

% 3.0450 is the steady state value determined in Experiment 2 Test 2

maxPercentDisp = 100 * max(relevantDisp)/3.0450