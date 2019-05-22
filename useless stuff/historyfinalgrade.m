clc;clear
writingweigh = 0.2;
midterm1weigh = 0.15;
midterm2weigh = 0.2;
midterm3weigh = 0.2;
finalexamweigh = 0.25;

writing = 100;
midterm1 = 93.02;
midterm2 = 93.02;
midterm3 = 92.5;

finalexampercent = 90-writingweigh*writing-midterm1weigh*midterm1...
    -midterm2weigh*midterm2-midterm3weigh*midterm3;
finalexamscore = finalexampercent/finalexamweigh
