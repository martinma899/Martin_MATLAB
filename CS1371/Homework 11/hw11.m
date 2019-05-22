%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : hw11
% Course       : CS1371
% Section      : C03
% Collaboration:  "I worked on the homework assignment alone, using
%                  only course materials."
% Files provided with this homework:
%   - ABCs_hw11_pretest.p
%   - ABCs_recursion.m
%   - choCollatz_soln.p
%   - determinant_soln.p
%   - flood_soln.p
%   - fountainOfYouth_soln.p
%   - generatePeople.p
%   - HW11 Drill Problems.pdf
%   - hw11.m
%   - jinkies_soln.p
%   - masks.mat
%   - mazes.mat
%   - sixDegreesOfWaldo_soln.p
%   - speedStack_soln.p
%   - WaldoTestCases.mat
%
% Files to submit:
%   - ABCs_recursion.m
%   - choCollatz.m
%   - deteminant.m
%   - flood.m
%   - fountainOfYouth.m
%   - hw11.m
%   - jinkies.m
%   - sixDegreesOfWaldo.m (Optional: This problem is Extra Credit. Only 
%   submit if you choose to do this problem for extra credit.)
%   - speedStack.m
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
% Part of this homework is an m-file called "ABCs_recursion". Open these
% files in MATLAB and complete it according to the directions contained
% within. 
%
% Files to Complete: 
%       - ABCs_recursion.m
%
% ABCs File Testing:
%  >> ABCs_hw11_pretest.p
%
%==========================================================================
% COMMENTING
%--------------------------------------------------------------------------
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
% Included with this homework is a file entitled "HW11 Drill Problems.pdf",
% and included within are instructions for 6 drill problems that cover the
% following major topic(s):
%
%	Recursion
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
% Drill Problem #1: choCollatz
%
%   [left1, num1] = choCollatz(8)
%       left1 => 1
%       num1 => 3
%
%   [left2, num2] = choCollatz(902)
%       left2 => 1
%       num2 => 37
%
%   [left3, num3] = choCollatz(0)
%       left3 => 0
%       num3 => 0
%
%--------------------------------------------------------------------------
% Drill Problem #2: jinkies
%
%   load('masks.mat')
%	[villain1, masks1] = jinkies(stPhantomShadow)
%       villain1 => 'Cosgood Creeps'
%       masks1 => 2
%
%	[villain2, masks2] = jinkies(stHyde)
%       villain2 => 'Dr. Jekyll'
%       masks2 => 4
%
%   [villain3, masks3] = jinkies(stWitch)
%       villain3 => 'Zeke'
%       masks3 => 5
%
%   [villain4, masks4] = jinkies(stScrappy)
%       villain4 => 'Scrappy-Doo'
%       masks4 => 9
%
%--------------------------------------------------------------------------
% Drill Problem #3: speedStack
%
%   [out1] = speedStack(3,'1')
%       out1 => 
%               ['  1  ';
%                ' 1 1 ';
%                '1 1 1']
%
%   [out2] = speedStack(10,'O')
%       out2 =>
% 
%       ['         O         ';
%        '        O O        ';
%        '       O O O       ';
%        '      O O O O      ';
%        '     O O O O O     ';
%        '    O O O O O O    ';
%        '   O O O O O O O   ';
%        '  O O O O O O O O  ';
%        ' O O O O O O O O O ';
%        'O O O O O O O O O O']
%
%   [out3] = speedStack(30,'#')
%       out3 =>
% 
%    ['                             #                             ';
%     '                            # #                            ';
%     '                           # # #                           ';
%     '                          # # # #                          ';
%     '                         # # # # #                         ';
%     '                        # # # # # #                        ';
%     '                       # # # # # # #                       ';
%     '                      # # # # # # # #                      ';
%     '                     # # # # # # # # #                     ';
%     '                    # # # # # # # # # #                    ';
%     '                   # # # # # # # # # # #                   ';
%     '                  # # # # # # # # # # # #                  ';
%     '                 # # # # # # # # # # # # #                 ';
%     '                # # # # # # # # # # # # # #                ';
%     '               # # # # # # # # # # # # # # #               ';
%     '              # # # # # # # # # # # # # # # #              ';
%     '             # # # # # # # # # # # # # # # # #             ';
%     '            # # # # # # # # # # # # # # # # # #            ';
%     '           # # # # # # # # # # # # # # # # # # #           ';
%     '          # # # # # # # # # # # # # # # # # # # #          ';
%     '         # # # # # # # # # # # # # # # # # # # # #         ';
%     '        # # # # # # # # # # # # # # # # # # # # # #        ';
%     '       # # # # # # # # # # # # # # # # # # # # # # #       ';
%     '      # # # # # # # # # # # # # # # # # # # # # # # #      ';
%     '     # # # # # # # # # # # # # # # # # # # # # # # # #     ';
%     '    # # # # # # # # # # # # # # # # # # # # # # # # # #    ';
%     '   # # # # # # # # # # # # # # # # # # # # # # # # # # #   ';
%     '  # # # # # # # # # # # # # # # # # # # # # # # # # # # #  ';
%     ' # # # # # # # # # # # # # # # # # # # # # # # # # # # # # ';
%     '# # # # # # # # # # # # # # # # # # # # # # # # # # # # # #']
%
%--------------------------------------------------------------------------
% Drill Problem #4: determinant
%
% 	det1 = determinant([1 8; 9 2])
%       det1 => -70
%
%   det2 = determinant([1 8 4; 5 1 7; 2 9 6])
%       det2 => -13
%
%   det3 = determinant([4 2 9 1; 6 9 1 2; 7 5 0 3; 1 3 7 2])
%       det3 => -736
%
%   det4 = determinant([1 1 1 1 1; 2 2 2 2 2; 3 3 3 3 3;...
%                       4 4 4 4 4; 5 5 5 5 5])
%       det4 => 0
%
%--------------------------------------------------------------------------
% Drill Problem #5: fountainOfYouth
%
%   load('mazes.mat')
%    [log1] = fountainOfYouth(maze1)
%       log1 => true
% 
%    [log2] = fountainOfYouth(maze2)
%       log2 => false
% 
%    [log3] = fountainOfYouth(maze3)
%       log3 => true
% 
%    [log4] = fountainOfYouth(maze4)
%       log4 => true
% 
%    [log5] = fountainOfYouth(maze5)
%       log5 => false
%
%--------------------------------------------------------------------------
% Drill Problem #6: flood
%
% 	out1 = flood([1, 1, 2, 1, 1])
%       out1 => 0
%
%   out2 = flood([0, 0, 2, 1, 1, 2])
%       out2 => 2
%
%   out3 = flood([1, 3, 5, 7, 6, 5, 4, 6])
%       out3 => 3
%
%   out4 = flood([10, 3, 5, 1, 8, 7, 10, 4, 7, 2, 3, 5, 1, 14, 13, 14])
%       out3 => 65
%
% --------------------------------------------------------------------------
% Drill Problem EXTRA CREDIT: sixDegreesOfWaldo
% 
%    load('WaldoTestCases.mat');
%    [exists1, degree1] = sixDegreesOfWaldo(waldo1)
%           exists1 => false
%           degree1 => 0
% 
%    [exists2, degree2] = sixDegreesOfWaldo(waldo2)
%           exists2 => true
%           degree2 => 0
% 
%    [exists3, degree3] = sixDegreesOfWaldo(waldo3)
%           exists3 => true
%           degree3 => 1
%           (FYI: Waldo is the 4th friend of Otis - waldo3.Friends(4))
% 
%    [exists4, degree4] = sixDegreesOfWaldo(waldo4)
%           exists4 => true
%           degree4 => 2
%           (FYI: Waldo is the 1st friend of the 5th friend of Otis - 
%                waldo4.Friends(5).Friends(1))
% 
%    [exists5, degree5] = sixDegreesOfWaldo(waldo5)
%           exists5 => true
%           degree5 => 6
%           (FYI: Waldo is the 1st friend of the 4th friend of the 1st
%           friend of the 1st friend of the 1st friend of the 2nd friend of
%           Otis - 
%           waldo5.Friends(2).Friends(1).Friends(1).Friends(1).Friends(4).Friends(1))
%
%==========================================================================
% Click of the Week!!
%--------------------------------------------------------------------------
%
%   https://www.youtube.com/watch?v=0xojO-4VFPw
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
