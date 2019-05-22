expdate = 1:122;
expmoney = linspace(4470.75,2000,122);

[actualmoney,actualdate,~] = xlsread('book.xlsx');

hold off
plot(expdate,expmoney);
hold on
plot(date2num(actualdate),actualmoney,'r--');
hold off