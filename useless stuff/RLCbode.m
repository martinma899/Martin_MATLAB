close all
R = 1000;
L = 3.3e-3;
C = 0.22e-6;
res = 100000;
omega = linspace(0,1e7,res);
f = omega/(2*pi);
Ain = 1;

Zr = R;
Zc = 1./(1i*omega*C);
Zl = 1i*omega*L;

Hr = Zr./(Zr+Zc+Zl);
Hc = Zc./(Zr+Zc+Zl);
Hl = Zl./(Zr+Zc+Zl);
Hlc= (Zl+Zc)./(Zr+Zc+Zl);

% Hmagr = abs(Hr);
% Hmagc = abs(Hc);
% Hmagl = abs(Hl);
% Hmaglc = abs(Hlc);
A = R*omega*C;
B = omega.^2*C*L;
C = 1-omega.^2*C*L;

Hmagr = A./(sqrt(A.^2+C.^2));
Hmagc = 1./(sqrt(A.^2+C.^2));
Hmagl = -B./(sqrt(A.^2+C.^2));
Hmaglc = C./(sqrt(A.^2+C.^2));

dBr = 20*log10(Hmagr);
dBc = 20*log10(Hmagc);
dBl = 20*log10(Hmagl);
dBlc = 20*log10(Hmaglc);

phaser = angle(Hr)/pi*180;
phasec = angle(Hc)/pi*180;
phasel = angle(Hl)/pi*180;
phaselc = angle(Hlc)/pi*180;

subplot(2,1,1);
semilogx(omega,dBr,'r.');
hold on
semilogx(omega,dBc,'g.');
semilogx(omega,dBl,'b.');
semilogx(omega,dBlc,'m.');
legend('R','C','L','LC')

subplot(2,1,2);
semilogx(omega,phaser,'r.');
hold on
semilogx(omega,phasec,'g.');
semilogx(omega,phasel,'b.');
semilogx(omega,phaselc,'m.');