function [time,traj,disp] = readf3(file_name)
% Reads in the data from a text file
% input: file_name - name of the file
% output: data vectors of time, force, displacement, and velocity

temp = textread(file_name,'','headerlines',22);

time = temp(:,1);
traj = temp(:,2);
disp = temp(:,3);

end 