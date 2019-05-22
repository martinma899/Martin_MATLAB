%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : hw15/original
% Course       : CS1371
% Section      : C03
% Collaboration: 
%                 "I worked on the homework assignment alone, using
%                  only course materials."
%                 OR
%   Okay. Legit this is the last homework I'll ever submit in course 1371.
%   I loved everything in this class. Even the things I used to hate. What
%   a hell of a ride, guys. So long. Best wishes in the future. 
%   
%   And now I really really wanna become a TA just so that I can continue
%   this journey.
%  
%   *THIS HOMEWORK IS EXTRA CREDIT. THIS HOMEWORK CAN ONLY HELP YOUR GRADE,
%   AND YOUR GRADE WILL NOT BE NEGATIVELY IMPACTED IF YOU DO NOT SUBMIT.*
%
% Files provided with this homework:  
%   - Baseball.mat
%   - bondHackBond_soln.p
%   - Building_Data.mat
%   - Chicken1.txt
%   - Chicken2.txt
%   - Chicken3.txt
%   - cyberChase_soln.p
%   - dataRead_soln.p
%   - defeatZurg_soln.p
%   - Door1.txt
%   - Door2.txt
%   - Door3.txt
%   - Dynamite_Dunes.xlsx
%   - Emperor_Zurg.mat
%   - experiment_1.txt
%   - experiment_2.txt
%   - experiment_3.txt
%   - Forest_Frontier.xlsx
%   - highRise_soln.p
%   - HW15 Extra Credit Drill Problems.pdf
%   - hw15.m
%   - meanEvenOrOdd_soln.p
%   - punchLine_soln.p
%   - Rainbow_Valley.xlsx
%   - rainfall_soln.p
%   - recursiveCampanile_soln.p
%   - rollerCoaster_soln.p
%   - Scooby_Games.mat
%   - worldSeries_soln.p
%   - Zurg1.png
%   - Zurg1_red.fig
%   - Zurg2.png
%   - Zurg2_red.fig
%   - Zurg3.png
%   - Zurg3_red.fig
%
% Files to submit:
%   - bondHackBond.m
%   - cyberChase.m
%   - dataRead.m
%   - defeatZurg.m
%   - highRise.m
%   - hw15.m
%   - meanEvenOrOdd.m
%   - punchLine.m
%   - rainfall.m
%   - recursiveCampanile.m
%   - rollerCoaster.m
%   - worldSeries.m
%
% Instructions:
%   1) Follow the directions for each problem very carefully or you will
%   lose points.
%   2) Make sure you name functions exactly as described in the problems or
%   you will not receive credit.
%   3) Read the announcements! Any clarifications and/or updates will be
%   announced on T-Square. Check the T-Square announcements at least once
%   a day.
%   4) You should not use any of the following functions in any file that 
%   you submit to T-Square:
%       a) clear
%       b) clc
%       c) solve
%       d) input
%       e) disp
%       f) close all
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%==========================================================================
% PART 1.  ABC Problems
%--------------------------------------------------------------------------
%
% There are no ABC problems this week.
%
%==========================================================================
% DEBUGGING
%--------------------------------------------------------------------------
%
% MATLAB has a rich and powerful debugger that you can use to help you
% better understand your code.  With the debugger, you can step through
% your code line by line, step into functions that you call, and examine
% the workspaes of all of the functions currently on the stack.  This can
% help you tremendously in your understanding of MATLAB, especially when it
% comes to recursion.
%
% Your TA and/or professor have probably already shown you the debugger,
% but if you missed it, here are a few pointers to get you started.
%
% - On the left hand side of the MATLAB editor window, there are line
%   numbers and dashes.  You can stop MATLAB on a particular line of code
%   by clicking this dash (it will turn into a red dot).  When you run
%   your code, MATLAB will stop right before executing this line and give
%   you a command prompt (K>>).
% - You can also tell MATLAB to stop if it throws an error.  This option
%   can be found under the menu Debug->Stop if error/warning... or by
%   typing the command "dbstop if error".
% - While MATLAB is stopped, you can view your variables in the workspace
%   pane and interact with them through the command line.  You can also
%   view the workspace of functions that have called the current function
%   by using the Stack pulldown box in the Workspace pane.
% - From here, you can step through your code one line at a time.  There
%   are several step options, all of which have key combinations, can be
%   found under the debug menu, and have icons (the icons look like pages
%   with symbols on top of them, such as a green triangle and blue arrows)
%   	- Step: go to the next line of code
%		- Step in: if the line of code is a function, enter the function
%		  	to go line by line
%		- Step out: if you stepped in a function, step out will take you
%           back out
%   	- Continue/Run: Run until the next breakpoint or end of function
% - To clear all breakpoints, go to Debug->Clear all breakpoints or type
%   "dbclear all".
%
% For additional documentation, you can look up the official MATLAB
% documentation under the help menu.
%
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% Included with this homework is a file entitled "HW15 Extra Credit Drill 
% Problems.pdf", and included within are instructions for 11 drill problems 
% that cover a review of most topics from this semester.
%
% Follow the directions carefully to write code to complete the drill
% problems as described. Make sure files names as well as function headers
% are written exactly as described in the problem text. If your function
% headers are not written as specified, then you will recieve an automatic
% zero for the problem.
%
%==========================================================================
% PART 3. Testing Your Code
%--------------------------------------------------------------------------
%
% You may use the following test cases for each problem to test your code.
% The function call with the test-inputs is shown in the first line of each
% test case, and the correct outputs are then displayed in subsequent lines
% for each test case.
%
%--------------------------------------------------------------------------
% Drill Problem #1: meanEvenOrOdd
%
%   avg1 = meanEvenOrOdd([2,33,56,37,25,4,13,12,38,39,0], 'even')
%       avg1 = 18.6667
%
%   avg2 = meanEvenOrOdd([6,0,38,19,32,6,17,37,31,38], 'odd')
%       avg2 = 26
%
%   avg3 = meanEvenOrOdd([0,1,34,37,27,12,30,15,26,7], 'even')
%       avg3 = 20.4000
%
%   ***NOTE: The output values will not be rounded.  You must use 
%       isequal(meanEven(testCase),meanEven_soln(testCase)) and it must
%       output true to ensure your outputs are identical.
%
%--------------------------------------------------------------------------
% Drill Problem #2: worldSeries
%
%   load('Baseball.mat');
%   [win1, vic1, mostHalf1, mostInn1, blankHalf1] = worldSeries(g1, t1)
%       win1 = 'Royals'
%       vic1 = 4
%       mostHalf1 = 4
%       mostInn1 = 4
%       blankHalf1 = 10
%
%   [win2, vic2, mostHalf2, mostInn2, blankHalf2] = worldSeries(g2, t2)
%       win2 = 'Braves'
%       vic2 = 2
%       mostHalf2 = 5
%       mostInn2 = 8
%       blankHalf2 = 7
%
%--------------------------------------------------------------------------
% Drill Problem #3: rainfall
%
%   [outSize1] = rainfall(1.0, 40)
%       outSize1 = 1.5000
%
%   [outSize2] = rainfall(4.4, 224)
%       outSize2 = 3.7125
%
%   [outSize3] = rainfall(2.8, 165)
%       outSize3 = 4.7250
%
%--------------------------------------------------------------------------
% Drill Problem #4: punchLine
%
%   [joke1] = punchLine('Chicken1.txt')
%       joke1 = 'To get away from the duck!'
%
%   [joke2] = punchLine('Chicken2.txt')
%       joke2 = 'To get to the other side!'
%
%   [joke3] = punchLine('Chicken3.txt')
%       joke3 = 'To see about a girl!'
%
%--------------------------------------------------------------------------
% Drill Problem #5: defeatZurg
%
%   load('Emperor_Zurg.mat');
%   outcome1 = defeatZurg('Zurg1.png', lasers1)
%       outcome1 = 'YOU DEFEATED ZURG!'
%       displayed figure should looked like 'Zurg1_red.fig'
%
%   outcome2 = defeatZurg('Zurg2.png', lasers2)
%       outcome2 = 'GAME OVER!'
%       displayed figure should looked like 'Zurg2_red.fig'
%
%   outcome3 = defeatZurg('Zurg3.png', lasers3)
%       outcome3 = 'YOU DEFEATED ZURG!'
%       displayed figure should looked like 'Zurg3_red.fig'
%
%
%--------------------------------------------------------------------------
% Drill Problem #6: highRise
%
%    load('Building_Data.mat');
%    figure(1)
%    highRise(buildings3)
%    figure(2)
%    highRise_soln(buildings3)
%       Output plot should be identical to that of the solution file.
%
%   highRise(buildings2)
%       Output plot should be identical to that of the solution file.
%
%   highRise(buildings3)
%       Output plot should be identical to that of the solution file.
%
%--------------------------------------------------------------------------
% Drill Problem #7: dataRead
%	
%   out1 = dataRead('experiment_1.txt');
%       isequal(dataRead('experiment_1.txt'), dataRead_soln('experiment_1.txt'))
%       will output true
%
%   out2 = dataRead('experiment_2.txt');
%       isequal(dataRead('experiment_2.txt'), dataRead_soln('experiment_2.txt'))
%       will output true
%
%   out3 = dataRead('experiment_3.txt');
%       isequal(dataRead('experiment_3.txt'), dataRead_soln('experiment_3.txt'))
%       will output true
%
%--------------------------------------------------------------------------
% Drill Problem #8: rollerCoaster
%
%   [ride1] = rollerCoaster('Forest_Frontier.xlsx', 'Thrill', 'Most')
%       ride1 = 'In Tents'
%
%   [ride2] = rollerCoaster('Forest_Frontier.xlsx', 'Wait', 'Least')
%       ride2 = 'Baby Brook'
%
%   [ride3] = rollerCoaster('Dynamite_Dunes.xlsx', 'Fear', 'MOST')
%       ride3 = 'TNT'
%
%   [ride4] = rollerCoaster('Dynamite_Dunes.xlsx', 'Nausea', 'Either')
%       ride4 = 'Just pick one!'
%
%   [ride5] = rollerCoaster('Rainbow_Valley.xlsx', 'Cost', 'least')
%       ride5 = 'Happy It's Over'
%
%--------------------------------------------------------------------------
% Drill Problem #9: bondHackBond
%
%   [password1] = bondHackBond('Door1.txt')
%       password1 = 'XALERJ'
%
%   [password2] = bondHackBond('Door2.txt')
%       password2 = 'TLOKCD'
%
%   [password3] = bondHackBond('Door3.txt')
%       password3 = 'VESPER'
%
%--------------------------------------------------------------------------
% Drill Problem #10: cyberChase
%
%   load('Scooby_Games.mat');
%   [outcome1, monsters1, log1] = cyberChase(Game1)
%       outcome1 = 'You reached level: 10'
%       monsters1 = 159
%       log1 = true
%       REASON: Reach Level 10 with Scooby, Cyber Scooby, and Magnet
%
%   [outcome2, monsters2, log2] = cyberChase(Game2)
%       outcome2 = 'You reached level: 5'
%       monsters2 = 94
%       log2 = false
%       REASON: No ScoobySnax on 5th Level
%
%   [outcome3, monsters3, log3] = cyberChase(Game3)
%       outcome3 = 'You reached level: 10'
%       monsters3 = 205
%       log3 = false
%       REASON: Missing Scooby and Cyber Scooby on Last Level
%
%   [outcome4, monsters4, log4] = cyberChase(Game4)
%       outcome4 = 'You reached level: 10'
%       monsters4 = 207
%       log4 = false
%       REASON: No Magnet Found in Item Field on Any Level
%
%--------------------------------------------------------------------------
% Drill Problem #11: recursiveCampanile
%
%   figure(1)
%   recursiveCampanile(10, 0, 'rkbgcym')
%   figure(2)
%   recursiveCampanile_soln(10, 0, 'rkbgcym')
%           Output plot should be identical to running solution code 
%           with same inputs.
%
%    figure(1)
%   recursiveCampanile(12, pi/32, 'b')
%           Output plot should be identical to running solution code 
%           with same inputs.
%
%   recursiveCampanile_soln(15, pi/45, 'kg')
%           Output plot should be identical to running solution code 
%           with same inputs.
%
%     figure(1);
%     recursiveCampanile(15, pi/40, 'cbk')
%     figure(2);
%     recursiveCampanile_soln(15, pi/40, 'cbk')    
%           Output plot should be identical to running solution code 
%           with same inputs.
%
%==========================================================================
% Click of the Week!!
%--------------------------------------------------------------------------
%
%   http://iwastesomuchtime.com/on/?i=58134
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this extra credit assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
