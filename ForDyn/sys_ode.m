% ReDySim sys_ode. This module contains ODE of system under study
% Contibutors: Dr. Suril Shah and Prof S. K. Saha @IIT Delhi

function dy=sys_ode(t,y,Tp)
%Input data
[n nq alp a b bt dx dy dz al alt m g  Icxx Icyy Iczz Icxy Icyz Iczx]=inputs();
q=y(1:6);
th=y(6:6+n-1);
nqn=6+n;
dq=y(nqn:nqn+6-1);
dth=y(nqn+6-1:2*(n+6-1));
disp(t);

%Joint Torque 
[tu_q tu_th] = torque(t, n, Tp, q, th, dq, dth);
tue=[tu_q; tu_th];
% Differential equation

%Method 1:Direct method
[ddy]=fordyn_float(q, dq, th, dth, n,alp,a,b,bt,dx,dy,dz,al, alt, m,g,Icxx,Icyy,Iczz,Icxy,Icyz,Iczx, tu_q,tu_th);
dy=zeros(2*(n+6-1)+1,1);
dy(1:n+6-1)=y(n+6:2*(n+6-1));
dy(n+6:2*(n+6-1))=ddy;

% deriv of joint energy
dy(2*(n+6-1)+1)=-tue'*dy(1:n+6-1);
%%%%%%%%%%%%%%%%%%% hopon.m ends %%%%%%%%%%%%%%%%%%%%