clc;
clear;

%**************motor parameters*************
%armatrure
Va=240;
La=.028;
Ra=2.581;
%field
Vf=300;
Lf=156;
Rf=281.2;
%mutual
Maf=0.9483;
%mechanical
J=.02215;
B=.002953;
Bm=0.001;
P=2;
Kf=(P/2)*(Vf/Rf)*Maf;
Bt=B+Bm;

%converter
Fc=5000;
Vdc=240;
Vtri=1;
Kc=Vdc/(Vtri);
Tc=1/(2*Fc);