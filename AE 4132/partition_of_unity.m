clc;clear;hold on

for j = 1:9

  order = j;
  
subplot(3,3,j)
hold on
grid on
str = sprintf('order = %d',order);
title(str);


loc = linspace(0,1,order+1)

A = [];
for i = 0:order
  A = [A loc.^i'];
end

coeffmat = inv(A)

x = linspace(0,1,1001);

for i = 1:(order+1)
  dataarr = [];
  for j = 0:order
  dataarr = [dataarr;x.^j];
  end
  phi_i = coeffmat(:,i)'*dataarr;
  plot(x,phi_i,'.-')
end
end
% ytrue = rand([1,order+1]);
% interp_func = x*0;
% 
% for i = 1:(order+1)
%   dataarr = [];
%   for j = 0:order
%     dataarr = [dataarr;x.^j];
%   end
%   interp_func = interp_func+ytrue(i)*coeffmat(:,i)'*dataarr;
% end
% 
% plot(x,interp_func,'.-')
% plot(loc,ytrue,'bd')
% 
% grid on