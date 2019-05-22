fid = fopen('frankenstein_full.txt','r');
line = fgetl(fid);
wordarr = [];

while ischar(line)
    [word,rest] = strtok(line,' ');
    while ~isempty(word)
        word = word(isletter(word));
        word = lower(word);
        wordarr = [wordarr;{word}];
        [word,rest] = strtok(rest,' ');
    end
    line = fgetl(fid);
end

uniquewords = [];
uniquecounts = [];
for i = 1:length(wordarr)
    if any(ismember(uniquewords,wordarr{i}))
        uniquecounts(strcmp(uniquewords,wordarr{i})) ...
            = uniquecounts(strcmp(uniquewords,wordarr{i}))+1;
    else
        uniquewords = [uniquewords;wordarr(i)];
        uniquecounts = [uniquecounts;1];
    end
end

[uniquecounts,index] = sort(uniquecounts,'descend');
uniquewords = uniquewords(index);

outarr = [uniquewords num2cell(uniquecounts)];