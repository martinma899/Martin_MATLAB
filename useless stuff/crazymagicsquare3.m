particular = [-10 15 0 0];
vec1 = [1 -1 1 0];
vec2 = [2 -1 0 1];
soln = [];
overalldiff = [];
for i = 1:9
    for j = 1:9
        testcase = [particular+vec1*i+vec2*j 10-(particular+vec1*i+vec2*j)];
        difference = sum(abs([1 2 3 4 6 7 8 9]-sort(testcase,'ascend')));
        
        if difference == 0
            soln = [soln;testcase];
        end
        clc
        overalldiff = [overalldiff difference];
        disp(soln)
        disp(testcase)
        disp(i)
        disp(j)
        disp(difference)
        pause(0.1)
    end 
end