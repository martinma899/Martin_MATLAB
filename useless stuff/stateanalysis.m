[~,~,data] = xlsread('matches_RE-VRC-16-3522_1.xlsx'); % read data
clc
data = data(2:179,1:6); % delete additional bullshit
data = data(1:2:end-1,:); % delete duplicated rows

s = size(data); % get the size of the data

for i = 1:s(1)*4 % iterate through every team name
    data{i} = num2str(data{i}); % make team numbers strings
end

scores = cell2mat(data(:,5:6)); % take out scores only

% find the single highest score

singlehigh = max(max(scores)); % find the highest score
[singlehighmatchnum,~] = find(scores==singlehigh); % find that match number
singlehighmatch = data(singlehighmatchnum,:);

% find the combined highest score

comb = sum(scores,2);
combhighestmatch = data(comb==max(comb),:);

% make a ranking system

% first find all the names of teams
allnames = unique(reshape(data(:,1:4),s(1)*4,1)); % may not be useful
rankarray = cell(numel(allnames),3);
rankarray(:,1) = allnames;
rankarray(:,2:3) = num2cell(zeros(numel(allnames),2));

for i = 1:s(1) % iterate through all matches
    thismatch = data(i,:);
    % find the location of four teams in this match to index
    rp1loc = find(strcmp(allnames,thismatch(1)));
    rp2loc = find(strcmp(allnames,thismatch(2)));
    bp1loc = find(strcmp(allnames,thismatch(3)));
    bp2loc = find(strcmp(allnames,thismatch(4)));
    if thismatch{5}>thismatch{6} % if red wins
        % add wp for every red player
        rankarray{rp1loc,2} = rankarray{rp1loc,2}+2;
        rankarray{rp2loc,2} = rankarray{rp2loc,2}+2;
    elseif thismatch{5}<thismatch{6} % if blue wins
        % add wp for every blue player
        rankarray{bp1loc,2} = rankarray{bp1loc,2}+2;
        rankarray{bp2loc,2} = rankarray{bp2loc,2}+2;        
    else % if ties
        rankarray{rp1loc,2} = rankarray{rp1loc,2}+1;
        rankarray{rp2loc,2} = rankarray{rp2loc,2}+1;
        rankarray{bp1loc,2} = rankarray{bp1loc,2}+1;
        rankarray{bp2loc,2} = rankarray{bp2loc,2}+1; 
    end
    % add sp for every team
    rankarray{rp1loc,3} = rankarray{rp1loc,3}+thismatch{6};
    rankarray{rp2loc,3} = rankarray{rp2loc,3}+thismatch{6};
    rankarray{bp1loc,3} = rankarray{bp1loc,3}+thismatch{5};
    rankarray{bp2loc,3} = rankarray{bp2loc,3}+thismatch{5};
end

% sort the entire array

numericalpartofrankarray = cell2mat(rankarray(:,2:3));
combinedsortvec = numericalpartofrankarray(:,1)+...
                  numericalpartofrankarray(:,2)/10000;
[~,ranksortindex] = sort(combinedsortvec,'descend');
rankarray = rankarray(ranksortindex,:);

rankarray = [num2cell(1:numel(allnames))' rankarray]


























