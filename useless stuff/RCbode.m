R = 1000;
C = 0.22e-6;
res = 10000;
omega = linspace(0,100000,res);
f = omega/(2*pi);

H = (1./((1i*omega*C*R)+1));
Hmag = abs(H);
dB = 20*log10(Hmag);

Hmag = abs(H);
phase = angle(H)/pi*180;

period = 2*pi./omega;
deltat = 1e6.*-phase./360.*period;

subplot(2,1,1);
semilogx(omega,dB,'b.');
subplot(2,1,2);
semilogx(omega,phase,'b.');