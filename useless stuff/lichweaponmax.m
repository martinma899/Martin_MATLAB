% experimentally determining how many tries it takes to max lich weapons
% weapons spawn between 25% and 60%
% when a new one is rolled, the highest of the two x 1.1 is the new roll
% stops when 60 is reached

clc;clear;close all

count_arr = zeros(1,10000);
for i = 1:10000
count = 0; 
percent = 0; 
while true
  count = count+1; 
  percent_n = rand()*0.35+0.25;
  if percent_n > percent
    percent = percent_n*1.1;
  else
    percent = percent*1.1;
  end
  if percent >= 0.6
    break;
  end
end
count_arr(i) = count;
end

[n,edges] = histcounts(count_arr,9);

n = n'/10000

expected = (1:9)*n

histogram(count_arr,'BinWidth',1)