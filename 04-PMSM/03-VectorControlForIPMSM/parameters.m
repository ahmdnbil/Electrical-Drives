clc;
clear;

%input supply
Vdc=300;
F=50;
Fs=100000;
Fbw_i=Fs/20;

%for SVPWM
Vsmax=Vdc/sqrt(3);

% Determining Ismax
Te_rated = 20;
Nm_rated=2200;
Wm_rated=Nm_rated*(pi/30);
Pelec=Te_rated*Wm_rated;
% as we know Pelec=3VsIs, assuming SVPWM Vs=300/√3
Ismax=Pelec/(3*Vsmax);


%stator parameters
Rs=.129;
Lqs=.001607;
Lds=.001453;

%PI tuning for current controller
Kp_i_q=2*pi*Fbw_i*Lqs;
Ki_i_q=2*pi*Fbw_i*Rs;
Kp_i_d=2*pi*Fbw_i*Lds;
Ki_i_d=2*pi*Fbw_i*Rs;

%Rotor Parameters
Lambda_m=.1821;

%Mechanical parameters
J=.003334;
B=0.000425;
P=8;

%%%%%% determine if φf > Ismax*Lds or φf < Ismax*Lds%%%%%%
Maximimim_stator_flux_linkage=Ismax*Lds;
if Maximimim_stator_flux_linkage> Lambda_m
    disp("φf < Ismax*Lds ")
else
    disp("φf > Ismax*Lds ")
end