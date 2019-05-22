clc;clear;close all

res = 501;
span = 51;
robust = true;


x = linspace(0,1,res);
y = 0.8*x.^2+0.2*x+2;
% x = x+rand(1,res)*0.005;
y = y+rand(1,res)*0.1;
y([250 350 450]) = [3 2.1 2.2];
plot(x,y,'bo')

% try to find tricube weight function of every x value
% regression value of interest: x number 51
% interval: on the entire interval.

% D = max(abs(x(51)-x(1)),abs(x(51)-x(end)));
%
% w = (1-abs((x-x(51))/D).^3).^3;
%
% figure(2)
% plot(x,w,'r.')

yreg = [];
for i = 1:res
  thisx = x(i);
  if i <= ((span-1)/2)
    v = x(1:span);
    vy = y(1:span);
  elseif (res-i+1) <= ((span-1)/2)
    v = x((res-span+1):res);
    vy = y((res-span+1):res);
  else
    v = x((i-(span-1)/2):(i+(span-1)/2));
    vy = y((i-(span-1)/2):(i+(span-1)/2));
  end
  d = max(abs(thisx-v(1)),abs(thisx-v(end)));
  w = (1-abs((v-thisx)/d).^3).^3;
  W = diag(sqrt(w));
  A = W*[v' ones(span,1)];
  b = W*vy';
  coeffs = inv(A'*A)*(A'*b);
  
  if robust
    rs = coeffs(1)*v+coeffs(2)-vy;
    MAD = median(abs(rs));
    
    w = (1-(rs./(6*MAD)).^2).^2;
    w(abs(rs)>=(6*MAD)) = 0;
    W = diag(sqrt(w));
    A = W*[v' ones(span,1)];
    b = W*vy';
    coeffs = inv(A'*A)*(A'*b);
  end
  
  yreg = [yreg coeffs(1)*thisx+coeffs(2)];
end
hold on
plot(x,yreg,'r.-')











