xtest = [3 3*sqrt(2) sqrt(3)];
xgeneral = linspace(1,5,100);
ytest = f(xtest,2)
ygeneral = f(xgeneral,2);
close all
hold on
plot(xtest,ytest,'bs')
plot(xgeneral,ygeneral,'b-')
hold off