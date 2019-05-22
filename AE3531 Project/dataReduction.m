clear;close all

data1 = csvread('PIDdata1.csv',1,0)

Hz = 100;
dt = 1/Hz;

th = data1(:,1);
u = data1(:,2);
u = smooth(u,10);

thd = zeros(numel(th),1);

for i = 1:numel(th)
  if i == 1
    thd(i) = (th(i+1)-th(i))/dt;
  elseif i == numel(th)
    thd(i) = (th(i)-th(i-1))/dt;
  else
    thd(i) = (th(i+1)-th(i-1))/(2*dt);
  end
end

thd = smooth(thd,10);

thdd = zeros(numel(thd),1);
for i = 1:numel(thd)
  if i == 1
    thdd(i) = (thd(i+1)-thd(i))/dt;
  elseif i == numel(thd)
    thdd(i) = (thd(i)-thd(i-1))/dt;
  else
    thdd(i) = (thd(i+1)-thd(i-1))/(2*dt);
  end
end

thdd = smooth(thdd,10);

% now start the magic

A = [cosd(th) u th ones(numel(th),1), thd];
b = thdd/180*pi;

cvec = (A'*A)^(-1)*A'*b

err = A*cvec-b

plot(th)
hold on
plot(thd)
plot(thdd)
plot(A*cvec-b)
legend('th','thd','thdd','err')
