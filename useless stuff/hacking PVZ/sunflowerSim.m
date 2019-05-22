clc;clear

sunshine = 50;
time = 0;
tincrement = 0.1;
plantCD = 7.5;
plantsunCD = 24;
skysunCD = 6;
endtime = 400;
stopatnumflower = 8;

peaprice = 0;

tol = 1e-8;

CDready = true;

plantTimeArr = [];

tvec = [];
svec = [];

for i = 0:1:(round(endtime/tincrement))
  time = i*tincrement;
  CDready = abs(mod(time,plantCD))<=tol;
  % first, fetch all the sunshine energy. 
  if abs(mod(time,skysunCD))<=tol
    sunshine = sunshine + 25;
    fprintf('Time = %1.1f Sky sunsine falls. Sunshine = %i\n',...
      time,sunshine);
  end
  % if there are sunflowers on the field,
  if ~isempty(plantTimeArr)
    % fetch all that just produced. 
    for j = 1:length(plantTimeArr)
      if abs(mod(time-plantTimeArr(j),skysunCD))<=tol
        sunshine = sunshine + 25;
        fprintf('Time = %1.1f Flower %i produced. Sunshine = %i\n',...
          time,j,sunshine);
      end
    end
  end
  
  if sunshine > 9990
    sunshine = 9990;
  end
  
  % plant pea shooter if possible
  if CDready && sunshine>=peaprice 
    sunshine = sunshine-peaprice;
    fprintf('Time = %1.1f Peashooter is planted. Sunshine = %i\n',...
      time,sunshine);
  end
  
  % plant flower if possible
  if CDready && sunshine>=50 && length(plantTimeArr)<=stopatnumflower
    plantTimeArr = [plantTimeArr time];
    sunshine = sunshine-50;
    fprintf('Time = %1.1f Flower # %i is planted. Sunshine = %i\n',...
      time,length(plantTimeArr),sunshine);
  end
  
  if abs(mod(time,plantsunCD))<=tol
    sunshine = sunshine + 50;
    fprintf('Time = %1.1f Flower produced. Sunshine = %i\n',time,sunshine);
  end
  
  tvec = [tvec time];
  svec = [svec sunshine];
  
end

hold on
plot(tvec,svec);
