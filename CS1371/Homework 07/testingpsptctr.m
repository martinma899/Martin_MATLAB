function [] = testingpsptctr (howlong,iteration,display)

    characters = [65:90 97:122];
    count = 0;
    for a = 1:iteration
        length = randi(howlong);
        randindex = randi([1 52],1,length);
        randstr = char(characters(randindex));
        yourresult = passwordProtector(randstr);
        answer = passwordProtector_soln(randstr);
        bool = isequal(yourresult,answer);
        
        if display
            disp(['testing string: ' randstr]);
            disp(['your result:    ' yourresult]);
            disp(['solution:       ' answer]);
        end
        
        if bool
            %disp('Good job!');
        else
            disp(['testing string: ' randstr]);
            disp(['your result:    ' yourresult]);
            disp(['solution:       ' answer]);
            %disp('Holy crap 20 more minutes of debugging plz...');
            %disp(randstr);
            disp(' ');
            count = count+1;
        end
        
        if display
            disp(' ');
        end
    end
    disp(count);
    
end