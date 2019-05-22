[~,~,disneyarr] = xlsread('disney.xlsx');
dayrownumber =  find(strcmp(disneyarr(:,1),'Day'));
openrownumber = find(strcmp(disneyarr(:,1),'Park Open'));
notopenmask = strcmp(disneyarr(openrownumber,:),'No');
out = disneyarr(dayrownumber,notopenmask)