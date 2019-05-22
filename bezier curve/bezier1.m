clc;clear;close all
% the purpose of this script is to demonstrate bezier curve. 
% all points in this script are column vectors
P1 = [0;0];
P2 = [8;1.5];
P3 = [4;3];
P4 = [2;6];
n = 3;
res = 101;
t = linspace(0,1,res)';

switch n
  case 2
    Bmat = [1 0 0;-2 2 0;1 -2 1];
  case 3
    Bmat = [1 0 0 0;-3 3 0 0;3 -6 3 0;-1 3 -3 1];
end

Bx = [1+0*t,t,t.^2,t.^3]*Bmat...
  *[P1(1);P2(1);P3(1);P4(1)];
By = [1+0*t,t,t.^2,t.^3]*Bmat...
  *[P1(2);P2(2);P3(2);P4(2)];




hold on
plot([P1(1) P2(1) P3(1) P4(1)],[P1(2) P2(2) P3(2) P4(2)],'ro-')
plot(Bx,By,'b-')