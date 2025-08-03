clc;
clear;

P=4;
Fs=5e3;
%stator voltage
VLL_rms=460;
VLL_p=VLL_rms*sqrt(2);
Vph_p=VLL_p/sqrt(3);
Freq=60;

%rotor rated speed
Nr_rated=1750;
Wr_rated=Nr_rated*(pi/30);

%synch. rated speed
Ws_rated=(120*Freq/P)*(pi/30);
Wslip_rated=Ws_rated-Wr_rated;

Prated=746*5;
Te_rated=Prated/Wr_rated;

%calculation of boost voltage
VF_ratio=Vph_p/Freq;
VF_boost=VF_ratio*1.5;
slope=(Vph_p-VF_boost)/(Freq-1);
offset=Vph_p-(slope*Freq);

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

%Mechanical Parameters
J=.02;
B=.005752;

