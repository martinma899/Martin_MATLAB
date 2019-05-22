%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : hw07/original
% Course       : CS1371
% Section      : C03
% Collaboration: I worked on the homework on my own, looking up MATLAB
% resources online on matlab's official website. Even if the last question
% almost drove me completely nuts I still didn't ask other people. The fact
% is that I am not a recreation mathematician, neither have I taken a
% number theory course. So giving us a situation heavily involving modular
% operators is just mind torturing....
%
% Excuse me for being too tired to type comments. Sean and Rachael, I still
% love you guys and appreciate you guys. Thank you. 
%{

    appreciation = 'Thank you Sean and Rachael for grading our work!';
    
    for i = 2:20
        appreciation(i,:) = appreciation(1,:);
    end

    disp(appreciation);
%}
% Files provided with this homework:  
%   - ABCs_hw07_pretest.p
%   - ABCs_iteration.m
%   - blackJackJr_soln.p
%   - brickLayer_soln.p
%   - countNum_soln.p
%   - HW07 DrillProblems.pdf
%   - hw007.m
%   - passwordProtector_soln.p
%   - scottSterling_soln.p
%   - templeOfTime_soln.p
%   - zelda1.mat
%   - zelda2.mat
%   - zelda3.mat
%
% Files to submit:
%   - ABCs_iteration.m
%   - blackJackJr.m
%   - brickLayer.m
%   - countNum.m
%   - hw007.m
%   - passwordProtector.m
%   - scottSterling.m
%   - templeOfTime.m
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
% Part of this homework is an m-file called "ABCs_iteration". Open these
% files in MATLAB and complete it according to the directions contained
% within. 
%
% Files to Complete: 
%       - ABCs_iteration.m
%
% ABCs File Testing:
%  >> ABCs_hw07_pretest
%
%==========================================================================
% DEBUGGING
%--------------------------------------------------------------------------
%
% MATLAB has a rich and powerful debugger that you can use to help you
% better understand your code.  With the debugger, you can step through
% your code line by line, step into functions that you call, and examine
% the workspaces of all of the functions currently on the stack.  This can
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
% Included with this homework is a file entitled "HW07 Drill Problems.pdf",
% and included within are instructions for 6 drill problems that cover the
% following major topic(s):
%
%	Iteration
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
% Drill Problem #1: countNum
%
%	count1 = countNum([2 7 8 9;5 6 8 0;2 11 4 5], 11)
%       count1 => 1
%
%   count2 = countNum([23 4 8 9 4 9;9 3 20 23 89 90], 9)
%       count2 => 3
%
%   count3 = countNum([31 9 40 5;25 67 2 8], 15)
%       count3 => 0
%
%--------------------------------------------------------------------------
% Drill Problem #2: blackJackJr
%
%   cards1 = blackJackJr([4, 3, 8, 7, 4, 4, 4])
%       cards1 => 3
%
%   cards2 = blackJackJr([9, 0, 8, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0])
%       cards2 => 12
%
%   cards3 = blackJackJr([3, 8, 1, 5, 5, 8, 5])
%       cards3 => 4
%
%--------------------------------------------------------------------------
% Drill Problem #3: brickLayer
%
%	wall1 = brickLayer(5, 7, 'blue')
%       wall1 => [' [blue]  [----]  [blue]  [----]  [blue]  [----]  [blue] ';
%            ' [----]  [blue]  [----]  [blue]  [----]  [blue]  [----] ';
%            ' [blue]  [----]  [blue]  [----]  [blue]  [----]  [blue] ';
%            ' [----]  [blue]  [----]  [blue]  [----]  [blue]  [----] ';
%            ' [blue]  [----]  [blue]  [----]  [blue]  [----]  [blue] '];
% 
%   wall2 = brickLayer(13, 5, 'green')
%       wall2 => [' [green]  [-----]  [green]  [-----]  [green] ';
%                [' [-----]  [green]  [-----]  [green]  [-----] ';
%                [' [green]  [-----]  [green]  [-----]  [green] ';
%                [' [-----]  [green]  [-----]  [green]  [-----] ';
%                [' [green]  [-----]  [green]  [-----]  [green] ';
%                [' [-----]  [green]  [-----]  [green]  [-----] ';
%                [' [green]  [-----]  [green]  [-----]  [green] ';
%                [' [-----]  [green]  [-----]  [green]  [-----] ';
%                [' [green]  [-----]  [green]  [-----]  [green] ';
%                [' [-----]  [green]  [-----]  [green]  [-----] ';
%                [' [green]  [-----]  [green]  [-----]  [green] ';
%                [' [-----]  [green]  [-----]  [green]  [-----] ';
%                [' [green]  [-----]  [green]  [-----]  [green] '];
%
%   wall3 = brickLayer(3, 3, 'MATLAB')
%       wall3 => [' [MATLAB]  [------]  [MATLAB] ';
%                [' [------]  [MATLAB]  [------] ';
%                [' [MATLAB]  [------]  [MATLAB] '];
%
%--------------------------------------------------------------------------
% Drill Problem #4: scottSterling
%
%	exhaustion1 = scottSterling([10,10,12,12;6,8,8,6])
%       exhaustion1 => 1
%
%   exhaustion2 = scottSterling([1,19,2,23.5,17,9;9,8,3,6,2,5])
%       exhaustion2 => 7.8606
%
%   exhaustion3 = scottSterling([4.71,1.80,21.96,24.01,17.83,25.47,...
%           8.80,5.70,3.55;7.41,3.60,1.78,1.01,7.14,-.96,.46,5.45,8.85])
%       exhaustion3 => 7.0418
%
%   exhaustion4 = scottSterling([18,26,10,0,2,16,17,-1,14,23;0,8,...
%           -2,10,2,6,6,6,3,9])
%       exhaustion4 => 5.5516
%
%--------------------------------------------------------------------------
% Drill Problem #5: passwordProtector
%
%	coded1 = passwordProtector('Bond, James Bond.')
%       coded1 => '°N¿zë,Ôëßyë¿°N¿zë.'
%
%   coded2 = passwordProtector('ThisismySUPER sneaky P4$$w0rd :D')
%       coded2 => 'Àtu¿u¿y¿ÀÀÀ°ÔÀ¿zëëßw¿À4$$¿0¿ë:°Ô'
%
%   coded3 = passwordProtector('passwordpasswordpassword')
%       coded3 => 'uëßxx¿twëuëßxx¿twëuëßxx¿twë'
%
%   coded4 = passwordProtector('Wilbur the Spy Pig')
%       coded4 => 'Àruëß¿¿¿qëÀy¿Yrp'
%
%--------------------------------------------------------------------------
% Drill Problem #6: templeOfTime
% 
%   load('zelda1.mat')
%   [weapon1, rupees1] = templeOfTime(start1,card1,space1,letter1,pot1)
%       weapon1 => 'Lens of Truth'
%       rupees1 => 93
%
%   load('zelda2.mat')
%   [weapon2, rupees2] = templeOfTime(start2,card2,space2,letter2,pot2)
%       weapon2 => 'Quiver'
%       rupees2 => 158
%
%   load('zelda3.mat')
%   [weapon3, rupees3] = templeOfTime(start3,dir3,space3,letter3,pot3)
%       weapon3 => 'Master Sword'
%       rupees3 => 142
%
%==========================================================================
% Click of the Week!!
%--------------------------------------------------------------------------
%
%   https://www.youtube.com/watch?v=8F9jXYOH2c0
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment!  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
