% ReDySim main module. Use this module to run your program
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function [] = run_me(robot_make)
%Use this file to run your program
close all;
clc;
%Run the main code
runinv;
%Plots the joint motion
plot_motion;
%Plots the joint torques
plot_tor;
%Energy Calculation
energy;
%Plots Energy Balance
plot_en;
%Momentum Calculation
momentum;
%Plots Momentum
plot_mtum;
%Animation
animate;

disp('------------------------------------------------------------------');
disp('Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi ');
disp('Thank you for using ReDySim');
disp('------------------------------------------------------------------');

data_filename = {'mtvar.dat', 'timevar.dat', 'statevar.dat'};
num_files = length(data_filename);
for curr_file_index = 1 : num_files
    copyfile(data_filename{curr_file_index}, ...
        strcat('../../test_case_data', robot_make, ...
        '/sim_data/', data_filename{curr_file_index}));
    copyfile(data_filename{curr_file_index}, ...
        strcat('../../test_case_data', robot_make, ...
        '/sim_real_data/', data_filename{curr_file_index}));
end
