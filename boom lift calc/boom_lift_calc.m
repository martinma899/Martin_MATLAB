clc;clear;close('all')

l = 25; % in
d = 18; % in
mlg = 5; % lb
mdg = 10; % lb
F = 30; % lb

y0 = -18;

ymin = 0+y0; 
ymax = 80+y0; 

f1 = figure(1);
a1 = gca;hold on;grid on; 
f2 = figure(2);
a2 = gca;hold on; grid on; 
f3 = figure(3); 
a3 = gca;hold on; grid on;

for y = linspace(ymin,ymax,101)
  
  alpha = acosd((d-y)/(2*l));
  
  A = [1 0 0 0 0 0 F+mlg;
       0 0 0 1 0 0 F*l*sind(alpha)+mlg*0.5*l*sind(alpha);
       1 -1 0 0 0 0 -mdg;
       0 0 0 1 -1 0 0;
       0 -1 1 0 0 0 mlg;
       0 0 -l*sind(alpha) 0 1 1 -mlg*0.5*l*sind(alpha)];
     
  Ared = rref(A);
  sol = Ared(:,7);
  Fc = sol(1);
  Fb = sol(2);
  R = sol(3);
  Mc = sol(4);
  Mb = sol(5);
  Ma = sol(6);
  
  plot(a1,y,Fc,'ro');
  plot(a1,y,Fb,'go');
  plot(a1,y,R,'bo');
  
  plot(a2,y,Mc,'ro');
  plot(a2,y,Mb,'go');
  plot(a2,y,Ma,'bo');
  
  plot(a3,y,alpha,'r.');
end

figure(3)
xlabel('h (in)')
ylabel('alpha (deg)')

figure(2)
legend('Mc','Mb','Ma');
xlabel('h (in)')
ylabel('moment (in-lb)')

figure(1)
legend('Fc','Fb','R')
xlabel('h (in)')
ylabel('force (lb)')

a1.YLim(1) = 0;
a2.YLim(1) = 0;

