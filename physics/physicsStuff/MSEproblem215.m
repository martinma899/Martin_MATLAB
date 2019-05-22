close all

r = linspace(0,1,10000);
EA = -1.436./r;
ER = 7.32e-6./r.^8;
EN = EA+ER;

boundary = [-10 10];

EA(EA<boundary(1)) = boundary(1);
EN(EN>boundary(2)) = boundary(2);
ER(ER>boundary(2)) = boundary(2);

[ENmin,ENminind] = min(EN);
r0 = r(ENminind);

hold on
plot(r,EA,'b')
plot(r,ER,'r')
plot(r,EN,'m')
xlabel('r/nm')
ylabel('energy')
legend('EA','ER','EN')
plot(r,r*0,'k')
plot(r0,ENmin,'mo')