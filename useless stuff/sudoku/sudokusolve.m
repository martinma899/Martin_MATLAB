function [solved] = sudokusolve (puzzle)
    clc
    disp(puzzle)
    while sum(sum(puzzle))<405
        for r = 1:9
            for c = 1:9
                % if it's blank
                if puzzle(r,c)==0
                    % check if a number can be decided
                    vechoriz = puzzle(r,:);
                    vecvertical = puzzle(:,c);
                    vecsquare = subsquare(puzzle,r,c);
                    together = [vechoriz vecvertical' vecsquare];
                    couldbe = find(~ismember(1:9,together));
                    if length(couldbe)==1
                        puzzle(r,c) = couldbe;
                        clc
                        disp(puzzle)
                    elseif isempty(couldbe)
                        error('bad puzzle');
                        return;
                    else
                        % use the elimination method
                        [puzzle,changed] = twocoltworowelimination ...
                            (puzzle,couldbe,r,c);
                    end
                    pause(0.02)
                end
            end
        end
    end
    solved = puzzle;
end

function [out] = subsquare(puzzle,r,c)

    switch r
        case {1 2 3}
            switch c
                case {1 2 3}
                    out = puzzle(1:3,1:3);
                case {4 5 6}
                    out = puzzle(1:3,4:6);
                case {7 8 9}
                    out = puzzle(1:3,7:9);
            end
        case {4 5 6}
            switch c
                case {1 2 3}
                    out = puzzle(4:6,1:3);
                case {4 5 6}
                    out = puzzle(4:6,4:6);
                case {7 8 9}
                    out = puzzle(4:6,7:9);
            end
        case {7 8 9}
            switch c
                case {1 2 3}
                    out = puzzle(7:9,1:3);
                case {4 5 6}
                    out = puzzle(7:9,4:6);
                case {7 8 9}
                    out = puzzle(7:9,7:9);
            end
    end
    out = reshape(out,1,9);

end

function [out,changed] = twocoltworowelimination (puzzle,couldbe,r,c)
    % this sucks, must be improved
    switch mod(r,3)
        case 1
            row1 = puzzle(r+1,:);
            row2 = puzzle(r+2,:);
        case 2
            row1 = puzzle(r-1,:);
            row2 = puzzle(r+1,:);
        case 0
            row1 = puzzle(r-2,:);
            row2 = puzzle(r-1,:);
    end
    
    switch mod(c,3)
        case 1
            col1 = puzzle(:,c+1);
            col2 = puzzle(:,c+2);
        case 2
            col1 = puzzle(:,c-1);
            col2 = puzzle(:,c+1);
        case 0
            col1 = puzzle(:,c-2);
            col2 = puzzle(:,c-1);
    end
    changed = false;
    for i = 1:length(couldbe)
        if ismember(couldbe(i),row1)&&ismember(couldbe(i),row2)&&...
           ismember(couldbe(i),col1)&&ismember(couldbe(i),col2)
           puzzle(r,c) = couldbe(i);
           changed = true;
        end
    end
    out = puzzle;
end



















