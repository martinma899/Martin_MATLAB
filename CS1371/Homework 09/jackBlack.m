function [outstr] = jackBlack (movienames,ratings,excel)
%% Process data from excel file

    % Put everything in this cell array called data
    [~,~,dataraw] = xlsread(excel);
    
    % Get the size of data
    [a,b] = size(dataraw);
    
    % Change the military time into numbers and store them in a different
    % variable
    datatimeprocessed = dataraw;
    for i = 1:a-1
        for j = 1:b-2
            datatimeprocessed{i+1,j+1 }= ...
            militaryTimeToNum (datatimeprocessed{i+1,j+1});
        end
    end

%% Process data from the input arrays

    howmany = length(movienames);
    
    for i = 1:howmany
        ratingvec(i) = mean(ratings{i});
    end
    
    [~,sortedindex] = sort(ratingvec,'descend');
    
    % Find the index of number one, two and three movies.
    numberoneid = sortedindex(1);
    numbertwoid = sortedindex(2);
    numberthreeid = sortedindex(3);
    
    % Find the names of number one, two and three movies
    numberonename = movienames{numberoneid};
    numbertwoname = movienames{numbertwoid};
    numberthreename = movienames{numberthreeid};

%% Find the finish time of the number one movie

    logic = logical(zeros(a,b));

    % get the size of data
    [a,b] = size(dataraw);
    
    for i = 1:a*b
        logic(i) = isequal(dataraw{i},numberonename);
    end

    [a,b] = find(logic);
    starttime = datatimeprocessed{a,(b+1)};
    duration = dataraw{a,end};
    finishtime = starttime + duration;

%% Make vectors of playing time table for both second and third movie

    % Get the size of data
    [a,b] = size(dataraw);

    % Find the row and column num of second ranking movie
    logic = logical(zeros(a,b));
    
    for i = 1:a*b
        logic(i) = isequal(dataraw{i},numbertwoname);
    end
    
    [c,~] = find(logic);
    
    % make the time table vector for second ranking movie
    for i = 1:b-2
        movie2timetable(i) = datatimeprocessed{c,i+1};
    end
    
    % Find the row and column num of third ranking movie
    logic = logical(zeros(a,b));
    
    for i = 1:a*b
        logic(i) = isequal(dataraw{i},numberthreename);
    end
    
    [d,~] = find(logic);
    
    % make the time table vector for second ranking movie
    for i = 1:b-2
        movie3timetable(i) = datatimeprocessed{d,i+1};
    end
    
%% Find the earliest available time for both movies

    [~,index2] = find(movie2timetable>=finishtime);
    [~,index3] = find(movie3timetable>=finishtime);
    
    movie2earliest = movie2timetable(index2(1));
    movie3earliest = movie3timetable(index3(1));
    
%% Finally compare and format everything

    if  (movie2earliest<movie3earliest)||movie2earliest==movie3earliest
        theone = numbertwoname;
        time = dataraw{c,index2(1)+1};
    elseif  movie2earliest>movie3earliest
        theone = numberthreename;
        time = dataraw{d,index3(1)+1};
    end
    
    outstr = ['We''re going to see ' theone ...
                ' at ' time '. See you then :)'];
end

function [num] = militaryTimeToNum (str)

    [front,back] = strtok(str,':');
    back = back(2:end);
    minutes1 = str2double(front)*60;
    minutes2 = str2double(back);
    num = minutes1+minutes2;

end