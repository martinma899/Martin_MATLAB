x = 1:10000;

for i = x
    y(i) = testingCollatz(i);
end

plot(x,y,'.');