clc;clear;fclose('all');close all

plot_bool = false;

% load in processed data
load('lab2_system_id_data.mat');

% choose the variable
[omega_d_uu,omega_n_uu,zeta_uu] = analyzeData (upper_unloaded,20,plot_bool)
[omega_d_ul,omega_n_ul,zeta_ul] = analyzeData (upper_loaded,13,plot_bool)
[omega_d_lu,omega_n_lu,zeta_lu] = analyzeData (lower_unloaded,6,plot_bool)
[omega_d_ll,omega_n_ll,zeta_ll] = analyzeData (lower_loaded,6,plot_bool)

Jm = 2*(1/2*0.5*(5/2)^2+0.5*0.09^2)


% solve for everything upper
A = [omega_n_ul^2 -1;omega_n_uu^2 -1];
b = [-Jm*omega_n_ul^2;0];
sol = A\b;
Jdu = sol(1)
ku = sol(2)
Ju = Jm+Jdu
cu = 2*zeta_ul*Ju*omega_n_ul

% solve for everything lower
A = [omega_n_ll^2 -1;omega_n_lu^2 -1];
b = [-Jm*omega_n_ll^2;0];
sol = A\b;
Jdl = sol(1)
kl = sol(2)
Jl = Jm+Jdl
cl = 2*zeta_ll*Jl*omega_n_ll


% run verification 

m = Jl;
k = kl;
b = cl;
t0 = 0.514;
tf = 20;
x0 = 677;


% zeta = b/2/sqrt(k*m)


% upper disk simulated response
[tsimu,xsimu] = ode45(@(t,x) SMD(t,x,Ju,ku,cu),[0.947 8],[778;0]);
xsimu = xsimu(:,1);
% lower disk simulated response
[tsiml,xsiml] = ode45(@(t,x) SMD(t,x,Jl,kl,cl),[0.514 8],[677;0]);
xsiml = xsiml(:,1);

% plot
figure;hold on;grid on
plot(upper_loaded(:,1),upper_loaded(:,2),'b.-');
plot(tsimu,xsimu,'k.-');
legend('upper data','upper simulation');

figure;hold on;grid on
plot(lower_loaded(:,1),lower_loaded(:,2),'b.-');
plot(tsiml,xsiml,'k.-');
legend('lower data','lower simulation');


