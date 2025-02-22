clc;
clear;

%motor parameters
Va=240;
La=.1215;
Ra=11.2;
Vf=300;
Lf=156;
Rf=281.2;
Maf=1.976;
J=.02215;
B=.002953;
Bm=0.001;
P=2;
Kf=(P/2)*(Vf/Rf)*Maf;

%converter
Vp_peak= 120;
Fs=50;
Vp_rms=Vp_peak/sqrt(2);
Vll_rms=sqrt(3)*Vp_rms;
Vcm=3*sqrt(3)*Vll_rms/pi;
K_conv=((3*sqrt(3))/pi)*(Vll_rms/Vcm);
NoPulsesRectifier=6;
T_conv=.5*(1/NoPulsesRectifier)*(1/Fs);

%transfer Functions
s=tf('s');
Giv=(Bm+B+J*s)/((Ra+La*s)*(Bm+B+J*s)+Kf^2);
Gwi=Kf/(Bm+B+J*s);