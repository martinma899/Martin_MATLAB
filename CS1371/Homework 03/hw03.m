%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : 03/original
% Course       : CS1371
% Section      : B03
% Collaboration: <place here one of the following:
%                 "I worked on the homework assignment alone, using
%                  only course materials."
%                 OR
%                 "I worked on this homework with <give the names of the
%                  people you worked with>, used solutions or partial
%                  solutions provided by <name the people or other
%                  sources>, and referred to <cite any texts, web sites, or
%                  other materials not provided as course materials for CS
%                  1371.>"
%
%
% Files provided with this homework:  
%   - ABCs_hw03_pretest.p
%   - ABCs_vectors.m
%   - ABCs_strings.m
%   - caesarSalad_soln.p
%   - gradeSorter_soln.p
%   - HW03 Drill Problems.pdf
%   - hw03.m
%   - interweave_soln.p
%   - multiVar_soln.p
%   - theRatio_soln.p
%   - varInfo_soln.p
%
% Files to submit:
%   - ABCs_vectors.m
%   - ABCs_strings.m
%   - caesarSalad.m
%   - gradeSorter.m
%   - hw03.m
%   - interweave.m
%   - multiVar.m
%   - theRatio.m
%   - varInfo.m
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
% Part of this homework is an m-file called "ABCs_logicals". Open this
% file in MATLAB and complete it according to the directions contained
% within. 
%
% Files to Complete: 
%       - ABCs_logicals.m
%
% ABCs File Testing:
%  >> ABCs_hw03_pretest.p
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
% Included with this homework is a file entitled "HW03 Drill Problems.pdf",
% and included within are instructions for 6 drill problems that cover the
% following major topic(s):
%
%	vectors
%   strings
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
% Drill Problem #1: varInfo
%
%   info1 = varInfo('I love MATLAB!!')
%       info1 => 'This variable is of class char and has a value of ''I
%                 love MATLAB!!''.'
%
%   info2 = varInfo(34)
%       info2 => 'This variable is of class double and has a value of
%                 ''34''.'
%
%   info3 = varInfo([1 2 3 4 5])
%       info3 => 'This variable is of class double and has a value of
%                 ''1  2  3  4  5''.'
%
%   %% The strings above are written as they would need to be typed into
%   MATLAB and are not actually what will be displayed in the Command 
%   Window. %%
%
%--------------------------------------------------------------------------
% Drill Problem #2: multiVar
%
%   z1 = multiVar([1 2 3 4 5], [5 4 3 2 1])
%       z1 => [0.6  0.7646  0.7019  0.5  0.1727]
%
%   z2 = multiVar([0 0.25 0.5 0.75 1], [1 25 50 75 100])
%       z2 => [0  0.2419  0.4852  0.7280  0.9708]
%
%--------------------------------------------------------------------------
% Drill Problem #3: theRatio
%
%   ratio1 = theRatio([342, 467, 426, 587], [2948, 3185, 3120, 3597], ...
%        [1960, 1961, 1962, 1963])
%       ratio1 => [1960, 1961]
%
%   ratio2 = theRatio([0, 467, 784, 835, 1010, 1389], [2748, 2948, 5938, ...
%        7901, 9213, 10163], [1950, 1960, 1970, 1980, 1990, 2000])
%       ratio2 => [1950, 1960]
%
%--------------------------------------------------------------------------
% Drill Problem #4: interweave
%
%   mixed1 = interweave([1 2 3 4 5],[6 7 8 9 10])
%       mixed1 => [1 6 2 7 3 8 4 9 5 10]
%
%   mixed2 = interweave([5 1 5 9 1], [4 1 3])
%       mixed2 => [5 4 1 1 5 3 9 0 1 0]
%
%   mixed3 = interweave([8 6 7], [5 3 0 9])
%       mixed3 => [8 5 6 3 7 0 0 9]
%
%--------------------------------------------------------------------------
% Drill Problem #5: gradeSorter
%
%   grade1 = gradeSorter([75 84 72 71 87 91 54], 'OTEITLG', 'LGTTIEO')
%       grade1 = 'LE TI TG OL ET IT GO'
%
%   grade2 = gradeSorter([66 70 64 89 65 99 100], 'ILCHBND', 'TDKOATO')
%       grade2 = 'DO NT HO LD IT BA CK'
%
%   grade3 = gradeSorter([88 77 100], 'YRA', 'MEN')
%       grade3 = 'AN YM RE'
%
%--------------------------------------------------------------------------
% Drill Problem #6: caesarSalad
%
	coded1 = caesarSalad('piglets', 3)
%       coded1 => 'sljohwv'
%
   coded2 = caesarSalad('sljohwv', -3)
%       coded2 => 'piglets'
%
   coded3 = caesarSalad('bae', -26)
%       coded3 => 'bae'
%
   coded4 = caesarSalad('logizomechanophobia',79)
%       coded4 => 'mphjapnfdibopqipcjb'
%
%==========================================================================
% Click of the Week!!
%--------------------------------------------------------------------------
%
%   https://www.youtube.com/watch?v=YLAvhE4a_hI
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
