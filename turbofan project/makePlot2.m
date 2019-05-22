clc;clear;close all
hold on

res2 = 101;
B = 4.58993320853459;
b = 0.12;
Prc = 11.8345694089925;
Prf = 2;
Prcvariation = 5;
Prcvec = linspace(Prc-Prcvariation,Prc+Prcvariation,res2);
Bvec = linspace(2,8,res2);
nozzleMix = true;
design = 'cruise';
takeoff = true;
titleStr2ndhalf = sprintf('\nB = 5 b = 0.12 Prf = 2 Mixed Nozzle');

labelsBool = false;

Tpermdotaeffarr = zeros(2,res2);
TSFCeffarr = zeros(2,res2);
itaeffarr = zeros(2,res2);

for i = 1:res2
  Prc = Prcvec(i);
  %B = Bvec(i);
  takeoff = true;
  turbofan;
  Tpermdotaeffarr(1,i) = Tpermdotaeff;
  TSFCeffarr(1,i) = TSFCeff;
  itaeffarr(1,i) = itaqeff;
  takeoff = false;
  turbofan;
  Tpermdotaeffarr(2,i) = Tpermdotaeff;
  TSFCeffarr(2,i) = TSFCeff;
  itaeffarr(2,i) = itaeff;
end

%39604238.0896596

% takeoff
optvar1arr = Tpermdotaeffarr(1,:).*itaeffarr(1,:)./TSFCeffarr(1,:);
% cruising
optvar2arr = Tpermdotaeffarr(2,:).*itaeffarr(2,:)./TSFCeffarr(2,:);
optvararr = (optvar1arr.^0.2).*(optvar2arr.^0.8);
optvar = optvararr(51);

B = 4.58993320853459;
b = 0.12;
Prc = 11.8345694089925;
Prf = 2;

figure(2)
hold on
% plot(Prcvec,optvar1arr,'r.-')
% plot(Prcvec,optvar2arr,'b.-')
plot(Prcvec,optvararr,'k.-')
plot(Prc,optvar,'ro')
text(Prc,optvar,'    \leftarrow Design Point')
titleStr = sprintf('Prc vs optimization variables%s',titleStr2ndhalf);
title(titleStr);
xlabel('Prc / unitless')
ylabel('Optimization variable')
grid on
% 
% figure(2)
% hold on
% plot(Prcvec,TSFCeffarr*1000,'k.-')
% plot(Prc,TSFCeff*1000,'ro')
% text(Prc,TSFCeff*1000,'    \leftarrow Design Point')
% titleStr = sprintf('Prc vs effective TSFC%s',titleStr2ndhalf);
% title(titleStr);
% xlabel('Prc / unitless')
% ylabel('TSFCeff / kg/kN-s')
% grid on
% 
% figure(3)
% hold on
% plot(Prcvec,uearr,'k.-')
% plot(Prc,ue,'ro')
% text(Prc,ue,'    \leftarrow Design Point')
% titleStr = sprintf('Prc vs ue%s',titleStr2ndhalf);
% title(titleStr);
% xlabel('Prc / unitless')
% ylabel('ue / m/s')
% grid on
% 
% figure(4)
% hold on
% plot(Prcvec,farr,'k.-')
% plot(Prc,f,'ro')
% text(Prc,f,'    \leftarrow Design Point')
% titleStr = sprintf('Prc vs f%s',titleStr2ndhalf);
% title(titleStr);
% xlabel('Prc / unitless')
% ylabel('f / unitless')
% grid on
% % 
% figure(5)
% hold on
% plot(Prcvec,itaeffarr,'k.-')
% legend('effective efficiency = effective thermal efficiency')
% plot(Prc,itaeff,'ro')
% text(Prc,itaeff,'    \leftarrow Design Point')
% titleStr = sprintf('Prc vs effective efficiency%s',titleStr2ndhalf);
% title(titleStr);
% xlabel('Prc / unitless')
% ylabel('Efficiency / unitless')
% grid on
% 
% figure(6)
% hold on
% plot(Prcvec,PowerComparr/1000,'k.-')
% plot(Prc,PowerComp/1000,'ro')
% text(Prc,PowerComp/1000,'    \leftarrow Design Point')
% titleStr = sprintf('Prc vs Compressor - HP turbine shaft power%s',titleStr2ndhalf);
% title(titleStr);
% xlabel('Prc / unitless')
% ylabel('Shaft Power / kJ/kg')
% grid on
% 
% figure(7)
% hold on
% plot(Prcvec,PowerFanarr/1000,'k.-')
% plot(Prc,PowerFan/1000,'ro')
% text(Prc,PowerFan/1000,'    \leftarrow Design Point')
% titleStr = sprintf('Prc vs Fan - LP turbine shaft power%s',titleStr2ndhalf);
% title(titleStr);
% xlabel('Prc / unitless')
% ylabel('Shaft Power / kJ/kg')
% grid on