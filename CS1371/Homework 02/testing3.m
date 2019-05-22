function [] = testing3 (start,tests,endv,func1,func2,const,n)

    funch1 = str2func(func1);
    funch2 = str2func(func2);
    
     bool = isequal(funch1((n-1)*(endv-start)/(tests-1)+start,const),...
     funch2((n-1)*(endv-start)/(tests-1)+start,const));
        
        if bool == 1
            bools = 'true';
        else
            bools = 'false';
        end
         
        output = sprintf('%d, %0.4g, %s',n,const,bools);
        output2 = sprintf('%0.15f',funch1((n-1)*(endv-start)/(tests-1)+start,const));
        output3 = sprintf('%0.15f',funch2((n-1)*(endv-start)/(tests-1)+start,const));
        
        disp(output)
        disp(output2)
        disp(output3)
            

end