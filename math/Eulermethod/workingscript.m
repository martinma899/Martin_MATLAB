close all
hold on
x0 = 1;
y0 = 1;
%% euler's method h = 0.1
% define constants
h = 0.1;
t = 0:h:1;
% start calculation
x = [x0];
y = [y0];
for i = t
    xn = x(end);
    yn = y(end);
    tn = i;
    fn = xeq(tn,xn,yn);
    gn = yeq(tn,xn,yn);
    xnplus1 = xn+h*fn;
    ynplus1 = yn+h*gn;
    x = [x xnplus1];
    y = [y ynplus1];
end
x(end) = [];
y(end) = [];
% plot
plot(x,y,'b')
% wrap up work
[~,ind,~] = intersect(t,[0.2 0.4 0.6 0.8 1.0]);
xinterest = x(ind);
yinterest = y(ind);
%% runge-kutta h = 0.2
% define constants
h = 0.2;
t = 0:h:1;
% start calculation
x1 = [x0];
y1 = [y0];
for i = t
    xn = x1(end);
    yn = y1(end);
    tn = i;
    fn = xeq(tn,xn,yn);
    gn = yeq(tn,xn,yn);
    fnplush = xeq(tn+h,xn+h*fn,yn+h*gn);
    gnplush = yeq(tn+h,xn+h*fn,yn+h*gn);
    xnplus1 = xn+h*(fn+fnplush)/2;
    ynplus1 = yn+h*(gn+fnplush)/2;
    x1 = [x1 xnplus1];
    y1 = [y1 ynplus1];
end
x1(end) = [];
y1(end) = [];
plot(x1,y1,'r')
% wrap up work
[~,ind,~] = intersect(t,[0.2 0.4 0.6 0.8 1.0]);
x1interest = x1(ind);
y1interest = y1(ind);
%% runge-kutta h = 0.1
% define constants
h = 0.1;
t = 0:h:1;
% start calculation
x2 = [x0];
y2 = [y0];
for i = t
    xn = x2(end);
    yn = y2(end);
    tn = i;
    fn = xeq(tn,xn,yn);
    gn = yeq(tn,xn,yn);
    fnplush = xeq(tn+h,xn+h*fn,yn+h*gn);
    gnplush = yeq(tn+h,xn+h*fn,yn+h*gn);
    xnplus1 = xn+h*(fn+fnplush)/2;
    ynplus1 = yn+h*(gn+fnplush)/2;
    x2 = [x2 xnplus1];
    y2 = [y2 ynplus1];
end
x2(end) = [];
y2(end) = [];
plot(x2,y2,'k')
% wrap up work
[~,ind,~] = intersect(t,[0.2 0.4 0.6 0.8 1.0]);
x2interest = x2(ind);
y2interest = y2(ind);
%% publish to excel and wrap up
legend('Euler''s method h = 0.1','Implicit Euler h = 0.2',...
'Implicit Euler h = 0.1')
hold off

xarr = [xinterest;x1interest;x2interest];
yarr = [yinterest;y1interest;y2interest];




















