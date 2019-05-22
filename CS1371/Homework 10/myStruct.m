function [structure] = myStruct (incell)
% Get all of the contents. There might be three sinarios: 
% 1. All of them have length 1.
% 2. Some of them have length n while others have length 1.
% 3. All of them have length n.

% scinario 1 and 3 can be combined together. 
% Their identification method:
% put every length into vec.
% if vec(1) = mean(vec) then all elements have the same value.
% anything else would be scinario 2.
% in case of sinario 2, find the length that's supposed to be by
% max(vec)
% Then write a for loop to construct a cell in which that element is
% repeated n times.
% Then plug that cell back to the original position.

% After everything's processed and all cell's lengths agree,
% Write a big for loop that puts everything in place.

    long = length(incell);
    contentsonly = incell(2:2:end)';
    
    for i = 1:length(contentsonly)
        lengthvec(i) = length(contentsonly{i});
    end

    supposedtobe = max(lengthvec);
    
    if ~(lengthvec(1)==mean(lengthvec))
        changeindex = find(lengthvec==1);
        for f = changeindex
            thecell = contentsonly{changeindex};
            word = cell2mat(thecell);
            newcell = cell(1,supposedtobe);
            for j = 1:supposedtobe
                newcell{j} = word;
            end
            incell{2*f} = newcell;
        end
    end
    
    structure = [];
    
    for i = 1:2:long-1
        contentcell = incell{i+1};
        for j = 1:supposedtobe
            structure(j).(incell{i}) = contentcell{j};
        end
    end
    
end