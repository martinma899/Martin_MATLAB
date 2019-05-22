function [] = testingcm (length,repetitions,dispfull)

    for a = 1:repetitions
        
        truevec = round(rand(1,length));
        falsevec = round(rand(1,length));
        
        while isequal(truevec,falsevec)
            truevec = round(rand(1,length));
            falsevec = round(rand(1,length));
        end
        
        truevec = logical(truevec);
        falsevec = logical(falsevec);
        
        badguy = randi([1 4],1);
        
        array = zeros(4,length);
        
        for i = 1:4
            array(i,1:length) = truevec;
        end
        
        array(badguy,1:length) = falsevec;
        
        guy1 = logical(array(1,1:length));
        guy2 = logical(array(2,1:length));
        guy3 = logical(array(3,1:length));
        guy4 = logical(array(4,1:length));
        
        string1 = criminalMinds(guy1,guy2,guy3,guy4);
        string2 = criminalMinds_soln(guy1,guy2,guy3,guy4);
        
        if dispfull
        disp(truevec);
        disp(falsevec);
        disp(badguy);
        disp(string1);
        disp(string2);
        end
        
        if isequal(string1,string2)
            disp('true');
        else
            disp('shit');
        end
        
    end

end