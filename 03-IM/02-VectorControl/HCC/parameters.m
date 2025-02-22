clc;
clear;

%supply
Vdc=400;
Freq=60;
Fs=5000;
P=4;

%stator voltage
VLL_rms=460;
VLL_p=VLL_rms*sqrt(2);
Vph_p=VLL_p/sqrt(3);
Vph_rms=Vph_p/sqrt(2);

%rotor rated speed
Nr_rated=1750;
Wr_rated=Nr_rated*(pi/30);
ten_percent=.1*Nr_rated;

%synch. rated speed
Ws_rated=(120*Freq/P)*(pi/30);
Wslip_rated=Ws_rated-Wr_rated;

Prated=746*5;
Te_rated=Prated/Wr_rated;


%Stator Parameters
Lls=.005974;
Lm=.2037;
Ls=Lm+Lls;
Rs=1.115;
Ts=Ls/Rs;

%Rotor Parameters
Llr=.005974;
Lr=Lm+Llr;
Rr=1.083;
Tr=Lr/Rr;

%other symbols
sigma=1-((Lm)^2)/(Lr*Ls);
lambda_r_rated=(Vph_rms/(2*pi*Freq))*(1-sigma);

%Mechanical Parameters
J=.02;
B=.005752;

%for current mode
Delta=0.1;
