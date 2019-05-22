function [overall] = fallAprob7 (grades,weighting)

    testgrades = grades(:,1);
    testgrades(testgrades==-1) = [];
    testgradesavg = mean(testgrades);
    
    quizgrades = grades(:,2);
    quizgrades(quizgrades==-1) = [];
    quizgradesavg = mean(quizgrades);
    
    attendancegrades = grades(:,3);
    attendancegrades(attendancegrades==-1) = [];
    attendancegradesavg = mean(attendancegrades);
    
    overall = round(testgradesavg*weighting(1)+...
                    quizgradesavg*weighting(2)+...
                    attendancegradesavg*weighting(3),1);

end