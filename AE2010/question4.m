clc;clear;clf;hold on

% units are SI units
T1 = 350
T2 = 1000
P1 = 101325
P2 = 1013250
Runi = 8.3144598
deltaT = T2-T1

Cph2 = 14.31e3
Cph2o = 1.865e3
Cvh2 = 10.19e3
Cvh2o = 1.404e3

deltauh2 = Cvh2*deltaT
deltauh2o = Cvh2o*deltaT
deltahh2 = Cph2*deltaT
deltahh2o = Cph2o*deltaT

coefftable = [3.057 4.07;2.677e-3 -1.108e-3;...
              -5.180e-6 4.152e-6; 5.521e-9 -2.964e-9;...
              -1.812e-12 8.07e-13]
Ttest = 293          
Cph2test = Runi*dot(coefftable(:,1),(ones(5,1)*Ttest).^([0 1 2 3 4]'))

mwh2 = 2.016e-3
mwh2o = 18.02e-3
Rh2 = Runi/mwh2
Rh2o = Runi/mwh2o

deltahh2 = (dot(((1:5)').^-1.*coefftable(:,1),(ones(5,1)*T2).^((1:5)'))...
    -dot((((1:5)').^-1).*coefftable(:,1),(ones(5,1)*T1).^((1:5)')))*Rh2
deltahh2o = (dot(((1:5)').^-1.*coefftable(:,2),(ones(5,1)*T2).^((1:5)'))...
    -dot((((1:5)').^-1).*coefftable(:,2),(ones(5,1)*T1).^((1:5)')))*Rh2o

% coefftablealt is a programming trick to compute deltau easier. 
coefftablealt = coefftable;
coefftablealt(1,:) = coefftablealt(1,:)-1;

deltauh2 = (dot(((1:5)').^-1.*coefftablealt(:,1),(ones(5,1)*T2).^((1:5)'))...
    -dot((((1:5)').^-1).*coefftablealt(:,1),(ones(5,1)*T1).^((1:5)')))*Rh2
deltauh2o = (dot(((1:5)').^-1.*coefftablealt(:,2),(ones(5,1)*T2).^((1:5)'))...
    -dot((((1:5)').^-1).*coefftablealt(:,2),(ones(5,1)*T1).^((1:5)')))*Rh2o

% the following table is textbook table B3, H2. Second column is universal
% specific heat constant Cp, and it is immediately turned into specific. 

B3 = [28.877 29.120 29.275 29.375 29.461 29.581 29.792 30.160]/mwh2;
B3 = [300:100:1000;B3]'
B6 = [33.468 34.437 35.337 36.288 37.364 38.587 39.930 41.315]/mwh2o;
B6 = [300:100:1000;B6]'

fineTdata = linspace(350,1000,10000);
interpCph2 = interp1(B3(:,1)',B3(:,2)',fineTdata,'spline');
interpCph2o = interp1(B6(:,1)',B6(:,2)',fineTdata,'spline');

plot(B3(:,1),B3(:,2),'ro')
plot(fineTdata,interpCph2,'b-')
figure(2)
plot(B6(:,1),B6(:,2),'ro')
hold on
plot(fineTdata,interpCph2o,'b-')

deltahh2 = trapz(fineTdata,interpCph2)
deltahh2o = trapz(fineTdata,interpCph2o)
deltauh2 = trapz(fineTdata,interpCph2-Rh2)
deltauh2o = trapz(fineTdata,interpCph2o-Rh2o)