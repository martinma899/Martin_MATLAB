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
nozzleMix = true;
design = 'cruise';
takeoff = true;
titleStr2ndhalf = sprintf('\nB = 5 b = 0.12 Prf = 2\nMixed Nozzle Ta = 288.2K Pa = 101.3kPa M = 0');

labelsBool = false;

Tpermdotaeffarr = zeros(1,res2);
TSFCeffarr = zeros(1,res2);
uearr = zeros(1,res2);
farr = zeros(1,res2);
itapeffarr = zeros(1,res2);
itaqeffarr = zeros(1,res2);
itaeffarr = zeros(1,res2);
PowerComparr = zeros(1,res2);
PowerFanarr = zeros(1,res2);

for i = 1:res2
  Prc = Prcvec(i);
  %B = Bvec(i);
  turbofan;
  Tpermdotaeffarr(i) = Tpermdotaeff;
  TSFCeffarr(i) = TSFCeff;
  uearr(i) = ue;
  farr(i) = f;
  itapeffarr(i) = itapeff;
  itaqeffarr(i) = itaqeff;
  itaeffarr(i) = itaeff;
  PowerComparr(i) = PowerComp;
  PowerFanarr(i) = PowerFan;
  
%   colorFacA = (i/res2+0.3)/1.3;
%   colorFacB = 1-colorFacA;
%   P_Color = colorFacB*[1 1 1]+colorFacA*[0 0 1];
%   T_Color = colorFacB*[1 1 1]+colorFacA*[1 0 0];
%   B_Color = [0 0 0];
%   plotPTvalues;
end

B = 5;
b = 0.12;
Prc = 12.5;
Prf = 2;
turbofan;
% 
% P_Color = [0 0 0];
% T_Color = [0 0 0];
% B_Color = [0 0 0];
% labelsBool = true;
% plotPTvalues;
% figure(1)
% titleStr = sprintf('Engine Temperature for different Prc values%s',titleStr2ndhalf);
% title(titleStr);
% grid on
% figure(2)
% titleStr = sprintf('Engine Pressure for different Prc values%s',titleStr2ndhalf);
% title(titleStr);
% grid on


figure(1)
hold on
plot(Prcvec,Tpermdotaeffarr/1000,'k.-')
plot(Prc,Tpermdotaeff/1000,'ro')
text(Prc,Tpermdotaeff/1000,'    \leftarrow Design Point')
titleStr = sprintf('Prc vs effective specific thrust%s',titleStr2ndhalf);
title(titleStr);
xlabel('Prc / unitless')
ylabel('Tpermdotaeff / kN-s/kg')
grid on

figure(2)
hold on
plot(Prcvec,TSFCeffarr*1000,'k.-')
plot(Prc,TSFCeff*1000,'ro')
text(Prc,TSFCeff*1000,'    \leftarrow Design Point')
titleStr = sprintf('Prc vs effective TSFC%s',titleStr2ndhalf);
title(titleStr);
xlabel('Prc / unitless')
ylabel('TSFCeff / kg/kN-s')
grid on

figure(3)
hold on
plot(Prcvec,uearr,'k.-')
plot(Prc,ue,'ro')
text(Prc,ue,'    \leftarrow Design Point')
titleStr = sprintf('Prc vs ue%s',titleStr2ndhalf);
title(titleStr);
xlabel('Prc / unitless')
ylabel('ue / m/s')
grid on

figure(4)
hold on
plot(Prcvec,farr,'k.-')
plot(Prc,f,'ro')
text(Prc,f,'    \leftarrow Design Point')
titleStr = sprintf('Prc vs f%s',titleStr2ndhalf);
title(titleStr);
xlabel('Prc / unitless')
ylabel('f / unitless')
grid on
% 
figure(5)
hold on
plot(Prcvec,itaeffarr,'k.-')
legend('effective efficiency = effective thermal efficiency')
plot(Prc,itaeff,'ro')
text(Prc,itaeff,'    \leftarrow Design Point')
titleStr = sprintf('Prc vs effective efficiency%s',titleStr2ndhalf);
title(titleStr);
xlabel('Prc / unitless')
ylabel('Efficiency / unitless')
grid on

figure(6)
hold on
plot(Prcvec,PowerComparr/1000,'k.-')
plot(Prc,PowerComp/1000,'ro')
text(Prc,PowerComp/1000,'    \leftarrow Design Point')
titleStr = sprintf('Prc vs Compressor - HP turbine shaft power%s',titleStr2ndhalf);
title(titleStr);
xlabel('Prc / unitless')
ylabel('Shaft Power / kJ/kg')
grid on

figure(7)
hold on
plot(Prcvec,PowerFanarr/1000,'k.-')
plot(Prc,PowerFan/1000,'ro')
text(Prc,PowerFan/1000,'    \leftarrow Design Point')
titleStr = sprintf('Prc vs Fan - LP turbine shaft power%s',titleStr2ndhalf);
title(titleStr);
xlabel('Prc / unitless')
ylabel('Shaft Power / kJ/kg')
grid on