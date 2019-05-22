function numbers = getnumbers ()
%% First things first, read file

    % The name of the file we are working with
    fname = 'getnumbers.txt';
    % Get number of lines
    lines = linecount(fname);
    % Open file
    fid = fopen(fname,'r');
    % get data from files
    str = [];
    for i = 1:lines
        str = [str fgetl(fid)];
    end
    % close file
    fclose(fid);
    
%% Find a vector that identifies everything that's a number
    
    % Everything that can be a number
    numberthings = '1234567890.:';
    % Find the big logical vector
    logic = compare(str,numberthings);
    
%% Manipulate this vector
    
    % Find the index of true values
    index = find(logic);
    % Derive it
    difference = diff(index);
    % Find something... let me think
    anotherindex = find(difference~=1);
    % find the length of index
    indexlength = length(index);
    % find the length of anotherindex
    anotherlength = length(anotherindex);
    % Concatinate anotherindex
    anotherindex = [0 anotherindex indexlength];

%% Extract numbers

    for i = 1:anotherlength+1
        a = anotherindex(i)+1;
        b = anotherindex(i+1);
        in = index(a:b);
        cell{i} = str(in);
    end
    
%% Delete periods
    
    % Make a logical vector indicating which elements aren't periods
    for i = 1:length(cell)
        isntperiod(i) = (~isequal(cell{i},'.'))&(~isequal(cell{i},':'));
    end
    
    % Put the non-period values into variable number
    t = 1;
    for i = 1:length(cell)
        if isntperiod(i)
            numbers{t} = cell{i};
            t = t+1;
        end
    end
    
    % Make number a column
    numbers = numbers';
    
end

function [logic] = compare(vec,elements)
    long = length(vec);
    short = length(elements);
    arr = logical(zeros(short,long));
    for i = 1:short
        arr(i,:) = vec==elements(i);
    end
    logic = any(arr);
end

function n = linecount(filename)
    fid = fopen(filename,'r');
    n = 0;
    tline = fgetl(fid);
    while ischar(tline)
        tline = fgetl(fid);
        n = n+1;
    end
    fclose(fid);
end