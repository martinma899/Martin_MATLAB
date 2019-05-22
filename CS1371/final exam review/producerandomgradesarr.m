% amount of test grades
% range of test grades

% [amount start end]

% amount of quiz grades
% range of quiz grades

% amount of attendance grades
% range of attendance grades

function [gradesarr] = producerandomgradesarr(test,quiz,attendance)

    testamount = test(1);
    teststart = test(2);
    testend = test(3);
    
    quizamount = quiz(1);
    quizstart = quiz(2);
    quizend = quiz(3);
    
    attendanceamount = attendance(1);
    attendancestart = attendance(2);
    attendanceend = attendance(3);
    
    arrheight = max([testamount quizamount attendanceamount]);
    
    gradesarr = -ones(arrheight,3);
    
    testgrades = sort(round(rand(testamount,1)*...
        (testend-teststart)+teststart),'ascend');
    quizgrades = sort(round(rand(quizamount,1)*...
        (quizend-quizstart)+quizstart),'ascend');
    attendancegrades = rand(attendanceamount,1)*(attendanceend-...
        attendancestart)+attendancestart;
    
    gradesarr(1:testamount,1) = round(testgrades);
    gradesarr(1:quizamount,2) = round(quizgrades);
    gradesarr(1:attendanceamount,3) = round(attendancegrades);

end




















