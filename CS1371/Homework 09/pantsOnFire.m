function [outstr] = pantsOnFire (incell)
%% Process the data from cell array
    
    long = length(incell);

    vec = logical(zeros(2,long));
    
    for i = 1:long
        cloths{i} = incell{1,i};
        vec(1,i) = incell{2,i};
        vec(2,i) = incell{3,i};
    end
    
    boolvec = vec(1,:)&vec(2,:);

%% Separate good cloths and bad cloths into different cell arrays

    goodclothsindex = find(boolvec);
    badclothsindex = find(~boolvec);
    
    goodclothsnum = length(goodclothsindex);
    badclothsnum = long-goodclothsnum;
    
    for i = 1:goodclothsnum
        goodcloths{i} = cloths{goodclothsindex(i)};
    end
    
    for i = 1:badclothsnum
        badcloths{i} = cloths{badclothsindex(i)};
    end
    
%% Format the cells into strings according to English grammar

    for i = 1:goodclothsnum
        switch i
            case 1
                str1 = goodcloths{i};
            case goodclothsnum
                str1 = [str1 ' and/or ' goodcloths{i}];
            otherwise
                str1 = [str1 ', ' goodcloths{i}];
        end
    end
    
    for i = 1:badclothsnum
        switch i
            case 1
                str2 = badcloths{i};
            case badclothsnum
                str2 = [str2 ' or ' badcloths{i}];
            otherwise
                str2 = [str2 ', ' badcloths{i}];
        end
    end

%% Phrase the formatted string as a sentence

    outstr = ['You should wear the ' str1 ...
               ', but DO NOT wear the ' str2 '.'];
end





