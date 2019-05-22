% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : hw09/original
% Course       : CS1371
% Section      : C03
% Collaboration: Worked on everything on my own. Helped a few people along
% the way but strictly on the conceptual level. People do actually use C++
% style to program matlab. I mean. Seriously.
% 
% Files provided with this homework:  
%   - ABCs_CellArrays.m
%   - ABCs_HighLevelFileIO.m
%   - ABCs_hw09_pretest.p
%   - battlefield_Characters.xls
%   - battlefield_Scores.xls
%   - countCelery_soln.p
%   - data1.xlsx
%   - data2.xlsx
%   - data3.xlsx
%   - data4.xlsx
%   - driveTime_soln.p
%   - feeFiFauxPho_soln.p
%   - HW09 Drill Problems.pdf
%   - hw09.m
%   - hyruleCastle_Characters.xls
%   - hyruleCastle_Scores.xls
%   - jackBlack_soln.p
%   - MovieData.xlsx
%   - pantsOnFire_soln.p
%   - recipe1.txt
%   - recipe2.txt
%   - recipe3.txt
%   - results.mat
%   - rubric_hw1grades.xls
%   - sectorZ_Characters.xls
%   - sectorZScores.xls
%   - shoppinglistA.xls
%   - shoppinglistB.xls
%   - shoppinglistC.xls
%   - solns.mat
%   - superSmashBros_soln.p
%   - updated.mat
% 
% Files to submit:
%   - ABCs_CellArrays.m
%   - ABCs_HighLevelFileIO.m
%   - countCelery.m
%   - driveTime.m
%   - feeFiFauxPho.m
%   - hw09.m
%   - jackBlack.m
%   - pantsOnFire.m
%   - superSmashBros.m
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
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ==========================================================================
% PART 1.  ABC Problems
% --------------------------------------------------------------------------
% 
% Part of this homework are two m-files called "ABCs_CellArrays" and 
% "ABCs_HighLevelFileIO". Open these files in MATLAB and complete it 
% according to the directions contained within. 
% 
% Files to Complete: 
%       - ABCs_CellArrays.m
%       - ABCs_HighLevelFileIO.m
% 
% ABCs File Testing:
%  >> ABCs_hw09_pretest
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
% USING XLSREAD/XLSWRITE - A DISCLAIMER
% --------------------------------------------------------------------------
% 
% xlsread and xlswrite will not work on every computer.  Generally a
% Windows machine with some form of Microsoft Excel is the safest bet when
% utilizing these programs.  This means that Macs and Windows users without
% Office may run into problems with using these functions.
% 
% Many machines that cannot run xlswrite may still be able to run xlsread.
% It is for this reason that we have restricted the need for xlswrite in
% the homework.
% 
% If xlsread and/or xlswrite do not work on your computer, then find
% another computer to run your code on.  You can find such computers in the
% library, student center, help desk, and the virtual computer lab.
% 
% ==========================================================================
% PART 2. Drill Problems
% --------------------------------------------------------------------------
% 
% Included with this homework is a file titled "HW09 Drill Problems.pdf",
% and included within are instructions for 6 drill problems that cover the
% following major topic(s):
% 
% 	Cell Arrays
%   High Level File I/O
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
% Drill Problem #1: countCelery
% 
%  	cellArr1 = {'celery','celery',{{{'celery'},[]},[]},[],'celery',{'celery'}};
%    stolen1 = countCelery(cellArr1,9)
%       stolen1 => 6
%         
%    cellArr2 = {{},'celery',[],{[],'celery'},'celery','celery',[],{[],'celery'},'celery'};
%    stolen2 = countCelery(cellArr2,15)
%       stolen2 => 11
% 
%    cellArr3 = {{{'celery',{{{'celery'}}},'celery'},'celery'},'celery',[],'celery',{'celery'}};
%    stolen3 = countCelery(cellArr3,7)
%       stolen3 => 5
% 
% --------------------------------------------------------------------------
% Drill Problem #2: pantsOnFire
% 
% 	out1 = pantsOnFire({'pants','scarf','heels','penny loafers'; true,...
%            false,true,true; true,true,false,true})
%       out1 => ['You should wear the pants and/or penny loafers, but'...
%           ' DO NOT wear the scarf or heels.']
% 
%    out2 = pantsOnFire({'hoodie','colorful socks','middle school belt',...
%              'Batman watch'; true,false,true,false; true,true,false,true})
%       out2 => ['You should wear the hoodie, but DO NOT wear the'...
%           ' colorful socks, middle school belt or Batman watch.']
% 
%    out3 = pantsOnFire({'dress','cutoffs','wedges','flip flops'; ...
%            true,true,true,false; true,true,false,false})
%       out3 => ['You should wear the dress and/or cutoffs, but DO NOT'...
%           ' wear the wedges or flip flops.']
% 
% --------------------------------------------------------------------------
% Drill Problem #3: driveTime
% 
%    load('solns.mat');
%  	out1 = driveTime('data1.xlsx')
%       out1 => should be identical to soln1
% 
%    out2 = driveTime('data2.xlsx')
%       out2 => should be identical to soln2
% 
%    out3 = driveTime('data3.xlsx')
%       out3 => should be identical to soln3
% 
%    out4 = driveTime('data4.xlsx')
%       out4 => should be identical to soln4
% 
% --------------------------------------------------------------------------
% Drill Problem #4: jackBlack
% 
%    M1 = {'Kung Fu Panda', 'School of Rock', 'Enemy of the State'};
%    R1 = {[5, 8, 3, 2], [10, 10, 9, 0], [7, 3, 6, 4]};
%    text1s = jackBlack_soln(M1, R1, 'MovieData.xlsx')
%       text1 => 'We''re going to see Enemy of the State at 13:35. See you then :)'
%      
%    M2 = {'School of Rock', 'Ice Age', 'Gulliver''s Travels', 'Kung Fu Panda'};
%    R2 = {[7.1, 4, 92], [7.6, 3, 77, 12], [4.9, 3, 20], [44, 52]};
%    text2s = jackBlack_soln(M2, R2, 'MovieData.xlsx')
%       text2 => 'We''re going to see Ice Age at 14:00. See you then :)'
% 
%    M3 = {'Nacho Libre', 'Tropic Thunder', 'King Kong', 'Year One', 'Ice Age'};
%    R3 = {[5.7, 40, 12, 3], [7, 83], [7.3, 84, 4], [82], [8.8, 4.4, 9]};
%    text3s = jackBlack_soln(M3, R3, 'MovieData.xlsx')
%       text3 => 'We''re going to see King Kong at 15:30. See you then :)'
% 
% --------------------------------------------------------------------------
% Drill Problem #5: feeFiFauxPho
% 
%   load('updated.mat')
%  	[valid1, updated1] = feeFiFauxPho('recipe1.txt','shoppinglistA.xlsx')
%       valid1 => true
%       updated1 => should be equal to updated1_soln
% 
%    [valid2, updated2] = feeFiFauxPho('recipe2.txt','shoppinglistB.xlsx')
%       valid2 => true
%       updated2 => should be equal to updated2_soln
% 
%    [valid3, updated3] = feeFiFauxPho('recipe3.txt','shoppinglistC.xlsx')
%       valid3 => false
%       updated3 => should be equal to updated3_soln
% 
% --------------------------------------------------------------------------
% Drill Problem #6: superSmashBros
% 
%    load('results.mat')
%    [best1s, results1] = superSmashBros('battlefield_Characters.xls', 'battlefield_Scores.xls')
%       best1 => 'Alexis won the most games and is the best player!'
%       results1 => should be equal to results1_soln
%      
%    [best2s, results2] = superSmashBros('hyruleCastle_Characters.xls', 'hyruleCastle_Scores.xls')
%       best2 => 'Michael won the most games, but Kyle is the best player!'
%       results2 => should be equal to results2_soln
% 
%    [best3s, results3] = superSmashBros('sectorZ_Characters.xls', 'sectorZ_Scores.xls')
%       best3 => 'Mario won the most games, but Ness is the best player!'
%       results3 => should be equal to results3_soln
% 
% ==========================================================================
% Click of the Week!!
% --------------------------------------------------------------------------
% 
%   https://www.youtube.com/watch?v=EQ1HKCYJM5U
% 
% ==========================================================================
% FINISHED!!!
% --------------------------------------------------------------------------
% 
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
