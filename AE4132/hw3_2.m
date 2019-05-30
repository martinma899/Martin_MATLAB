clc;clear;close all

A = [1 0 0 0;0 1 0 0;1 1 1 1;0 1 2 3];

C = inv(A)';

syms x xalt

% element 1
disp('element 1')

q0 = 0;
xa = 0;
he = 5;
EIe = 2e8;

xalt = 1/he*(x-xa);
phiarr = C*[xalt.^0;xalt.^1;xalt.^2;xalt.^3];
phiarrdd = diff(diff(phiarr,x),x);

K1 = zeros(4,4);
for i = 1:4
  for j = 1:4
    integral = int(phiarrdd(i)*phiarrdd(j)*EIe,x,xa,xa+he);
    K1(i,j) = double(integral);
  end
end
disp(K1)

f1 = zeros(4,1);
for i = 1:4
  integral = int(phiarr(i)*q0,x,xa,xa+he);
  f1(i) = double(integral);
end
disp(f1)

% element 2
disp('element 2')

q0 = 0;
xa = 5;
he = 5;
EIe = 2e8;

xalt = 1/he*(x-xa);
phiarr = C*[xalt.^0;xalt.^1;xalt.^2;xalt.^3];
phiarrdd = diff(diff(phiarr,x),x);

K2 = zeros(4,4);
for i = 1:4
  for j = 1:4
    integral = int(phiarrdd(i)*phiarrdd(j)*EIe,x,xa,xa+he);
    K2(i,j) = double(integral);
  end
end
disp(K2)

f2 = zeros(4,1);
for i = 1:4
  integral = int(phiarr(i)*q0,x,xa,xa+he);
  f2(i) = double(integral);
end
disp(f2)

% element 3
disp('element 3')

q0 = -500;
xa = 10;
he = 5;
EIe = 2e8;

xalt = 1/he*(x-xa);
phiarr = C*[xalt.^0;xalt.^1;xalt.^2;xalt.^3];
phiarrdd = diff(diff(phiarr,x),x);

K3 = zeros(4,4);
for i = 1:4
  for j = 1:4
    integral = int(phiarrdd(i)*phiarrdd(j)*EIe,x,xa,xa+he);
    K3(i,j) = double(integral);
  end
end
disp(K3)

f3 = zeros(4,1);
for i = 1:4
  integral = int(phiarr(i)*q0,x,xa,xa+he);
  f3(i) = double(integral);
end
disp(f3)

% element 4
disp('element 4')

q0 = -500;
xa = 15;
he = 5;
EIe = 2e8;

xalt = 1/he*(x-xa);
phiarr = C*[xalt.^0;xalt.^1;xalt.^2;xalt.^3];
phiarrdd = diff(diff(phiarr,x),x);

K4 = zeros(4,4);
for i = 1:4
  for j = 1:4
    integral = int(phiarrdd(i)*phiarrdd(j)*EIe,x,xa,xa+he);
    K4(i,j) = double(integral);
  end
end
disp(K4)

f4 = zeros(4,1);
for i = 1:4
  integral = int(phiarr(i)*q0,x,xa,xa+he);
  f4(i) = double(integral);
end
disp(f4)

K = zeros(10,10);
K(1:4,1:4) = K(1:4,1:4)+K1;
K(3:6,3:6) = K(3:6,3:6)+K2;
K(5:8,5:8) = K(5:8,5:8)+K3;
K(7:10,7:10) = K(7:10,7:10)+K4;

f = zeros(10,1);
f(1:4) = f(1:4)+f1;
f(3:6) = f(3:6)+f2;
f(5:8) = f(5:8)+f3;
f(7:10) = f(7:10)+f4;

F0 = 1000;
M0 = 1000;
Qpartial = [0;-F0;M0;0;0;0;0;0];

wpartial = inv(K([2:6,8:10],[2:6,8:10]))*(f([2:6,8:10])+Qpartial)
w = zeros(10,1);
w(2:6) = wpartial(1:5);
w(8:10) = wpartial(6:8);

F1 = K(1,:)*w-f(1)
F4 = K(7,:)*w-f(7)