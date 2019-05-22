%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : hw05/original
% Course       : CS1371
% Section      : C03
% Collaboration: I worked on this thing alone, with the help of MATLAB's
% official help website. Didn't help anyone or receive help from human
% beings. Authenticity confirmed.
%
% Files provided with this homework:  
%   - ABCs_arrays.m
%   - ABCs_hw05_pretest.p
%   - ABCs_masking.m
%   - arrReplace_soln.p
%   - asciiResize_soln.p
%   - asciiResize_TestCases.mat
%   - camelCase_soln.p
%   - deflateGate_soln.p
%   - howFall_soln.p
%   - HW05 Drill Problems.pdf
%   - hw05.m
%   - powerOfTwo_soln.p
%   - testCase1.mat
%
% Files to submit:
%   - ABCs_arrays.m
%   - ABCs_masking.m
%   - arrReplace.m
%   - asciiResize.m
%   - camelCase.m
%   - deflateGate.m
%   - howFall.m
%   - hw05.m
%   - powerOfTwo.m
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
% Part of this homework are two m-files called "ABCs_arrays" and 
% "ABC_masking". Open these files in MATLAB and complete it according to 
% the directions contained within. 
%
% Files to Complete: 
%       - ABCs_arrays.m
%       - ABCs_masking.m
%
% ABCs File Testing:
%  >> ABCs_hw05_pretest
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
% Included with this homework is a file entitled "HW06 Drill Problems.pdf",
% and included within are instructions for 5 drill problems that cover the
% following major topic(s):
%
%	Arrays
%   Masking
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
% Drill Problem #1: arrReplace
%
%   replaced1 = arrReplace([4, 0, 4; 0, 4, 0; 4, 0, 4], magic(3), 4)
%       replaced1 => [8 0 6;
%                     0 5 0;
%                     4 0 2]
%
%   replaced2 = arrReplace([12 3 7 1; 1 12 7 1; 1 3 12 1; 1 3 7 12],...
%               [1 2 4 6; 8 3 9 0; 4 5 7 2; 0 3 1 1], 12)
%       replaced2 => [1 3 7 1;
%                     1 3 7 1;
%                     1 3 7 1;
%                     1 3 7 1]
%
%  replaced3 = arrReplace([1 9 2 3 5; 8 13 9 9 55; 89 9 233 9 9], [100 ...
%                1 53 19 70; 8 96 21 34 1678; 722 144 41 377 610], 9)
%       replaced3 => [ 1   1   2   3   5;
%                      8  13  21  34  55;
%                     89 144 233 377 610]
%
%--------------------------------------------------------------------------
% Drill Problem #2: asciiResize
%
%   load('asciiResize_TestCases.mat')
%	out1 = asciiResize(SR71, 1.3)
%       out1 => Solution should be identical to the output of 
%               asciiResize_soln(SR71,1.3)
%
%	out2 = asciiResize(Liberty, 2)
%       out2 => Solution should be identical to the output of 
%               asciiResize_soln(Liberty,2)
%	
%   out3 = asciiResize(AirJordan, 1)
%        out3 => Solution should be identical to the output of 
%                asciiResize_soln(AirJordan,1)
%
%--------------------------------------------------------------------------
% Drill Problem #3: howFall
%
%	[log1, fall1] = howFall([40, 44, 30, 15; 66, 7, 23, 18],16)
%       log1 => false
%       fall1 => ['There will be 6 leaves remaining: 3 green, 1 ' ...
%                'yellow, 1 orange, and 1 brown.']
%
%   [log2, fall2] = howFall([11 4 3 2 1 1 9 10],2)
%       log2 => false
%       fall2 => ['There will be 5 leaves remaining: 0 green, 0 ' ...
%                'yellow, 3 orange, and 2 brown.']
%
%   [log3, fall3] = howFall([40 38 41 44; 37 39 50 35; 42 49 36 43],34)
%       log3 => false
%       fall3 => ['There will be 12 leaves remaining: 2 green, 1 ' ...
%                'yellow, 6 orange, and 3 brown.']
%
%   [log4, fall4] = howFall([9 15; 2 15; 4 2; 3 8; 7 4; 3 3], 9)
%       log4 => true
%       fall4 => ['There will be 2 leaves remaining: 0 green, 0 ' ...
%                'yellow, 2 orange, and 0 brown.']
%
%--------------------------------------------------------------------------
% Drill Problem #4: powerOfTwo
%
%	power1 = powerOfTwo(1024)
%       power1 => true
%
%   power2 = powerOfTwo(63)
%       power2 => false
%
%   power3 = powerOfTwo(32768)
%       power3 => true
%
%   power4 = powerOfTwo(1)
%       power4 => false
%
%--------------------------------------------------------------------------
% Drill Problem 5: deflateGate
%
%   load('testCase1')
%      [filtered1, broken1] = deflateGate(quarter1, quarter2, quarter3, quarter4)
%       filtered1 => stored in variable ans11
%       broken1 => stored in variable ans12 (must be class logical)
%     
%   [filtered2, broken2] = deflateGate(q1, q2, q3, q4)
%       filtered2 => stored in variable ans21
%       broken2 => stored in variable ans22 (must be class logical)
%
%--------------------------------------------------------------------------
% Drill Problem #6: camelCase
%
%   out1 = camelCase('I am a Ramblin Wreck from Georgia Tech')
%       out1 => 'iAmARmblnWrckFrmGrgTch'
%
%   out2 = camelCase('UP WITH THE WHITE AND GOLD')
%       out2 => 'upWthThWhtAndGld'
%
%   out3 = camelCase('wHats the GOOD WorD')
%       out3 => 'whtsThGdWrd'
%
%
%==========================================================================
% Click of the Week!!
%--------------------------------------------------------------------------
%
%   https://www.youtube.com/watch?v=cZO9tMetxno
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
%
% CngrtltnsYvFnshdThsHmwrkAssgnmntBfrYTrnInYrCdBSrYHvTstdItThrghlyOncYvTstd
% ItYMySbmtItTTsqrBSrAllFlsArSbmttdWthThCrrctFlnms
%
% lol