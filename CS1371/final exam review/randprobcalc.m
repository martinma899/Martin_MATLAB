
weighting = [0.6 0.3 0.1];
count = 0;
badgrades = [];
for i = 1:10000
    grades = producerandomgradesarr([3 85 100],[5 85 100],[24 100 100]);
    overall = fallAprob7(grades,weighting);
    if overall<90
        count = count+1;
        badgrades = [badgrades overall];
    end
end

scaryprob = count/10000