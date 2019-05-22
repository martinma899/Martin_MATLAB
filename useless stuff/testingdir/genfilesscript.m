amount = 10;
A = randi([0,9],5,5);
for i = 1:amount
    xlswrite(['test' num2str(i) '.xlsx'],A);
end