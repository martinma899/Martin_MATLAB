clc;clear;close all
hold on

res2 = 101;
B = 5;
b = 0.12;
Prc = 12.5;
Prf = 2;
Prcvariation = 5;

Prcvec = linspace(Prc-Prcvariation,Prc+Prcvariation,res2);
Bvec = linspace(2,8,res2);
[PP,BB] = meshgrid(Prcvec,Bvec);
optvararr = PP*0;

nozzleMix = true;
design = 'poo';
takeoff = true;
titleStr2ndhalf = sprintf('\nB = 5 b = 0.12 Prf = 2 Mixed Nozzle');

labelsBool = false;

% Tpermdotaeffarr = zeros(2,res2);
% TSFCeffarr = zeros(2,res2);
% itaeffarr = zeros(2,res2);

for i = 1:numel(PP)
  Prc = PP(i);
  B = BB(i);
  takeoff = true;
  turbofan;
  optvar1 = Tpermdotaeff*itaqeff/TSFCeff;
  takeoff = false;
  turbofan;
  optvar2 = Tpermdotaeff*itaeff/TSFCeff;
  optvar = optvar1^0.2*optvar2^0.8;
  optvararr(i) = optvar;
end

%39604238.0896596


B = 5;
b = 0.12;
Prc = 12.5;
Prf = 2;

figure(1)
hold on

mesh(BB,PP,optvararr);
plot3(BB(51,51),PP(51,51),optvararr(51,51),'ro')
text(BB(51,51),PP(51,51),optvararr(51,51),'    \leftarrow Design Point')
titleStr = sprintf('B vs optimization variables%s',titleStr2ndhalf);
title(titleStr);
xlabel('B')
ylabel('Prc')
grid on









