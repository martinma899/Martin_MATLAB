function [] = testingvecResize (range1,range2,indexr1,indexr2,length,repeat)

    for i = 1:repeat
        
        randvec = floor(rand(1,length)*(range2-range1))+range1;
        index = round(rand(1,1)*(indexr2-indexr1),3)+indexr1;
        result1 = vecResize(randvec,index);
        result2 = vecResize_soln(randvec,index);
        
        if isequal(result1,result2)
            bools = 'true';
        else
            bools = 'bullshit';
        end
            
        endline = sprintf('%0.3f   %s',index, bools);
            
        disp(randvec);
        disp(result1);
        disp(result2);
        disp(endline);
        disp(' ');
        
    end

end