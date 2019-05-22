clc;clear
Itop = 8*0.875^3/12;
Imiddle = (22-0.875*2)^3*0.625/12;
I = 2*(Itop+((22-0.875)/2)^2*8*0.875)+Imiddle
I = I/12^4
Mmax = 9000*16
y = 22/2/12
sigmaxmax = Mmax*y/I
sigmaxmax/144