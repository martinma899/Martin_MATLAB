num = [3 2 1;4 5 6];
num(logical(mod(num,2))) = num(logical(mod(num,2)))+1;
columnsum = sum(num,1);
out = [columnsum;num]