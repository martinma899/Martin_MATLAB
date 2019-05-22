function [] = testingHowFall (size,range,predictionrange,repetitions,display)

    % example: testingHowFall ([20 20],[20 40],[1 20],1000,false)

    for i = 1:repetitions
        testingarr = randi(range,size(1),size(2));
        prediction = randi(predictionrange,1,1);
        [boo1,string1] = howFall(testingarr,prediction);
        [boo2,string2] = howFall_soln(testingarr,prediction);
        
        if isequal(boo1,boo2)
            bools1 = 'First output is correct.';
        else
            bools1 = 'First output is SHITTTTTTTTT';
        end
        
        if isequal(string1,string2)
            bools2 = 'Second output is correct.';
        else
            bools2 = 'Second output is SHITTTTTTTTTT';
        end
        
        disp(' ');
        disp(bools1);
        disp(bools2);
        if display
            disp(boo1);
            disp(boo2);
            disp(string1);
            disp(string2);         
        end
        
    end

end