%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : hw13/original
% Course       : CS1371
% Section      : C03
% Collaboration: "I worked on the homework assignment alone, using
%                  only course materials."
%
%
% Files provided with this homework:  
%   - ABCs_hw13_pretest.p
%   - ABCs_images.m
%   - abcs_pretest1.png
%   - apples.png
%   - ascii2image_soln.p
%   - cat1.png
%   - cat2.png
%   - cat3.png
%   - cat4.png
%   - centennial_park.png
%   - checkImage_soln.png
%   - Daria.png
%   - darthVader.txt
%   - dataFit.mat
%   - DeeDee.png
%   - earth.txt
%   - flower1.png
%   - flower2.png
%   - fox_theater.png
%   - geofilter.mat
%   - georgiaTech.txt
%   - hairParlour_soln.p
%   - HW13 Drill Problems.pdf
%   - hw13.m
%   - kPossible.png
%   - oranges.png
%   - polyFun_soln.p
%   - rapunzel.png
%   - rgb_hsl.m
%   - snapchat_soln.p
%   - superSonic.txt
%   - tangerines.png
%   - tech_tower.png
%   - toupee1.png
%   - toupee2.png
%   - toupee3.png
%   - toupee4.png
%   - trumpYourCat_soln.p
%   - varsity.png
%
% Files to submit:
%   - ABCs_images.m
%   - ascii2image.m
%   - checkImage.m
%   - hairParlour.m
%   - hw13.m
%   - polyFun.m
%   - snapchat.m
%   - trumpYourCat.m
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
% Part of this homework is an m-file called "ABCs_images". Open these
% files in MATLAB and complete it according to the directions contained
% within. 
%
% Files to Complete: 
%       - ABCs_images.m
%
% ABCs File Testing:
%  >> ABCs_hw13_pretest
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
% Included with this homework is a file entitled "HW13 Drill Problems.pdf",
% and included within are instructions for 6 drill problems that cover the
% following major topic(s):
%
%	Images
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
% Drill Problem #1: polyFun
%
%    load('dataFit.mat')
%     figure(1)
%     polyFun_soln(x3,y3,p3)
% 	polyFun(x3,y3,p3)
%       Output plot should be identical to that produced by the solution function
%
%	polyFun(x2,y2,p2)
%       Output plot should be identical to that produced by the solution function
%
%   polyFun(x3,y3,p3)
%       Output plot should be identical to that produced by the solution function
%
%   polyFun(x4,y4,p4)
%       Output plot should be identical to that produced by the solution function
%
%--------------------------------------------------------------------------
% Drill Problem #2: checkImage
%	
%   out1 = checkImage('apples.png', 'oranges.png')
%       out1 => 'The images have different dimensions.'
%
%   out2 = checkImage('flower1.png', 'flower2.png')
%       out2 => 'The images are the same.'
%
%   out3 = checkImage_soln('oranges.png', 'tangerines.png')
%      out3 => 'The RGB values are different.' 
%      Output image should be identical to that produced by the solution function
%
%
% As a double-check (where 'orangesVStangerines_soln.png' is the image produced 
%       by the solution function):
%
%  out4 = checkImage('orangesVStangerines.png', 'orangesVStangerines_soln.png')
%       out4 => 'The images are the same.'
%
%--------------------------------------------------------------------------
% Drill Problem #3: trumpYourCat
%
%   trumpYourCat_soln('cat1.png', 'toupee1.png')
%       Output image should be identical to that produced by the solution function
%
%    trumpYourCat('cat2.png', 'toupee2.png');
%    trumpYourCat_soln('cat2.png', 'toupee2.png');
%    checkImage('trumped_myans_cat2.png','trumped_cat2.png')
%       trumpYourCat('cat3.png', 'toupee3.png');
%    trumpYourCat_soln('cat3.png', 'toupee3.png');
%    checkImage('trumped_myans_cat3.png','trumped_cat3.png')
%       trumpYourCat('cat4.png', 'toupee4.png');
%    trumpYourCat_soln('cat4.png', 'toupee4.png');
%    checkImage('trumped_myans_cat4.png','trumped_cat4.png')
%       Output image should be identical to that produced by the solution function
%
%   trumpYourCat('cat3.png', 'toupee3.png')
%       Output image should be identical to that produced by the solution function
%
%   trumpYourCat('cat4.png', 'toupee4.png')
%       Output image should be identical to that produced by the solution function
%
%--------------------------------------------------------------------------
% Drill Problem #4: hairParlour
%
%   hairParlour('kPossible.png', 'Red', 'Brunette')
%       Output image should be identical to that produced by the solution function
%
%   hairParlour('DeeDee.png', 'Blonde', 'Blonde')
%       Output image should be identical to that produced by the solution function
%
%   hairParlour('Daria.png', 'Brunette', 'Blonde')
%       Output image should be identical to that produced by the solution function
%
%--------------------------------------------------------------------------
% Drill Problem #5: ascii2image
%
%   load('ASCIIkey.mat');
%   ascii2image('darthVader.txt', chars, vals)
%       Output image should be identical to that produced by the solution function
%
%   ascii2image('superSonic.txt', chars, vals)
%       Output image should be identical to that produced by the solution function
%
%   ascii2image('georgiaTech.txt', chars, vals)
%       Output image should be identical to that produced by the solution function
%
%   ascii2image('earth.txt', chars, vals)
%       Output image should be identical to that produced by the solution function
%
%--------------------------------------------------------------------------
% Drill Problem #6: snapchat
%
%   load('geofilter.mat');
%   snapchat_soln('varsity.png', 1, [])
%       Output image should be identical to that produced by the solution function
%
%   snapchat_soln('fox_theater.png', 3, 2)
%       Output image should be identical to that produced by the solution function
%
%   snapchat_soln('tech_tower.png', 2, [])
%       Output image should be identical to that produced by the solution function
%
%   snapchat('centennial_park.png', 4, geofilter)
%       Output image should be identical to that produced by the solution function
%
%==========================================================================
% Click of the Week!!
%--------------------------------------------------------------------------
%
%   https://www.youtube.com/watch?v=mxQSmkEVXdE
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
