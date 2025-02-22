clc;
clear;

%input supply
Vdc=550;
Vph_p=220*sqrt(2);
Vph_rms=Vph_p/sqrt(2);
F=50;
Fs=10000;
Fs_rad=2*pi*Fs;

%stator parameters
Rs=2.48;
Lqs=.075;
Lds=.114;

%Rotor Parameters
Lambda_m=0.193;

%Mechanical parameters
J=0.00015;
B=0.0001;
P=4;