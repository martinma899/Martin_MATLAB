clc;clear

clc;clear;close all

A = [-0.045 0.036 0 -32.2;
     -0.369 -2.02 176 0;
     0.0019 -0.0396 -2.9480 0;
     0 0 1 0];

B = [0;-10;-2.8;0];
   
soln = rref([A(:,1:2) A(:,4) B])

% u = 176+soln(1,4)
% w = soln(2,4)
% deapp = soln(3,4)
% alpha = atand(-1*w/u)
% gamma = -4-alpha

syms deltaeapp
% assume(deltaeapp,'real')

deltaeappsoln = double(solve(-0.4622*deltaeapp+57.0286*deltaeapp/(285.0887*deltaeapp+176)==-4*pi/180,deltaeapp))

othervariables = -soln(1:3,4)*deltaeappsoln';
othervariables(3,:) = othervariables(3,:)/pi*180
alphas = (othervariables(2,:)./(othervariables(1,:)+176))*180/pi
unow = othervariables(1,:)+176

% part 2

soln = rref([A(:,1:2) B -A(:,4)*12*pi/180])
deltaerot = soln(3,4)

% part 3

C = eye(4);

D = 0;

sys = ss(A,B,C,D);

t = linspace(0,350,30001);
x0 = [0;0;0;0];

deltae = t*0;
t1 = 0; % apply first elevator setting
t2 = 320; % apply second elevator setting

deltae(t>=t1) = deltaeappsoln(1);
deltae(t>=t2) = deltaerot;

[out,t,~] = lsim(sys,deltae,t,x0); 

xdot = cos(out(:,4)).*(out(:,1)+176)+sin(out(:,4)).*out(:,2);
ydot = -sin(out(:,4)).*(out(:,1)+176)+cos(out(:,4)).*out(:,2);

x = cumtrapz(t,xdot);
y = -cumtrapz(t,ydot)+2000;

subplot(3,1,1)
plot(x,y,'b.')
grid on
xlabel('x position (ft)')
ylabel('altitude (ft)')
subplot(3,1,2)
plot(x,out(:,4)/pi*180,'b.')
xlabel('x position (ft)')
ylabel('pitch angle (deg)')
subplot(3,1,3)
plot(x,atand(out(:,2)./(out(:,1)+176)),'b.')
xlabel('x position (ft)')
ylabel('angle of attack (deg)')


