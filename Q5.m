close all; clear all; clc;

[t1,traj1,disp1]=readf3('e3t1.txt');
[t2,traj2,disp2]=readf3('e3t2.txt');
[t3,traj3,disp3]=readf3('e3t3.txt');

figure;
plot(t1,disp1,'r')
hold on
plot(t2,disp2,'b')
hold on
plot(t3,disp3,'g')
hold on
plot(t1,traj1,'m')
hold on
plot(t2,traj2,'-.c')
hold on
plot(t3,traj3,':y')

relevantDisp = abs(3.0450 - disp1(1360:end));
xlabel('Time (s)')
ylabel('Displacement (mm)')
legend('Experiment 3 Test 1', 'Experiment 3 Test 2', 'Experiment 3 Test 3', 'Input Trajectory 1', 'Input Trajectory 2', 'Input Trajectory 3', 'Location', 'se')

ss1 = disp1(end);
ss2 = disp2(end);
ss3 = disp3(end);

sse1 = 3 - ss1;
sse2 = 3 - ss2;
sse3 = 3 - ss3;

percentOS1 = 100 * (max(disp1) - ss1)/ss1;
percentOS2 = 100 * (max(disp2) - ss2)/ss2;
percentOS3 = 100 * (max(disp3) - ss3)/ss3;

% 90% of ss1 is 1.8230
% 90% of ss2 is 2.1805
% 90% of ss3 is 2.3314
%
% All trajectories begin at t = 1.000s (index 1000)

index1 = find(disp1 > 1.8230, 1, 'first');
index2 = find(disp2 > 2.1805, 1, 'first');
index3 = find(disp3 > 2.3314, 1, 'first');

riseTime1 = t1(index1)-t1(1000);
riseTime2 = t2(index2)-t2(1000);
riseTime3 = t3(index3)-t3(1000);

flip1 = flip(disp1);
i1 = find(flip1 > (ss1 * 1.05) | flip1 < (ss1 * 0.95) , 1, 'first');
settled1 = 11000 - i1;

flip2 = flip(disp2);
i2 = find(flip2 > (ss2 * 1.05) | flip2 < (ss2 * 0.95) , 1, 'first');
settled2 = 11000 - i2;

flip3 = flip(disp3);
i3 = find(flip3 > (ss3 * 1.05) | flip3 < (ss3 * 0.95) , 1, 'first');
settled3 = 11000 - i3;

st1 = t1(settled1)-t1(1000);
st2 = t2(settled2)-t2(1000);
st3 = t3(settled3)-t3(1000);