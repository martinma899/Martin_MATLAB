clc;clear;close all

P = 80000*3*0.8; % principal
nmin = 36; % best case scenario - min months
nmax = 15*12; % worse case scenario - full term
APR = 0.04; % APR

fid = fopen('early_payoff1.txt','w');

fprintf(fid,'%20s %18.2f\n','Principal:',P);
fprintf(fid,'%20s %18.2f\n\n','APR:',APR*100);

fprintf(fid,'%20s %20s %20s %20s %20s %20s %20s %20s\n','Term','Extra Mon. Payment','Base Mon. Payment','Mon. Payment','Base Total Interest','Total Interest','Total Interest Rate','Total Int. Saved');

for n = nmax:-1:nmin

% construct matrix A
A = tril(ones(n,n)*(APR/12),-1)+-1*eye(n);
A = [ones(n,1),A];
A = [A;[0 ones(1,n)]];
% construct b vector
b = [ones(n,1)*P*(APR/12);P];
% solve for p vector
% p(1) is total monthly payment
% p(2:end) is monthly principal payment
p = A\b;

% calculate everything
term_year = n/12;
monthly_payment = p(1);
total_interest = sum(p(1)-p(2:end));
total_interest_rate = sum(p(1)-p(2:end))/P*100;
if n == nmax
  base_monthly_payment = monthly_payment;
  base_total_interest = total_interest;
end
extra_monthly_payment = monthly_payment-base_monthly_payment;
total_money_saved = base_total_interest-total_interest;

% principal_paid_per_month = p(2:end);
% cum_principal_paid = cumsum(principal_paid_per_month);
% percent_principal_paid = cum_principal_paid/P*100;
% interest_paid_per_month = p(1)-p(2:end);
% cum_interest_paid = cumsum(interest_paid_per_month);
% percent_interest_paid = cum_interest_paid/total_interest*100;
% principal_left = P-cumsum(principal_paid_per_month);

% print everything

termstr = sprintf('%2d %s %2d %s',floor(n/12),'years',mod(n,12),'months');
fprintf(fid,'%20s %20.2f %20.2f %20.2f %20.2f %20.2f %20.2f %20.2f\n',termstr,...
  extra_monthly_payment,base_monthly_payment,monthly_payment,base_total_interest,...
  total_interest,total_interest_rate,total_money_saved);


end