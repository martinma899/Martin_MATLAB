%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : 1/original
% Course       : CS1371
% Section      : C03
% Collaboration: I worked on the homework assignment alone, and referred to
% http://www.mathworks.com/help and MATLAB's help featur for help.
%
% Files provided with this homework:  
%   - ABCs_functions.m
%   - ABCs_HomeworkOverview.m
%   - ABCs_hw01_pretest.p
%   - CS 1371 Homework Guide.pdf
%   - HW01 Drill Problems.pdf
%   - Testing Your Code.pdf
%   - backCalculate_soln.p
%   - dormTape_soln.p
%   - f_soln.p
%   - quad_soln.p
%   - rectangleMath_soln.p
%   - hw01.m
%
% Files to submit:
%   - ABCs_functions.m
%   - ABCs_HomeworkOverview.m
%   - backCalculate.m
%   - dormTape.m
%   - f.m
%   - quad.m
%   - rectangleMath.m
%   - hw01.m
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
% Part of this homework are two m-files called "ABCs_functions" and 
% "ABCs_HomeworkOverview". Open these files in MATLAB and complete it 
% according to the directions contained within. 
%
% Files to Complete: 
%       - ABCs_functions.m
%       - ABCs_Homework Overview.m
%
% ABCs File Testing:
%  >> ABCs_hw01_pretest
%
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% Included with this homework is a file entitled "HW01 Drill Problems.pdf",
% and included within are instructions for 5 drill problems that cover the
% following major topic(s):
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
% Drill Problem #1: rectangleMath
%
%   [area1, perim1] = rectangleMath(2, 2)
%       area1 => 4
%       perim1 => 8
%
%   [area2, perim2] = rectangleMath(3,0.8)
%       area2 => 2.4000
%       perim2 => 7.6000
%
%   [area3, perim3] = rectangleMath(7.2, 4.1)
%       area3 => 29.5200
%       perim3 => 22.6000
%
%--------------------------------------------------------------------------
% Drill Problem #2: backCalculate
%
%   [B1] = backCalculate(3, 5)
%   	B1 => 4
%      
%   [B2] = backCalculate(5, 17)
%       B2 => 16.2481
%
%   [B3] = backCalculate(12, 13)
%       B3 => 5
%
%--------------------------------------------------------------------------
% Drill Problem #3: quad
%
%   [pos1, neg1] = quad(-9, 0, 9)
%       pos1 => -1
%       neg1 => 1
%
%   [pos2, neg2] = quad(3, -12, 1)
%       pos2 => 3.9149
%       neg2 => 0.0851
%
%   [pos3, neg3] = quad(10, -5, -10)
%       pos3 => 1.2808
%       neg3 => -0.7808
%
%--------------------------------------------------------------------------
% Drill Problem #4: f
%
%   y1 = f(0)
%       y1 => -15.8427
%
%   y2 = f(1)
%       y2 => -5.0726
%
%   y3 = f(4)
%       y3 => 4.9360e+04
%
%--------------------------------------------------------------------------
% Drill Problem #5: dormTape
%
%   cost1 = dormTape(35, 0.4, 0.5, 0.1, 2)
%       cost1 => 75.4100
%
%   cost2 = dormTape(50, .25, .25, .5, 2)
%       cost2 => 116.3500
%
%==========================================================================
% Click of the Week!!
%--------------------------------------------------------------------------
%
%   https://www.youtube.com/watch?v=kTFZyl7hfBw
%o
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
