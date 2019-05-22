function [str,cell] = superSmashBros (characterfile,scoresfile)
%% Read data from the excel files

    [~,~,characterdata] = xlsread(characterfile);
    [~,~,scoredata] = xlsread(scoresfile);
    [onlyscores,~,~] = xlsread(scoresfile);
    
    [al,bl] = size(onlyscores);
    
    % Trim cells just in case we have weird extra lines
    characterdata = trimcell(characterdata,al+1,bl+1);
    scoredata = trimcell(scoredata,al+1,bl+1);
    
    % Get the size so we can work with for loop
    [as,bs] = size(characterdata);
        
%% Create a cell array of names of players

    for i = 1:bs-1
        name{i} = characterdata{1,i+1};
    end
    
%% Find winner of each game and the ultimate winner.
    
    % Create a row cell array of winners
    
    % make a vector that tells the numerical index of the player that wins
    % each game.
    
    for i = 1:as-1
        [~,winnerindex(i)] = max(onlyscores(i,:));
    end
    
    % Use winnerindex to identify the names of the winners, and put them in
    % winnereachgame.
    
    for i = 1:as-1
        winnernames{i} = name{winnerindex(i)};
    end
    
        winningtimes = countcell(winnernames);
        temp = find(winningtimes==max(winningtimes));
        indexofthewinner = temp(1);
        
        % Finally we found the name of the winner!
        winner = winnernames{indexofthewinner};
%% Produce our cell output

    cell = scoredata;

    cell{1,bs+1} = 'Winner';
    
    for i = 1:as-1
        cell{i+1,bs+1} = winnernames{i};
    end

%% Calculate the weighted scores in a new array

    weightedscorearr = onlyscores;
    
    for i = 1:as-1
        for j = 1:bs-1
            weightedscorearr(i,j) = onlyscores(i,j)+...
                weightscore(characterdata{i+1,j+1});
        end
    end

%% Find the person with highest points overall

    cumulatedweighted = sum(weightedscorearr);
    
    [~,maxindex] = max(cumulatedweighted);
    
    mostskilled = name{maxindex};
    
%% Output final string

    if strcmp(winner, mostskilled)
        str = [winner ' won the most games and is the best player!'];
    else
        str = [winner ' won the most games, but '...
            mostskilled ' is the best player!'];
    end
    
%% Debug use
    %disp(characterdata)
    
    %{
    disp(scoredata)
    disp(' ')
    disp(onlyscores)
    disp(' ')
    disp(name)
    disp(' ')
    disp(winnerindex)
    disp(' ')
    disp(winner)
    disp(' ')
    disp(cell)
    disp(' ')
    disp(mostskilled)
    %}
end

function [newcell] = trimcell (cell,a,b)

    for i = 1:a
        for j = 1:b
            newcell{i,j} = cell{i,j};
        end
    end

end

function [outvec] = countcell (cell)

    for i = 1:length(cell)
        element = cell{i};
        for j = 1:length(cell)
            logic(j) = isequal(element,cell{j});
        end
        outvec(i) = sum(logic);
    end 

end

function [weight] = weightscore(character)

    switch character
        case {'Link' 'Samus' 'Luigi'}
            weight = 8;
        case {'DK' 'Yoshi' 'Mario'}
            weight = 4;
        case {'Jigglypuff' 'C. Falcon' 'Fox'}
            weight = 2;
        case {'Ness' 'Kirby' 'Pikachu'}
            weight = 0;
    end

end