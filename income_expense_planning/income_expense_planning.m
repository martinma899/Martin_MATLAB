clc;clear;close all
% a is age
% aws is age starting to work
aws = 23;
% aret is age at which we retire
aret = 70;

% wstr is starting wage at aws
wstr = 72000;

% rwh is pay raise you get each year best case scenario
rwh = 0.055;

% rwl is pay rase you get each year worse case scenario
rwl = 0.03;

% a is age vector
a = aws : aret;

% wh is high expectation of wage
wh = zeros(1,aret-aws+1);
wl = wh;

% first year is starting wage
wh(1) = wstr;
wl(1) = wstr;

% calculate each year after that
for i = 2:numel(a)
  wh(i)=wh(i-1)*(1+rwh);
  wl(i)=wl(i-1)*(1+rwl);
end

figure
hold on
grid on
plot(a,wh,'r.-')
plot(a,wl,'b.-')
legend('5.5% annual raise wage','2% annual raise wage')

% calculate cumulative total income
whc = cumsum(wh);
wlc = cumsum(wl);

figure(2)
hold on
grid on
plot(a,whc,'r.-')
plot(a,wlc,'b.-')
legend('5.5% annual raise cumulative earning','2% annual raise cumulative earning')

% estimate yearly cost of living col
col = -45000*ones(1,aret-aws+1);

% estimate total net worth by year
nwh = cumsum(wh+col);
nwl = cumsum(wl+col);

figure(3)
hold on
grid on
plot(a,nwh,'r.-')
plot(a,nwl,'b.-')
legend('5.5% annual raise net worth','2% annual raise net worth')

% what if we invest all this net worth into a 7% growth commodity?
nwhi = nwh;
nwli = nwl;
apr = 0.07;
for i = 2:numel(a)
  nwhi(i)=nwh(i-1)*(1+apr)+nwhi(i);
  nwli(i)=nwl(i-1)*(1+apr)+nwli(i);
end

fig = figure(4);
hold on
grid on
plot(a,nwhi,'r.-')
plot(a,nwli,'b.-')
fig.CurrentAxes.YScale = 'log';
legend('5.5% annual raise net worth if invest all into 7%','2% annual raise net worth if invest all into 7%')













