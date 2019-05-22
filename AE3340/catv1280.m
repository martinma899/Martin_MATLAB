clc;clear

% atm conditions

rho_sea = densityImperial(0)
rho_cruise = densityImperial(8500)
rho_ceil = densityImperial(15000)

g = 32.174;

% requirements

vmax = 200 * 5280/3600
vstall_sea = 80 * 5280/3600
ROC = 900
mgmax = 3000

nmax = 2
nmin = -0.5

% derived quantities

StimesCLmax = mgmax/(0.5*rho_sea*vstall_sea^2)

CLmax = 1.5
CLmin = -0.5

S = StimesCLmax/CLmax

r_min_sea = vstall_sea^2/(g*sqrt(nmax^2-1))

vstall_cruise = sqrt(mgmax/(0.5*rho_cruise*S*CLmax));

vstall_ceil = sqrt(mgmax/(0.5*rho_ceil*S*CLmax));

r_min_cruise = vstall_cruise^2/(g*sqrt(nmax^2-1));

r_min_ceil = vstall_ceil^2/(g*sqrt(nmax^2-1));

vstall_cruise_mph = vstall_cruise*3600/5280

vstall_ceil_mph = vstall_ceil*3600/5280



% draw flight envelope
% per requirement

v_req = linspace(0,vmax,101);

v_req_mph = v_req*3600/5280;

n_req_sea = 0.5*rho_sea*v_req.^2*CLmax*S/mgmax;
n_req_cruise = 0.5*rho_cruise*v_req.^2*CLmax*S/mgmax;
n_req_ceil = 0.5*rho_ceil*v_req.^2*CLmax*S/mgmax;

n_req_sea(n_req_sea>=nmax) = nmax;
n_req_cruise(n_req_cruise>=nmax) = nmax;
n_req_ceil(n_req_ceil>=nmax) = nmax;

n_req_sea_neg = -n_req_sea;
n_req_cruise_neg = -n_req_cruise;
n_req_ceil_neg = -n_req_ceil;

n_req_sea_neg(n_req_sea_neg<=nmin) = nmin;
n_req_cruise_neg(n_req_cruise_neg<=nmin) = nmin;
n_req_ceil_neg(n_req_ceil_neg<=nmin) = nmin;

% higher load factor

nmax_design = 4.5;
nmin_design = -1.5;

vmax_design = 240*5280/3600;

v_design = linspace(0,vmax_design,101);
v_design_mph = v_design*3600/5280;

n_design_sea = 0.5*rho_sea*v_design.^2*CLmax*S/mgmax;
n_design_cruise = 0.5*rho_cruise*v_design.^2*CLmax*S/mgmax;
n_design_ceil = 0.5*rho_ceil*v_design.^2*CLmax*S/mgmax;

n_design_sea(n_design_sea>=nmax_design) = nmax_design;
n_design_cruise(n_design_cruise>=nmax_design) = nmax_design;
n_design_ceil(n_design_ceil>=nmax_design) = nmax_design;

n_design_sea_neg = -n_design_sea;
n_design_cruise_neg = -n_design_cruise;
n_design_ceil_neg = -n_design_ceil;

n_design_sea_neg(n_design_sea_neg<=nmin_design) = nmin_design;
n_design_cruise_neg(n_design_cruise_neg<=nmin_design) = nmin_design;
n_design_ceil_neg(n_design_ceil_neg<=nmin_design) = nmin_design;



plot(v_req_mph,n_req_sea,'r.-')
grid on
hold on
box off
plot(v_req_mph,n_req_cruise,'r.-')
plot(v_req_mph,n_req_ceil,'r.-')
plot(v_req_mph,n_req_sea_neg,'r.-')
plot(v_req_mph,n_req_cruise_neg,'r.-')
plot(v_req_mph,n_req_ceil_neg,'r.-')

plot(v_design_mph,n_design_sea,'k-')
plot(v_design_mph,n_design_cruise,'k-')
plot(v_design_mph,n_design_ceil,'k-')
plot(v_design_mph,n_design_sea_neg,'k-')
plot(v_design_mph,n_design_cruise_neg,'k-')
plot(v_design_mph,n_design_ceil_neg,'k-')

plot([v_req_mph(end) v_req_mph(end)],[nmax,nmin],'r-')
plot([v_design_mph(end) v_design_mph(end)],[nmax_design,nmin_design],'k-')

%plot(v_req_mph,v_req*0,'k-')
xlabel('airspeed (mph)')
ylabel('load factor (-)')

hold off





