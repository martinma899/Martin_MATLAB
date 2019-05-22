%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : 2/original
% Course       : CS1371
% Section      : C03
% Collaboration: "I worked on the homework assignment alone, using
%                  course materials, http://www.mathworks.com/help/
%                  and http://www.mathworks.com/matlabcentral/."
%
% Files provided with this homework:  
%   - ABCs_hw02_pretest.p
%   - ABCs_string.m
%   - ABCs_vectors.m
%   - distCalc_soln.p
%   - gravCalc_soln.p
%   - HW02 Drill Problems.pdf
%   - hw02.m
%   - lawOfCosines_soln.p
%   - letThemEatCake_soln.p
%   - spherePacking_soln.p
%   - tippingPoint_soln.p
%
% Files to submit:
%   - ABCs_strings.m
%   - ABCs_vectors.m
%   - distCalc.m
%   - gravCalc.m
%   - hw02.m
%   - lawOfCosines.m
%   - letThemEatCake.m
%   - spherePacking.m
%   - tippingPoint.m
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
% Part of this homework are two m-files called "ABCs_strings" and 
% "ABCs_vectors". Open these files in MATLAB and complete them according to
% the directions contained within. 
%
% Files to Complete: 
%       - ABCs_strings.m
%       - ABCs_vectors.m
%
% ABCs File Testing:
%  >> ABCs_hw02_pretest.p
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
% Included with this homework is a file entitled "HW02 Drill Problems.pdf",
% and included within are instructions for 6 drill problems that cover the
% following major topic(s):
%
%	functions
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
% Drill Problem #1: gravCalc
%
%   Force of gravity between the Earth and the Moon
%   force1 = gravCalc(7.35e22, 3.84e8)
%       isequal(gravCalc(7.35e22, 3.84e8), gravCalc_soln(7.35e22, 3.84e8))
%       must output true
%
%   Force of gravity between the Earth and the ISS
%	force2 = gravCalc(370131, 6.77e6)
%       isequal(gravCalc(370131, 6.77e6), gravCalc_soln(370131, 6.77e6))
%       must output true
%
%--------------------------------------------------------------------------
% Drill Problem #2: distCalc
%
%	dist1 = distCalc(3, 0, 0, 4)
%       dist1 => 5
%
%	dist2 = distCalc(2, 2, 2, 3)
%       dist2 => 1
%
%	dist3 = distCalc(34, 10, 45, 124)
%       dist3 => 114.53
%
%--------------------------------------------------------------------------
% Drill Problem #3: lawOfCosines
%
%   c1 = lawOfCosines(4,5,19)
%       c1 => 1.7830
%
%   c2 = lawOfCosines(3,4,105)
%       c2 => 5.5867
%
%   c3 = lawOfCosines(427,307.9,87)
%       c3 => 513.1957
%
%--------------------------------------------------------------------------
% Drill Problem #4: tippingPoint
%
%	[before1, after1] = tippingPoint(8.75, 0.08, 12)
%       before1 => 1.05
%       after1  => 1.13
%
%	[before2, after2] = tippingPoint(13.50, 0.12, 25)
%       before1 => 3.38
%       after1  => 3.78
%
%   [before3, after3] = tippingPoint(5.05, 0.07, 50)
%       before1 => 2.53
%       after1  => 2.70
%
%--------------------------------------------------------------------------
% Drill Problem #5: spherePacking
%
%	num1 = spherePacking(5, 10)
%       num1 => 1
%
%	num2 = spherePacking(6, 10)
%       num2 => 0
%
%   num3 = spherePacking(1.5, 12)
%       num3 => 90
%
%--------------------------------------------------------------------------
% Drill Problem #6: letThemEatCake
%
%	mine1 = letThemEatCake(23, 5)
%       mine1 => 7
%
%	mine2 = letThemEatCake(7, 7)
%       mine2 => 1
%
%	mine3 = letThemEatCake(50, 12)
%       mine3 => 6
%
%==========================================================================
% Click of the Week!!
%--------------------------------------------------------------------------
%
%   https://www.youtube.com/watch?v=Hm3JodBR-vs
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
