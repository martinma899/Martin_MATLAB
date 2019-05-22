clc;clear

lambdas = [+1i 0; 0 -1i];
V = [1 1+1i;1 1-1i]';

A = V*lambdas*V^-1;

fprintf('x'' = %2.3fx+%2.3fy\n',A(1,1),A(1,2))
fprintf('y'' = %2.3fx+%2.3fy\n',A(2,1),A(2,2))