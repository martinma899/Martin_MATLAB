function [] = testingTwinPrimes (range1,range2,length,repetition,displayVecs)

    for i = 1:repetition
        
        testingvec = randi([range1,range2],1,length);
        converted1 = twinPrimes(testingvec);
        converted2 = twinPrimes_soln(testingvec);
        bool = isequal(converted1,converted2);
        
        if bool
            bools = 'You got it right!';
        else
            bools = 'Bullshit! .. Oh shit..';
        end
        
        if displayVecs
            disp(testingvec);
            disp(converted1);
            disp(converted2);
        end
            disp(bools);
    end

end