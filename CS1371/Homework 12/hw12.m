% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : hw12/original
% Course       : CS1371
% Section      : C03
% Collaboration: <place here one of the following:
%                 "I worked on the homework assignment alone, using
%                  only course materials."
% 
% Files provided with this homework:
%   - ABCs_hw12_pretest.p
%   - ABCs_numericalMethods.m
%   - ABCs_plotting.m
%   - abcs_plotting.mat
%   - fieldGoalDenied_soln.p
%   - fieldGoalDenied_testCases.mat
%   - How to Compare Plots in MATLAB.pdf
%   - HW12 Drill Problems.pdf
%   - hw12.m
%   - intervention_soln.p
%   - interventionData.mat
%   - metaData_soln.p
%   - plotShapes_soln.p
%   - test_1.xlsx
%   - test_2.xlsx
%   - test_3.xlsx
%   - topPun_soln.p
%   - winterWonderland_soln.p
% 
% Files to submit:
%   - ABCs_numericalMethods.m
%   - ABCs_plotting.m
%   - fieldGoalDenied.m
%   - hw12.m
%   - intervention.m
%   - metaData.m
%   - plotShapes
%   - topPun.m
%   - winterWonderland.m
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
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ==========================================================================
% PART 1.  ABC Problems
% --------------------------------------------------------------------------
% 
% Part of this homework are two m-files called "ABCs_plotting" and
% "ABCs_numericalMethods". Open these files in MATLAB and complete it
% according to the directions contained within. 
% 
% Files to Complete: 
%       - ABCs_plotting.m
%       - ABCs_numericalMethods.m
% 
% ABCs File Testing:
%  >> ABCs_hw12_pretest.p
% 
% ==========================================================================
% COMMENTING
% --------------------------------------------------------------------------
% 
% Whenever you program, it is always a good idea to comment your code.
% Commenting helps you keep track of what you are attempting to code, and 
% it helps others in understanding why you wrote various lines of code.  
% Since the AutoGrader does not give partial credit for attempting a 
% problem, we have added a commenting system to give some incentive to at 
% least attempt each problem. From now on, when you write a solution to a
% problem, you should comment your code and explain what you were 
% attempting to code. Some good places to comment would be sections of your
% code that directly relate with your algorithm. However, don't comment
% every line of code. Instead comment the lines of code that are either  
% difficult to understand or are important to solving the problem. 
% 
% Commenting will purely be for extra-credit purposes, so if you don't want
% to comment your code, you don't have to. Your Section TA will grade the
% comments from each Homework and will keep track of your commenting points
% throughout the semester. Commenting points will not change the score you
% receive on a homework assignment, but they will be factored into your
% homework average at the end of the semester. 
% 
% Finally, if you come to help desk, you are expected to have your code
% commented. If a TA sees that your code is not commented, he or she will
% move on to another student until you comment your code.
% 
% ==========================================================================
% DEBUGGING
% --------------------------------------------------------------------------
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
% 		- Step in: if the line of code is a function, enter the function
% 		  	to go line by line
% 		- Step out: if you stepped in a function, step out will take you
%           back out
%   	- Continue/Run: Run until the next breakpoint or end of function
% - To clear all breakpoints, go to Debug->Clear all breakpoints or type
%   "dbclear all".
% 
% For additional documentation, you can look up the official MATLAB
% documentation under the help menu.
% 
% ==========================================================================
% PART 2. Drill Problems
% --------------------------------------------------------------------------
% 
% Included with this homework is a file entitled "HW12 Drill Problems.pdf",
% and included within are instructions for 6 drill problems that cover the
% following major topic(s):
% 
% 	Plotting
%   Numerical Methods
% 
% Follow the directions carefully to write code to complete the drill
% problems as described. Make sure files names as well as function headers
% are written exactly as described in the problem text. If your function
% headers are not written as specified, then you will recieve an automatic
% zero for the problem.
% 
% ==========================================================================
% PART 3. Testing Your Code
% --------------------------------------------------------------------------
% 
% You may use the following test cases for each problem to test your code.
% The function call with the test-inputs is shown in the first line of each
% test case, and the correct outputs are then displayed in subsequent lines
% for each test case.
% 
% --------------------------------------------------------------------------
% Drill Problem #1: topPun
% 
%   topPun('Maverisky',[4,3,5,4,0,0,2])
%       Output plot should be identical to that of the solution file.
% 
%   topPun('Coldas Iceman',[3,3,4,2,5,8,7,6])
%       Output plot should be identical to that of the solution file.
% 
%   topPun('Holly Shouldacouldawooda',[2,3,1,5,0,2])
%       Output plot should be identical to that of the solution file.
% 
% --------------------------------------------------------------------------
% Drill Problem #2: fieldGoalDenied
% 
%   load('fieldGoalDenied_testCases.mat')
%   figure(1)
%      [isDenied] = fieldGoalDenied_soln(fieldGoal1, patrick1)
%       figure(2)
%    [isDenied] = fieldGoalDenied(fieldGoal1, patrick1)
% 
%       isDenied => true
%       Output plot should be identical to that of the solution file.
% 
%   [isDenied] = fieldGoalDenied(fieldGoal2, patrick2)
%       isDenied => false
%       Output plot should be identical to that of the solution file.
% 
% --------------------------------------------------------------------------
% Drill Problem #3: metaData
% 
%   metaData_soln('test_1.xlsx')
%       Output plot should be identical to that of the solution file.
% 
%   metaData('test_2.xlsx')
%       Output plot should be identical to that of the solution file.
% 
%   metaData('test_3.xlsx')
%       Output plot should be identical to that of the solution file.
% 
% --------------------------------------------------------------------------
% Drill Problem #4: plotShapes
% 
%   plotShapes('circle',10,10,[2,3])
%           Output plot should be identical to that of the solution file.
% 
% 
%    plotShapes('square',100,0,[-20,40])
%           Output plot should be identical to that of the solution file.
% 
%     figure(1)
%     plotShapes_soln('square',100,-34,[30,-10])
%     plotShapes_soln('square',100,-34,[30,-10])
%           Output plot should be identical to that of the solution file.
% 
% --------------------------------------------------------------------------
% Drill Problem #5: intervention
% 
%    load('interventionData.mat')
% 	[corr1] = intervention(st1)
%       corr1 => [0.9789, 0.9792, 0.9684]
%       Output plot should be identical to that of the solution file.
% 
% 	[corr2] = intervention(st2)
%       corr2 => [0.9878, 0.9898, 0.9816]
%       Output plot should be identical to that of the solution file.
% 
%   [corr3] = intervention(st3)
%       corr3 => [0.7104, 0.8968, 0.1814]
%       Output plot should be identical to that of the solution file.
% 
% figure(1)
%    [corr4] = intervention_soln(st4)
%    [corr4] = intervention(st4)
%       corr4 => [0.0484, 0.0566, 0.0205]
%       Output plot should be identical to that of the solution file.
% 
% --------------------------------------------------------------------------
% Drill Problem #6: winterWonderland
% 
% 	winterWonderland(6,8,'ne')
%       Output plot should be identical to that of the solution file.
% 
% 	winterWonderland(25,12,'rh')
%       Output plot should be identical to that of the solution file.
% 
%   winterWonderland_soln(15,5,'pt')
%       Output plot should be identical to that of the solution file.
% 
%   winterWonderland_soln(40,15,'se')
%       Output plot should be identical to that of the solution file.
% 
    figure(1)
   winterWonderland_soln(40,15,'rt')
   winterWonderland(40,15,'rt')
%       Output plot should be identical to that of the solution file.
% ==========================================================================
% Click of the Week!!
% --------------------------------------------------------------------------
% 
%   http://i.imgur.com/hzNQj.gif
%   http://weknowmemes.com/wp-content/uploads/2012/06/listen-to-me-you-are-flawless.gif
% 
% ==========================================================================
% FINISHED!!!
% --------------------------------------------------------------------------
% 
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
