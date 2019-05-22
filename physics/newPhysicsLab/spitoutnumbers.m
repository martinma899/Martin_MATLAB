interest = fulldata3';
[a,b] = size(interest);

for i = 1:a*b
    
    disp(round(interest(i),4));
    disp(' ');
    pause(3.5);
    
end