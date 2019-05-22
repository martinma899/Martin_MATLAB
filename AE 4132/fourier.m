clc;clear

n = 500;

kvec = [1:n]';
a = 1;
bkvec = -2*a./(kvec*pi).*(cos(kvec*pi)-1)



xvec = linspace(-pi,pi,3001);

fvec = [];

for x = xvec
  fvec = [fvec; sum(bkvec.*sin(kvec*x))];
end

plot(xvec,fvec)