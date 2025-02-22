clc;
clear;

%supply
Vdc=600;
Freq=60;
Fs=5000;
P=4;

%space Vector
Vs_max=Vdc/sqrt(3);

%stator voltage
VLL_rms=460;
VLL_p=VLL_rms*sqrt(2);
Vph_p=VLL_p/sqrt(3);
Vph_rms=Vph_p/sqrt(2);
P_rated=5*746;
I_rated=P_rated/(sqrt(3)*VLL_rms*.9*.9);
I_smax=2.5*I_rated;

%rotor rated speed
Nr_rated=1750;
Wr_base=Nr_rated*(pi/30);

%synch. rated speed
Ws_rated=(120*Freq/P)*(pi/30);
Wslip_rated=Ws_rated-Wr_base;

Prated=746*5;
Te_rated=Prated/Wr_base;


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
lambda_r_rated=0.94;

%First Region: MTPA
Id_rated=lambda_r_rated/Lm;
Iq_max=sqrt(I_rated^2-Id_rated^2);
%second Region: VA constant region 
Wbase_FWI=(sqrt(Vs_max^2*((Ls*Id_rated)^2+(sigma*Ls*Iq_max)^2)^2+...
    (Rs*Id_rated*Iq_max*(Ls-sigma*Ls))^2)-Rs*Id_rated*Iq_max*...
    (Ls-sigma*Ls))/((Ls*Id_rated)^2+(sigma*Ls*Iq_max)^2);
Wbase_FW_RegionI=Wbase_FWI/(P/2);
%third region: MTPV
W_BT=sqrt((1+sigma^2)/(2*(sigma*Ls)^2))*(Vs_max/I_rated);
W_BT_RegionII=W_BT/(P/2);

%Mechanical Parameters
J=.02;              
B=.005752;

%for current mode
Delta=0.1;
