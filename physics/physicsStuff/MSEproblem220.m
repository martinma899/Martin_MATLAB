meltingtemp = [-39 660 1538 3410];
bondingenergy = [68 324 406 849];
mbbondingenergy = interp1(meltingtemp,bondingenergy,2617);
coeffs = polyfit(meltingtemp,bondingenergy,1);
regression = polyval(coeffs,meltingtemp);
close all
hold on
plot(meltingtemp,bondingenergy,'bo');
plot(meltingtemp,regression,'r-');
plot(2617,mbbondingenergy,'ro');
legend('existing elements','regression [0.2153 111.9853]','Predicted Molybdenum');
text(meltingtemp(1),bondingenergy(1),'   Hg');
text(meltingtemp(2),bondingenergy(2),'   Al');
text(meltingtemp(3),bondingenergy(3),'   Fe');
text(meltingtemp(4),bondingenergy(4),'   W');
text(2617,mbbondingenergy,'   Mo');
xlabel('melting temperature');
ylabel('bonding energy');
hold off