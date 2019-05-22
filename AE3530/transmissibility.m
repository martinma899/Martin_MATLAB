clc;clear;close all

beta_list = linspace(0,2,101);
zeta_list = [0 0.1 0.2 0.3 0.4 0.5 1];

hold on
xlabel('beta')
ylabel('TR')
grid on
axis([0 2 0 7]);
for zeta = zeta_list
  TR = sqrt(1+(2*zeta*beta_list).^2)./...
    sqrt((1-beta_list.^2).^2+(2*zeta*beta_list).^2);
  TR(TR>7)=7;
  text(1,TR(51),sprintf('zeta = %1.2f',zeta))
  plot(beta_list,TR,'.-');
end
hold off