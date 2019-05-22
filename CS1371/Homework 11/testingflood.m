function [] = testingflood (iterations,length,start,finish)

    for i = 1:iterations
        testingvec = randi([start finish],1,length);
        if isequal(flood(testingvec),flood_soln(testingvec))
            disp('true')
        else
            disp('shit')
        end
    end

end