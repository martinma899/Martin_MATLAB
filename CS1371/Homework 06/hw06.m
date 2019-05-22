%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : hw06/original
% Course       : CS1371
% Section      : C03
% Collaboration: I worked on this thing completely on my own. No sharing.
% No nothing but telling others it's not that hard. I also referred to
% MATLAB's help feature and online help files.
%
% Files provided with this homework:  
%   - ABCs_conditionals.m
%   - ABCs_hw06_pretest.p
%   - battleRoyal_soln.p
%   - criticalFailure_soln.p
%   - foolproof_soln.p
%   - HW06 Drill Problems.pdf
%   - hw06.m
%   - rPS_soln.p
%   - slidinDemDMs_soln.p
%
% Files to submit:
%   - ABCs_conditionals.m
%   - battleRoyal.m
%   - criticalFailure.m
%   - foolproof.m
%   - hw06.m
%   - rPS.m
%   - slidinDemDMs.m
%   - (Optional: powerOfTwo.m if you are using it as a helper function for 
%   foolproof.m and attaching it as a separate file)
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
% Part of this homework is an m-file called "ABCs_conditionals". Open these
% files in MATLAB and complete it according to the directions contained
% within. 
%
% Files to Complete: 
%       - ABCs_conditionals.m
%
% ABCs File Testing:
%  >> ABCs_hw06_pretest.p
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
% Included with this homework is a file entitled "HW06 Drill Problems.pdf",
% and included within are instructions for 5 drill problems that cover the
% following major topic(s):
%
%	Conditionals
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
% Drill Problem #1: criticalFailure
%
%	result1 = criticalFailure([1,17])
%       result1 => 'Left Arm Wounded'
%
%   result2 = criticalFailure([2,17])
%       result2 => 'Good Job!'
%
%   result3 = criticalFailure([1,5])
%       result3 => 'Right Leg Wounded
%
%   result4 = criticalFailure([11,9])
%       result4 => 'Good Job!'
%
%
%--------------------------------------------------------------------------
% Drill Problem #2: foolproof
%
%   out1 = foolproof(true)
%       out1 => 'The input type is invalid. Please input a natural number.'
%      
%   out2 = foolproof('https://upload.wikimedia.org/wikipedia/commons/9/9f/Cat_public_domain_dedication_image_0012.jpg')
%       out2 => 'When you use the ' symbol, it clogs the gears in the computer's calculator. Please input a natural number.'
%      
%   out3 = foolproof(3.14159)
%       out3 => 'Please input a natural number.'
%     
%   out4 = foolproof(4)
%       out4 => true
%
%--------------------------------------------------------------------------
% Drill Problem #3: rPS
%
%   winner1 = rPS('Bailey-Ruby','Nima-Cardstock')
%       winner1 => 'Cardstock beats Ruby. Nima wins.'
%      
%   winner2 = rPS('Adam-Edge','Mo-Safety')
%       winner2 => 'Tie; try again.'
%      
%   winner3 = rPS('Hayley-Hair','Bangseh-Wrapping')
%       winner3 => 'Hair beats Wrapping. Hayley wins.'
%     
%   winner4 = rPS('Olivia-Limestone','Ryan-Edge')
%       winner4 => 'Limestone beats Edge. Olivia wins.'
%
%--------------------------------------------------------------------------
% Drill Problem #4: slidinDemDMs
%
% 	DMScore1 = slidinDemDMs('Hey, I really like you and think we should date.')
%       DMScore1 => 'You are looking for love in all the wrong places.'
%
%   DMScore2 = slidinDemDMs('Heyyy how is bae today <3')
%       DMScore2 => 'Like a ball at the top of a hill, you have potential.'
%
%   DMScore3 = slidinDemDMs('Heyyyyyyyyy')
%       DMScore3 => 'Like a ball at the top of a hill, you have potential.'
%
%   DMScore4 = slidinDemDMs('I love CS 1371 <3 <3!')
%       DMScore4 => 'Are you a bank? Because you have acquired interest!'
%
%--------------------------------------------------------------------------
% Drill Problem #5: battleRoyal
%
%   out1 = battleRoyal('Kane,Undertaker,John Cena',[91,93,96],[false,false,true])
%       out1 => 'John Cena wins by absolute domination!!!'
%
%   out2 = battleRoyal('Rey Mysterio,Seth Rollins,The Great Khali',[84,89,84],[true,false,false])
%       out2 => 'Seth Rollins wins by a landslide!'
%
%   out3 = battleRoyal('Batista,The Rock,Big Show',[88,91,87],[false,true,false])
%       out3 => 'The underdog Big Show wins!'
%
%==========================================================================
% Click of the Week!!
%--------------------------------------------------------------------------
%
%   https://www.destroyallsoftware.com/talks/wat
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
