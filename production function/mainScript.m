% house keeping
clc;clear;close all;fclose('all');

% production vs. labor data
labor = [0 1 2 3 4 5 6 7 8];
prod = [0 19 36 51 64 75 84 91 96];

% fixed cost and labor price
laborPrice = 200;
FC = 400;

% production total cost
VC = labor*laborPrice;
TC = FC+VC;

% plot cost curve, production units on x axis
subplot(2,2,1);
plot(prod,TC,'Marker','.','Color','b');
title('Total Cost Curve');
xlabel('production/production unit');
ylabel('Total Cost');

% compute marginal cost of case curve
subplot(2,2,2);
prodAlt = prod(1:end-1)+diff(prod)/2;
marginalTCOfCase = diff(TC)./diff(prod);
hold on
plot(prodAlt,marginalTCOfCase,'Marker','.','Color','r');
title('Marginal Total Cost of Case plot');
xlabel('production/production unit');
ylabel('Marginal Total Cost of Case');

% compute average total cost, average fixed cost 
% and average variable cost curve

subplot(2,2,3);
ATC = TC./prod;
AFC = ones(1,length(prod))*FC./prod;
AVC = VC./prod;
hold on
plot(prod,ATC,'Marker','.','Color','r');
plot(prod,AFC,'Marker','.','Color','g');
plot(prod,AVC,'Marker','.','Color','b');
plot(prodAlt,marginalTCOfCase,'Marker','o','Color','r');
title('Average cost curves');
xlabel('production/production unit');
legend('ATC','AFC','AVC','MC');













