clc;clear;close all

res = 101;
vararr = linspace(0.015,0.1,res);

itaparr = zeros(1,res);
itatarr = zeros(1,res);
itaarr = zeros(1,res);
farr = zeros(1,res);
Tpermdotaarr = zeros(1,res);
TSFCarr = zeros(1,res);

for i = 1:res
  b = vararr(i);
  turbofan;
  itaparr(i) = itap;
  itatarr(i) = itat;
  itaarr(i) = ita;
  farr(i) = f;
  Tpermdotaarr(i) = Tpermdota;
  TSFCarr(i) = TSFC;
end

figure(2)

subplot(2,2,1)
hold on
plot(vararr,itaparr)
plot(vararr,itatarr)
plot(vararr,itaarr)
legend('itap','itat','ita')

subplot(2,2,2)
plot(vararr,farr,'b.-')
title('f')

subplot(2,2,3)
plot(vararr,Tpermdotaarr)
title('Tpermdota')

subplot(2,2,4)
plot(vararr,TSFCarr)
title('TSFC')








