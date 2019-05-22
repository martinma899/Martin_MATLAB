%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : 04/original
% Course       : CS1371
% Section      : C03
% Collaboration: I worked on the assignment alone, with the help of the
% internet and matlab's help feature to look up matlab built in functions.
% I also helped a few others with concepts only, not on coding
% specifically.
%
% Files provided with this homework: 
%   - ABCs_hw04_pretest.p
%   - ABCs_logicals.m
%   - caesarCipher_soln.p
%   - criminalMinds_soln.p
%   - HW04 Drill Problems.pdf
%   - hw04.m
%   - meanEven_soln.p
%   - rhymeThyme_soln.p
%   - twinPrimes_soln.p
%   - vecResize_soln.p
%
% Files to submit:
%   - ABCs_logicals.m
%   - caesarCipher.m
%   - criminalMinds.m
%   - hw04.m
%   - meanEven.m
%   - rhymeThyme.m
%   - twinPrimes.m
%   - vecResize.m
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
% Part of this homework is an m-file called "ABCs_logicals". Open these
% files in MATLAB and complete it according to the directions contained
% within. 
%
% Files to Complete: 
%       - ABCs_logicals.m
%
% ABCs File Testing:
%  >> ABCs_hw04_pretest
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
% Included with this homework is a file entitled "HW04 Drill Problems.pdf",
% and included within are instructions for 6 drill problems that cover the
% following major topic(s):
%
%	Logicals
%   Logical Indexing
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
% Drill Problem #1: meanEven
%   out1 = meanEven([36,33,5,37,25,4,11,22,38,39])
%       out1 => 25
%
%   out2 = meanEven([6,39,38,19,32,6,17,37,32,38])
%       out2 => 25.3333
%
%   out3 = meanEven([26,1,34,37,27,30,30,16,26,7])
%       out3 => 27
%
%   Please note: These values are not rounded.  You must use 
%       isequal(meanEven(testCase),meanEven_soln(testCase)) and it must
%       output true to make sure the numbers match up
%
%--------------------------------------------------------------------------
% Drill Problem #2: twinPrimes
%
%   log1 = twinPrimes([504,661,335,1817,1184,2191,269,974,235])
%       log1 => [false true false false false false true false false]
%
%   log2 = twinPrimes([87,40,26,80,43,91,18,26,15])
%       log2 => [false false false false true false false false false]
%
%   log3 = twinPrimes([5,9419,31079,1384247,6])
%       log3 => [true true true true false]
%
%--------------------------------------------------------------------------
% Drill Problem #3: rhymeThyme
%
%   poem1 = rhymeThyme('This ought to rhyme. But I guess not.')
%       poem1 => false
%      
%   poem2 = rhymeThyme('One fish two fish. Red fish blue fish.')
%       poem2 => true
%      
%   poem3 = rhymeThyme(['I do not like green eggs and ham. I do not ' ...
%                           'like them, Sam-I-Am.'])
%       poem3 => false
%
%   poem4 = rhymeThyme('I think it is working. Hooray for some good coding.')
%       poem4 => true
%       
%--------------------------------------------------------------------------
% Drill Problem #4: vecResize
%
%   nvec1 = vecResize([1 5 4 8 9], 1.5)
%       nvec1 => [1 5 5 4 8 8 9]
%
%   nvec2 = vecResize(2:3:20, 0.75)
%       nvec2 => [2 8 11 17 20]
%
%   nvec3 = vecResize([1 2 4], 1.01)
%       nvec3 => [1 2 4]    % This is okay, because a stretch factor of
%                           % 1.01 on a 3 element vector is insignificant.
%
%--------------------------------------------------------------------------
% Drill Problem #5: criminalMinds
%
%	criminal1 = criminalMinds2([true],[true],[false],[true])
%       criminal1 => 'Suspect #3 is lying.'
%
 %  criminal2 = criminalMinds2([true false false true true],[false true ...
 %              true true false],[false true true true false],[false ...
 %              true true true false])
%       criminal2 => 'Suspect #1 is lying.'
%
 %  criminal3 = criminalMinds2([true true true false],[true true true ...
  %             false],[true true true false],[true true false false])
%       criminal3 => 'Suspect #4 is lying.'
%
%--------------------------------------------------------------------------
% Drill Problem #6: caesarCipher
%
%	coded1 = caesarCipher('I am so tired.', 18)
%       coded1 => 'A se kg lajwv.'
%
%   coded2 = caesarCipher('A se kg lajwv.', -18)
%       coded2 => 'I am so tired.'
%
%   coded3 = caesarCipher('Wait... Does this work?', -26)
%       coded3 => 'Wait... Does this work?'
%
%   coded4 = caesarCipher('When in Rome.',81)
%       coded4 => 'Zkhq lq Urph.'
%
%
%==========================================================================
% Click of the Week!!
%--------------------------------------------------------------------------
%
%   https://www.youtube.com/watch?v=gspaoaecNAg
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
