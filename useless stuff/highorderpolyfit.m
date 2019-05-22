n = 15;
x = linspace(0,1,n);
y = rand(1,n);
coeffs = polyfit(x,y,n-1);
xfitted = linspace(0,1,n*10);
yfitted = polyval(coeffs,xfitted);
plot(x,y,'bo');
hold on
plot(xfitted,yfitted,'r-');