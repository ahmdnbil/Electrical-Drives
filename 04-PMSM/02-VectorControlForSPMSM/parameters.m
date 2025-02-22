clc;
clear;

%input supply
Vdc=550;
Vph_p=220*sqrt(2);
Vph_rms=Vph_p/sqrt(2);
F=50;
Fs=20000;
Ws=2*pi*Fs;

%stator parameters
Rs=0.43;
Ls=3.2*10^(-3);
Lqs=Ls;
Lds=Ls;

%Rotor Parameters
Lambda_m=0.085;

%Mechanical parameters
J=0.0018;
B=0.0002;
P=8;