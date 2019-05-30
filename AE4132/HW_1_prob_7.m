clc;clear;close all

zi = linspace(0,1,101);

w_exact = zi.^4/24-zi.^3/12+zi/24;
M_exact = 0.5*zi.^2-0.5*zi;
V_exact = zi-1/2;

Nmax = 5;

w_ritzarr = zeros(Nmax,101);
M_ritzarr = zeros(Nmax,101);
V_ritzarr = zeros(Nmax,101);

for N = 1:Nmax
  w_ritz = zeros(1,101);
  M_ritz = zeros(1,101);
  V_ritz = zeros(1,101);
for i = 1:N
  wi = 4/((2*i-1)^5*pi^5)*sin((2*i-1)*pi*zi);
  Mi = -4/((2*i-1)^3*pi^3)*sin((2*i-1)*pi*zi);
  Vi = -4/((2*i-1)^2*pi^2)*cos((2*i-1)*pi*zi);
  w_ritz = w_ritz+wi;
  M_ritz = M_ritz+Mi;
  V_ritz = V_ritz+Vi;
end
  w_ritzarr(N,:) = w_ritz;
  M_ritzarr(N,:) = M_ritz;
  V_ritzarr(N,:) = V_ritz;
end

figure(1)
hold on
plot(zi,w_exact,'k.-')
for N = 1:Nmax
  plot(zi,w_ritzarr(N,:))
end
title('Problem 7 w plot')
xlabel('zi')
ylabel('normalized w')
legend('exact', 'ritz N=1', 'ritz N=2', 'ritz N=3', 'ritz N=4', 'ritz N=5')
grid on

figure(2)
hold on
plot(zi,M_exact,'k.-')
for N = 1:Nmax
  plot(zi,M_ritzarr(N,:))
end
title('Problem 7 M plot')
xlabel('zi')
ylabel('normalized M')
legend('exact', 'ritz N=1', 'ritz N=2', 'ritz N=3', 'ritz N=4', 'ritz N=5')
grid on

figure(3)
hold on
plot(zi,V_exact,'k.-')
for N = 1:Nmax
  plot(zi,V_ritzarr(N,:))
end
title('Problem 7 V plot')
xlabel('zi')
ylabel('normalized V')
legend('exact', 'ritz N=1', 'ritz N=2', 'ritz N=3', 'ritz N=4', 'ritz N=5')
grid on

