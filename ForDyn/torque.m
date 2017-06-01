% ReDySim torque module. The control algorithm is entered here
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function [tu_q tu_th] = torque(t, n, tf, q, th, dq, dth)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Desired Joint trejectory
[th_d dth_d ddth_d]=trajectory(t, n, tf);

% 1: Joint level PD control
tu_q=[0;0;0;0;0;0];
kp=49; kv=14;
tu_th=kp*(th_d(2:n)-th(2:n))+kv*(dth_d(2:n)-dth(2:n));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end