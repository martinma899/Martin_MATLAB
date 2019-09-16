clear;

% system parameters
DC_gain = 4.45;
tau = 0.23;

% make transfer function
num = [DC_gain];
den = [tau 1 0];
G = tf(num,den)

% proportional controller
Kp = 1; % proportional gain
C = Kp;

% root locus
rltool(G,C)