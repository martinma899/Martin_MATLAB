clc;clear;close all

P = 5000; % principal
n = 5; % number of months
APR = 0.08*12; % APR

tax = 3075/12*0; % estimated tax
insurance = 1370/12*0; % estimated insurance
upkeep = 100*0; % house upkeep

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
mortgage_payment = p(1);
total_payment = mortgage_payment+tax+insurance+upkeep;
total_interest = sum(p(1)-p(2:end));
AVG_interest_per_month = sum(p(1)-p(2:end))/n;
AVG_monthly_expense = AVG_interest_per_month+tax+insurance+upkeep;
total_interest_rate = sum(p(1)-p(2:end))/P*100;


principal_paid_per_month = p(2:end);
cum_principal_paid = cumsum(principal_paid_per_month);
percent_principal_paid = cum_principal_paid/P*100;
interest_paid_per_month = p(1)-p(2:end);
cum_interest_paid = cumsum(interest_paid_per_month);
percent_interest_paid = cum_interest_paid/total_interest*100;
principal_left = P-cumsum(principal_paid_per_month);

% print everything
fprintf('%20s %18.2f\n','Principal:',P);
fprintf('%20s %2d %s %2d %s\n','Term:',floor(n/12),'years',mod(n,12),'months');
fprintf('%20s %18.5f\n','APR:',APR*100);
fprintf('%20s %18.2f\n','Mortgage Payment:',mortgage_payment);
fprintf('%20s %18.2f\n','Total Payment:',total_payment);
fprintf('%20s %18.2f\n','Total Interest:',total_interest);
fprintf('%20s %18.2f\n','AVG Interest/Month:',AVG_interest_per_month);
fprintf('%20s %18.2f\n','AVG Monthly Expense:',AVG_monthly_expense);
fprintf('%20s %18.2f\n','Total Interest Rate:',total_interest_rate);

% print payment schedule
fprintf('%14s %14s %14s %14s %14s %14s %14s %14s %14s\n','month','payment','principal',...
  'cum principal','percent P paid','interest','cum interest','percent i paid','principal left');

for i = 1:n
  %fprintf('%14.2f %14.2f %14.2f %14.2f\n',p(1),p(i+1),p(1)-p(i+1),principal_left);
  fprintf('%14d %14.2f %14.2f %14.2f %13.2f%% %14.2f %14.2f %13.2f%% %14.2f\n',i,...
    total_payment,principal_paid_per_month(i),cum_principal_paid(i),percent_principal_paid(i),...
    interest_paid_per_month(i),cum_interest_paid(i),percent_interest_paid(i),principal_left(i));
end

% figure(1)
% plot(percent_principal_paid,percent_interest_paid,'r-')
% grid on
% axis([0 100 0 100]);
% xlabel('% principal paid')
% ylabel('% interest paid')
% 
% figure(2)
% plot(1:n,percent_principal_paid,'b.-')
% hold on
% plot(1:n,percent_interest_paid,'r.-')
% axis([1 n 0 100])
% xlabel('month')
% ylabel('% total paid')
% legend('principal','interest')
% grid on