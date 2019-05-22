function [] = testingPowerOfTwo(start,finish)

    for i = start:finish
        if ~isequal(powerOfTwo(i),powerOfTwo_soln(i))
            disp('shit');
        end
    end

end