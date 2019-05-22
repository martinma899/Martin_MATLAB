% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : hw10/resubmission
% Course       : CS1371
% Section      : C03
% Collaboration:  "I worked on the homework assignment alone, using
% only course materials."
%
% Files provided with this homework:
% - ABCs_hw10_pretest.p
% - ABCs_structure_arrays.m
% - ABCs_structures.m
% - disps.mat
% - frodo.xls
% - harryPotter.xls
% - HW10 Drill Problems.pdf
% - hw10.m
% - magicTheStructuring_soln.p
% - mostWanted_soln.p
% - mTS.mat
% - myStruct_soln.p
% - myStruct_variables.mat
% - peterPan.xls
% - recipe.mat
% - storeData.mat
% - struct2charrArr.p
% - structDisp_soln.p
% - thriftyHalloweener_soln.p
% - wanted.mat
% - zoesStrizzatta_soln.p
% 
% Files to submit:
% - ABCs_structure_arrays.m
% - ABCs_structures.m
% - hw10.m
% - mostWanted.m
% - myStruct.m
% - structDisp.m
% - thriftyHalloweener.m
% - zoesStrizzatta.m
% - magicTheStructuring (Optional: This problem is Extra Credit. Only
% submit if you choose to do this problem for extra credit.)
% 
% Instructions:
% 1) Follow the directions for each problem very carefully or you will
% lose points.
% 2) Make sure you name functions exactly as described in the problems or
% you will not receive credit.
% 3) Read the announcements! Any clarifications and/or updates will be
% announced on T-Square. Check the T-Square announcements at least once
% a day.
% 4) You should not use any of the following functions in any file that
% you submit to T-Square:
% a) clear
% b) clc
% c) solve
% d) input
% e) disp
% f) close all
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ==========================================================================
% PART 1.  ABC Problems
% --------------------------------------------------------------------------
% 
% Part of this homework are two m-files called "ABCs_structures" and
% "ABCs_structure_arrays". Open these files in MATLAB and complete it
% according to the directions contained within.
% 
% Files to Complete:
% - ABCs_structures.m
% - ABCs_structure_arrays.m
% 
% ABCs File Testing:
% >> ABCs_hw10_pretest
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
% numbers and dashes.  You can stop MATLAB on a particular line of code
% by clicking this dash (it will turn into a red dot).  When you run
% your code, MATLAB will stop right before executing this line and give
% you a command prompt (K>>).
% - You can also tell MATLAB to stop if it throws an error.  This option
% can be found under the menu Debug->Stop if error/warning... or by
% typing the command "dbstop if error".
% - While MATLAB is stopped, you can view your variables in the workspace
% pane and interact with them through the command line.  You can also
% view the workspace of functions that have called the current function
% by using the Stack pulldown box in the Workspace pane.
% - From here, you can step through your code one line at a time.  There
% are several step options, all of which have key combinations, can be
% found under the debug menu, and have icons (the icons look like pages
% with symbols on top of them, such as a green triangle and blue arrows)
% - Step: go to the next line of code
% - Step in: if the line of code is a function, enter the function
% to go line by line
% - Step out: if you stepped in a function, step out will take you
% back out
% - Continue/Run: Run until the next breakpoint or end of function
% - To clear all breakpoints, go to Debug->Clear all breakpoints or type
% "dbclear all".
% 
% For additional documentation, you can look up the official MATLAB
% documentation under the help menu.
% 
% ==========================================================================
% PART 2. Drill Problems
% --------------------------------------------------------------------------
% 
% Included with this homework is a file entitled "HW10 Drill Problems.pdf",
% and included within are instructions for 5 drill problems that cover the
% following major topic(s):
% 
% Structures
% Structure Arrays
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
%     --------------------------------------------------------------------------
%     Drill Problem #1: zoesStrizzatta
% 
%     load('recipe.mat')
%     new1s = zoesStrizzatta_soln(recipe1, vegSubs1)
%     new1 => The output of isequal(zoesStrizzatta(recipe1, vegSubs1), ...
%         zoesStrizzatta_soln(recipe1, vegSubs1)) should be true
% 
%     new2s = zoesStrizzatta_soln(recipe2, vegSubs2)
%     new2 => The output of isequal(zoesStrizzatta(recipe2, vegSubs2), ...
%         zoesStrizzatta_soln(recipe2, vegSubs2)) should be true
% 
%     new3s = zoesStrizzatta_soln(recipe3, vegSubs3)
%     new3 => The output of isequal(zoesStrizzatta(recipe3, vegSubs3), ...
%         zoesStrizzatta_soln(recipe3, vegSubs3)) should be true
% 
%     --------------------------------------------------------------------------
%     Drill Problem #2: myStruct
% 
%     load('myStruct_variables.mat');
%     mySt1s = myStruct_soln(cell1)
%     mySt1 => The output of isequal(myStruct(cell1), myStruct_soln(cell1))
%     should be true
% 
%     mySt2s = myStruct_soln(cell2)
%     mySt2 => The output of isequal(myStruct(cell2), myStruct_soln(cell2))
%     should be true
% 
%     mySt3s = myStruct_soln(cell3)
%     mySt3 => The output of isequal(myStruct(cell3), myStruct_soln(cell3))
%     should be true
% 
%     --------------------------------------------------------------------------
%     Drill Problem #3: structDisp
% 
%     load('disps.mat');
%     disp1 = structDisp(bestOfTAIndex)
%     disp1 => The output of isequal(structDisp(bestOfTAIndex), ...
%         structDisp_soln(bestOfTAIndex)) should be true
% 
%     disp2 = structDisp(halogens)
%     disp2 => The output of isequal(structDisp(halogens), ...
%         structDisp_soln(halogens)) should be true
% 
%     disp3 = structDisp(cars)
%     disp3 => The output of isequal(structDisp(halogens), ...
%         structDisp_soln(halogens)) should be true
% 
%     --------------------------------------------------------------------------
%     Drill Problem #4: mostWanted
% 
%     stA = struct('Name',{'Ryan Williams','Matt O''Shaughnessy', ...
%         'Adam Silverman', 'Natasha de Gunten'}, 'Location' ,{'W',...
%         'MW','NW','NW'},'Points', {10, 80, 62, 98})
%     [structA, milesA] = mostWanted(stA, 2000)
%     struct => Output should be identical to that of the solution file
%     milesA => 1850
% 
%     load('wanted.mat')
%     [structB, milesB] = mostWanted(st1, 10000)
%     struct => Output should be identical to that of the solution file
%     milesB => 5400
% 
%     [structC, milesC] = mostWanted(st1, 500)
%     struct => Output should be identical to that of the solution file
%     milesC => 500
% 
%     [structD, milesD] = mostWanted(st2, 1050)
%     struct => Output should be identical to that of the solution file
%     milesC => 1000
% 
%     --------------------------------------------------------------------------
%     Drill Problem #5: thriftyHalloweener
% 
%     load('storeData.mat')
%     [cheapStores1, tot1] = thriftyHalloweener(Stores, 'Frodo')
%     [cheapStores1s, tot1s] = thriftyHalloweener_soln(Stores, 'Frodo')
%     a = isequal(cheapStores1,cheapStores1s)
%     cheapStores1 => Output should be identical to that of the solution file
%     tot1 => 119
% 
%     [cheapStores2, tot2] = thriftyHalloweener(Stores, 'Harry Potter')
%     [cheapStores2s, tot2s] = thriftyHalloweener_soln(Stores, 'Harry Potter')
%     b = isequal(cheapStores2,cheapStores2s)
%     cheapStores2 => Output should be identical to that of the solution file
%     tot2 => 87
% 
%     [cheapStores3, tot3] = thriftyHalloweener(Stores, 'Peter Pan')
%     [cheapStores3s, tot3s] = thriftyHalloweener_soln(Stores, 'Peter Pan')
%     c = isequal(cheapStores3,cheapStores3s)
%     cheapStores3 => Output should be identical to that of the solution file
%     tot3 => 93
% 
%     --------------------------------------------------------------------------
%     Drill Problem *EXTRA CREDIT*: magicTheStructuring
% 
%     load('mTS.mat')
%     [grave1, damage1] = magicTheStructuring(game1, 'Charles')
%     [grave1s, damage1s] = magicTheStructuring_soln(game1, 'Charles')
%     a = isequal(grave1,grave1s)
%     grave1 => Output should be identical to that of the solution file
%     damage1 => 0
% 
%     [grave2, damage2] = magicTheStructuring(game2, 'Phillip')
%     [grave2s, damage2s] = magicTheStructuring_soln(game2, 'Phillip')
%     b = isequal(grave2,grave2s)
%     grave2 => Output should be identical to that of the solution file
%     damage2 => 4
% 
%     [grave3, damage3] = magicTheStructuring(game1, 'Phillip')
%     [grave3s, damage3s] = magicTheStructuring_soln(game1, 'Phillip')
%     c = isequal(grave3,grave3s)
%     grave3 => Output should be identical to that of the solution file
%     damage1 => 0
% 
%     [grave4, damage4] = magicTheStructuring(game2, 'Charles')
%     [grave4s, damage4s] = magicTheStructuring_soln(game2, 'Charles')
%     d = isequal(grave4,grave4s)
%     grave4 => Output should be identical to that of the solution file
%     damage1 => 0
% 
%     ==========================================================================
%     Click of the Week!!
%     --------------------------------------------------------------------------
% 
%     https://www.youtube.com/watch?v=AnVv0RkiG4U
% 
%     ==========================================================================
%     FINISHED!!!
%     --------------------------------------------------------------------------
% 
%     Congratulations, you've finished this homework assignment.  Before you
%     turn in your code be sure you have tested it throughly.  Once you've
%     tested it you may submit it to T-square.  Be sure all files are submitted
%     with the correct filenames.
