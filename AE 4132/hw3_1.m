clc;clear;close all

A = [1 0 0 0;0 1 0 0;1 1 1 1;0 1 2 3];

C = inv(A)';

syms x xalt

% element 1
disp('element 1')

q0 = -10e3;
xa = 0;
he = 4;
EIe = 2*50e6;

xalt = 1/he*(x-xa);

phiarr = C*[xalt.^0;xalt.^1;xalt.^2;xalt.^3]

phiarrdd = diff(diff(phiarr,x),x)

K1 = zeros(4,4);

for i = 1:4
  for j = 1:4
    integral = int(phiarrdd(i)*phiarrdd(j)*EIe,x,xa,xa+he);
    K1(i,j) = double(integral);
  end
end

f1 = zeros(4,1);

for i = 1:4
  integral = int(phiarr(i)*q0,x,xa,xa+he);
  f1(i) = double(integral);
end

% element 2
disp('element 2')

q0 = 0;
xa = 4;
he = 4;
EIe = 50e6;

xalt = 1/he*(x-xa);

phiarr = C*[xalt.^0;xalt.^1;xalt.^2;xalt.^3]

phiarrdd = diff(diff(phiarr,x),x)

K2 = zeros(4,4);

for i = 1:4
  for j = 1:4
    integral = int(phiarrdd(i)*phiarrdd(j)*EIe,x,xa,xa+he);
    K2(i,j) = double(integral);
  end
end

f2 = zeros(4,1);

for i = 1:4
  integral = int(phiarr(i)*q0,x,xa,xa+he);
  f2(i) = double(integral);
end

k = 10e6;
F0 = 5000;
M0 = 0.5*5000;

K = zeros(6,6);

K(1:4,1:4) = K(1:4,1:4)+K1;
K(3:6,3:6) = K(3:6,3:6)+K2;
K(5,5) = K(5,5)+k;

f = zeros(6,1);
f(1:4,:) = f(1:4,:)+f1;
f(3:6,:) = f(3:6,:)+f2;


unknownvars = inv(K(3:6,3:6))*(f(3:6,1)+[-F0;-M0;0;0])
forcevec = -(K(1:2,3:6)*unknownvars-f(1:2,1))
