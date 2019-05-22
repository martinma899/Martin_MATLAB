size = 35;
teststack = randperm(size);
trials = 100000;

% method 1, start over every time a student's test is found
checkcountarr1 = [];
for j = 1:trials
    checkcount = 0;
    teststack = randperm(size);
    for i = 1:size
        studentofinterest = i;
        ind = find(teststack==studentofinterest);
        checkcount = checkcount+ind;
        teststack(ind) = [];
    end
    checkcountarr1 = [checkcountarr checkcount];
end

figure(1)
hist(checkcountarr1,100)

% method 2, if finds a student's test, keep going. 

checkcountarr2 = [];
for i = 1:trials
    teststack = randperm(size);
    studentofinterest = 1;
    loopstackind = 1;
    checkcount = 0;
    while ~isempty(teststack)
        % loop the loop stack index
        if loopstackind>length(teststack)
            loopstackind = 1;
        end
        % check if the current student is the student of interest
        if teststack(loopstackind) == studentofinterest
            studentofinterest = studentofinterest+1;
            teststack(loopstackind) = [];
            loopstackind = loopstackind+1;
            checkcount = checkcount+1;
        else
            loopstackind = loopstackind+1;
            checkcount = checkcount+1;
        end
    end
    checkcountarr2 = [checkcountarr checkcount];
end

figure(2)
hist(checkcountarr2,100)