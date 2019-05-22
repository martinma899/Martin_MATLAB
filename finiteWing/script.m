clc;clear

S = 200;
b = 40;
ch = S/b
alfa0 = 0;
alfa = 4/180*pi;
AR = b^2/S;

t1 = pi/2;
t2 = pi/4;

M = [];

% t = linspace(0,pi,100+2);
% t(1) = [];
% t(end) = [];

t = [ pi/2];

% a = 2*b*sin(t1)/(pi*ch)+1*sin(1*t1)/sin(t1)
% b = 2*b*sin(3*t1)/(pi*ch)+3*sin(3*t1)/sin(t1)
% c = 2*b*sin(t2)/(pi*ch)+1*sin(1*t2)/sin(t2)
% d = 2*b*sin(3*t2)/(pi*ch)+3*sin(3*t2)/sin(t2)

for i = 1:numel(t)
  rowi = [];
  tt = t(i);
  for j = 1:numel(t)
    n = j*2-1
    term = 2*b*sin(n*tt)/(pi*ch)+n*sin(n*tt)/sin(tt);
    rowi = [rowi term];
  end
  M = [M;rowi];
end

Avec = inv(M)*(zeros(numel(t),1)+alfa);
A1 = Avec(1)
%A3 = Avec(2)
A3 = 0
CL = A1*pi*AR

Cl = 2*pi*alfa
CDi=pi*AR*A1^2*(1+3*A3^2/A1^2)
