function [] = testing2 (start,tests,endv,func1,func2,const)

    funch1 = str2func(func1);
    funch2 = str2func(func2);
    
    increment = (endv-start)/(tests-1);
    
    for n = 1:1:tests
        
        testv = (n-1)*increment+start;
        
        func1Value = funch1(testv,const);
        func2Value = funch2(testv,const);
        
        output = sprintf('%0.7g, %0.7g',func1Value,func2Value);
        
        disp(output)
        disp(' ')
            
    end

end