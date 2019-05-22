function [] = testing (start,tests,endv,func1,func2,const)

    % created to test the gravCalc drill problem in hw02 package.
    
    % convert strings to function headers so we can call functions
    funch1 = str2func(func1);
    funch2 = str2func(func2);
    
    % calculate the incrememt between values
    increment = (endv-start)/(tests-1);
    
    % run a for loop to pring out data
    for n = 1:1:tests
        
        % calculate the test value of that one test
        testv = (n-1)*increment+start;
        
        % bool is a boolean variable recording either 1 or 0
        bool = isequal(funch1(testv,const),funch2(testv,const));
        
        % based on the bool variable, either true or false is written to 
        % a string variable "bools".
        if bool == 1
            bools = 'true';
        else
            bools = 'false';
        end
        
        % format the output string
        output = sprintf('%d, %0.5g , %0.4g, %s',n,testv,const,bools);
        
        % display the output string
        disp(output)
            
    end

end