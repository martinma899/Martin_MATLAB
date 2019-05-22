clc;clear

CL0 = 0.17;
CLalpha = 5;% per radian
K = 0.1018;
CD0 = 0.0397; 
W = 38204*4.44822 %N
S = 542.5/(3.28084^2); %m^2
rho = 1.225; %SI

v1 = 70;
v2 = 120;
v3 = 170;

[alpha1,~] = recsolveA32 (0,0.5,v1,rho,S,CL0,CLalpha,CD0,K,W)
[alpha2,~] = recsolveA32 (0,0.5,v2,rho,S,CL0,CLalpha,CD0,K,W)
[alpha3,~] = recsolveA32 (0,0.5,v3,rho,S,CL0,CLalpha,CD0,K,W)

alpha1deg = alpha1/pi*180
alpha2deg = alpha2/pi*180
alpha3deg = alpha3/pi*180

q1 = 0.5*rho*v1^2
q2 = 0.5*rho*v2^2
q3 = 0.5*rho*v3^2

L1 = q1*S*(CL0+CLalpha*alpha1)
L2 = q2*S*(CL0+CLalpha*alpha2)
L3 = q3*S*(CL0+CLalpha*alpha3)

D1 = q1*S*(CD0+K*(CL0+CLalpha*alpha1)^2)
D2 = q2*S*(CD0+K*(CL0+CLalpha*alpha2)^2)
D3 = q3*S*(CD0+K*(CL0+CLalpha*alpha3)^2)

T1 = D1/cos(alpha1)
T2 = D2/cos(alpha2)
T3 = D3/cos(alpha3)

% now the simplified calculation

alpha1fake = (W/(q1*S)-CL0)/CLalpha
alpha2fake = (W/(q2*S)-CL0)/CLalpha
alpha3fake = (W/(q3*S)-CL0)/CLalpha

alpha1fakedeg = alpha1fake/pi*180
alpha2fakedeg = alpha2fake/pi*180
alpha3fakedeg = alpha3fake/pi*180

L1fake = q1*S*(CL0+CLalpha*alpha1fake)
L2fake = q2*S*(CL0+CLalpha*alpha2fake)
L3fake = q3*S*(CL0+CLalpha*alpha3fake)

D1fake = q1*S*(CD0+K*(CL0+CLalpha*alpha1fake)^2)
D2fake = q2*S*(CD0+K*(CL0+CLalpha*alpha2fake)^2)
D3fake = q3*S*(CD0+K*(CL0+CLalpha*alpha3fake)^2)

T1fake = D1fake
T2fake = D2fake
T3fake = D3fake
