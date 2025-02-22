clc;
clear;

P=4;
%supply
Vin_Amp=220*sqrt(2);
Freq=2*pi*50;
%Stator Parameters
Lls=3.495e-04;
Ls=.0357;
Lm=(Ls-Lls);
Lms=Lm;
% Ls = Lls +(3/2)Lms
Rs=.5968;
%Rotor Parameters
Llr=.0055;
Lr=.0409;
Rr=.6258;
%Mechanical Parameters
B=.005879;
J=.05;

