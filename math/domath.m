epsilon = linspace(0,0.2);
k = 295e6;
n = 0.1;
sigma = k*epsilon.^n;
sigmaengineer = k*(log(1+epsilon)).^n./(1+epsilon);

close all
hold on
plot(epsilon,sigma);
plot(epsilon,sigmaengineer);
legend('true','engineering is shit')
hold off