%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : <your name>
% T-square ID  : <your t-square ID. Example: gburdell3>
% GT Email     : <your GT email address>
% Homework     : <homework assignment number/original or resubmission>
% Course       : CS1371
% Section      : <Your Section>
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
%   - ABCs_hw08_pretest.p
%   - abcs_lights.txt
%   - ABCs_LowLevelFileIO.m
%   - australianSecretAgent_soln.p
%   - bill.txt
%   - Blank_Order.txt
%   - Blank_Order_receipt_soln.txt
%   - cipher_1.txt
%   - cipher_2.txt
%   - cipher_3.txt
%   - cipher_4.txt
%   - daryl.txt
%   - detention_soln.p
%   - Extra_Order.txt
%   - Extra_Order_receipt_soln.txt
%   - handCramps1.txt
%   - handCramps2.txt
%   - handCramps3.txt
%   - How to Compare Text Files.pdf
%   - HW08 Drill Problems.pdf
%   - hw08.m
%   - hwGrader_soln.p
%   - krustyKrab_soln.p
%   - lyrics_1.txt
%   - lyrics_2.txt
%   - lyrics_3.txt
%   - lyrics_4.txt
%   - Order1.txt
%   - Order1_receipt_soln.txt
%   - ottendorf_soln.p
%   - phillip.txt
%   - poem1.txt
%   - poem2.txt
%   - poem3.txt
%   - poem4.txt
%   - quote_1.txt
%   - quote_2.txt
%   - rhymeTaragon_soln.p
%   - Special_Order.txt
%   - Special_Order_receipt_soln.txt
%   - test1a.txt
%   - test1b.txt
%   - test2a.txt
%   - test2b.txt
%   - test3a.txt
%   - test3b.txt
%
% Files to submit:
%   - ABCs_LowLevelFileIO.m
%   - australianSecretAgent.m
%   - detention.m
%   - hw08.m
%   - hwGrader.m
%   - krustyKrab.m
%   - ottendorf.m
%   - rhymeTaragon.m (Optional: Only if you choose to do this problem for
%   extra credit.  If you use rhymeThyme.m as a separate file, you will
%   want to include this as well)
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
% Part of this homework is an m-file called "ABCs_LowLevelFileIO". Open 
% these files in MATLAB and complete it according to the directions 
% contained within. 
%
% Files to Complete: 
%       - ABCs_LowLevelFileIO.m
%
% ABCs File Testing:
%  >> ABCs_hw08_pretest.p
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
% Included with this homework is a file entitled "HW08 Drill Problems.pdf",
% and included within are instructions for 5 drill problems that cover the
% following major topic(s):
%
%	Low Level File I/O
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
% Drill Problem #1: detention
%
%   result1 = detention('handCramps1.txt', ['I will never ever EVER' ...
%           ' skip class again.'])
%       result1 => 'Good job. You are free to go!'
%      
%   result2 = detention('handCramps2.txt', ['I will never curse at' ...
%           ' Matlab again while I''m at Georgia Tech.'])
%       result2 => 'Not so fast. Start all over!'
%
%   result3 = detention('handCramps3.txt', ['I will do my CS1371' ...
%           ' homework early and never waste time watching Netflix.'])
%       result3 => 'Not so fast. Start all over!'
%
%--------------------------------------------------------------------------
% Drill Problem #2: hwGrader
%
%   score1 = hwGrader('test1a.txt','test1b.txt')
%       score1 => 100
%
%   score2 = hwGrader('test2a.txt','test2b.txt')
%       score2 => 75
%
%   score3 = hwGrader('test3a.txt','test3b.txt')
%       score3 => 0
%
%--------------------------------------------------------------------------
% Drill Problem #3: krustyKrab
%
%   [total1] = krustyKrab('Order1.txt')
%       total1 => 5.6900
%       output file: 'Order1_receipt.txt'
%           should be identical to 'Order1_receipt_soln.txt'
%
%   [total2] = krustyKrab('Extra_Order.txt')
%       total2 => 10.6300
%       output file: 'Extra_Order.txt'
%           should be identical to 'Extra_receipt_soln.txt'
%
%   [total3] = krustyKrab('Special_Order.txt')
%       total3 => 18.9200
%       output file: 'Special_Order.txt'
%           should be identical to 'Special_receipt_soln.txt'
%
%   [total4] = krustyKrab('Blank_Order.txt')
%       total4 => 0
%       output file: 'Blank_Order.txt'
%           should be identical to 'Blank_receipt_soln.txt'
%
%   Please note: If you run the solution file, it will create a new file
%   named exactly as the function is supposed to name the file (without the
%   '_soln' appended to the end of the file name).  You can re-create an
%   _soln text file by running the solution file and renaming it.  Further,
%   should you run the solution file, you should rename it so you are not
%   confusing its output with the output your function is creating.
%
%--------------------------------------------------------------------------
% Drill Problem #4: australianSecretAgent
%
%	agent1 = australianSecretAgent('bill.txt')
%       agent1 = 'Bill'
%
%	agent2 = australianSecretAgent('phillip.txt')
%       agent2 = 'Phillip'
%
%	agent3 = australianSecretAgent('daryl.txt')
%       agent3 = 'Daryl'
%--------------------------------------------------------------------------
% Drill Problem #5: ottendorf
%
%   [out1] = ottendorf('lyrics','cipher_1.txt')
%           out1 => 'Meet under the bridge at midnight. Come alone.'
%
%   [out2] = ottendorf('quote','cipher_2.txt')
%           out2 => 'password: Bnt2nz'
%
%   [out3] = ottendorf('lyrics','cipher_3.txt')
%           out3 => 'Hey, Listen!'
%
%--------------------------------------------------------------------------
% Drill Problem *EXTRA CREDIT*: rhymeTaragon
%
% 	out1 = rhymeTarragon('poem1.txt')
%       out1 => 'The file does not contain a poem.'
%
%   out2 = rhymeTarragon('poem2.txt')
%       out2 => 'The file contains an Enclosed Rhyme with an ''ABBA'' rhyme scheme.'
%
%   out3 = rhymeTarragon('poem3.txt')
%       out3 => 'The file contains a Limerick with an ''AABBA'' rhyme scheme.'
%
%   out4 = rhymeTarragon('poem4.txt')
%       out4 => 'The file contains an Alternating Rhyme with an ''ABABCDCDEFEF'' rhyme scheme.'
%
%
%==========================================================================
% Click of the Week!!
%--------------------------------------------------------------------------
%
%   https://www.youtube.com/watch?v=X2WH8mHJnhM
%
%==========================================================================
% FINISHED!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
