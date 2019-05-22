clc;clear;close all

order = 2;

loc = linspace(0,1,order+1);

A = [];
for i = 0:order
  A = [A loc.^i'];
end

coeffmat = inv(A)

syms h phivec xbar xa 
phivec = [];

basisvec = ((xbar/h)*ones(1,order+1)).^(0:order)

for i = 1:(order+1)
  phivec = [phivec;dot(coeffmat(:,i),basisvec)]
end

phivecd = diff(phivec,xbar)

syms K

for i = 1:(order+1)
  for j = 1:(order+1)
    integrand = phivecd(i)*phivecd(j)*(1+(xbar+xa))-phivec(i)*phivec(j)*(xbar+xa)^2;
    K(i,j) = simplify(int(integrand,xbar,0,h))
  end
end

syms f
for i = 1:(order+1)
  integrand = phivec(i)*(xbar+xa)^3;
  f(i,1) = simplify(int(integrand,xbar,0,h))
end