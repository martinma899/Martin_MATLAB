clc;clear;close all

x0 = [-2;2];
s1 = [1;0];
alpha1 = 0;
alpha2 = 1;
alpha3 = 2;



f1 = Rosenbrock(x0+s1*alpha1)
f2 = Rosenbrock(x0+s1*alpha2)
f3 = Rosenbrock(x0+s1*alpha3)

b2 = ((f3-f1)/(alpha3-alpha1)-(f2-f1)/(alpha2-alpha1))/(alpha3-alpha2)
b1 = (f2-f1)/(alpha2-alpha1)-b2*(alpha1+alpha2)
b0 = f1-b1*alpha1-b2*alpha1^2

alphastar = -b1/(2*b2)

alphaarr0 = linspace(alpha1,alpha3,101);
surrogatef = b0+b1.*alphaarr0+b2.*alphaarr0.^2;


alphaarr1 = linspace(0,4,101);
alphaarr2 = [0 0.5888 1 2 3.4137];

% farr1 = Rosenbrock()

farr1 = Rosenbrock(x0+s1*alphaarr1);
farr2 = Rosenbrock(x0+s1*alphaarr2);


hold on
plot(alphaarr0,surrogatef,'r.-')
plot(alphaarr1,farr1,'b.-')
plot(alphaarr2,farr2,'rd')