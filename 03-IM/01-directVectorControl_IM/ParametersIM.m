clear all
clc
%input
%supply
Vm=(400*(2^0.5))/(3^0.5);             % Volt
Frequency=50;     % HZ
Phase_shift=0;    % degree
%Torque
TL=26;             % N/m^2    Full Load Torque

%Reference Fram Speed
Wf=2*pi*50;

% Machine Parameters
%Stator Parameters
Rs=1.405;
Lls=0.005839;
%Rotor Parameters
Rr=1.395;
Llr=0.005839;
%Mutual Parameters
Lm=0.1722;
Lr=Llr+Lm;
Ls=Lls+Lm;
%Mechanical Parameters
B = 0.002985;
J = 0.0131;
%No. Of Poles
P = 4;
tlr=Llr/Rr;
tr=Lr/Rr;

Delta=0.1;
Vdc=700;
Nm=1400;
Rotor_Flux=.9;
Airgap_Flux=.48;
Ts=1/1000;
TS=1/1000;
car_freq=1000;
Delta=0.1;

