%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Zhuo Ma
% T-square ID  : zma70
% GT Email     : zma70@gatech.edu
% Homework     : hw14/original
% Course       : CS1371
% Section      : C03
% Collaboration:  "I worked on the homework assignment alone, using
%                  only course materials."
% 
% Some other things I wanna say upon the end of the course: 
% "Thanks everybody. It's hard to believe that I will actually miss CS 1371
% this much. Once I thought this would be an endless thing. But it does
% end. After 14 homeworks. Wow. This is just too fast.
%
% I learned so much in this class. So much that I couldn't have imagined. I
% enjoyed most of it, hated some of it. It did challenge me. Also,
% apologize for skipping so many recitations. I still do love you guys Sean
% and Rachael, even though I got too busy to write that in every drill
% question I submit. 
%
% MATLAB is just wonderful. Now I officially abandoned TI 89 titanium
% because of MATLAB. I do my physics and calc homework with it. I process
% physics lab data with it. I process maillists with it. I hack equations
% and solve them numerically. It's just, thank you. Thank you CS 1371. Now
% I can hack anything excel or text file related effortlessly. Thanks
% everyone. Thank you for teaching me MATLAB.
%
% If I'm lucky enough maybe I'll become a TA next semester and help others
% on this wonderful journey. I never knew why I wanted to apply for CS
% 1371 TA so bad. Now I do. It's been amazing learning MATLAB. It's been
% amazing."
%
% Files provided with this homework:  
%	- CS 1371 Fall 2015 HW 14 Animation Project RUBRIC.pdf
%   - flyPropellerHat.m
%   - flyPropellerHat_sample.p
%   - HW14 Animation Project.pdf
%   - hw14.m
%   - makeBill_soln.p
%   - makeCap_soln.p
%   - makePropeller_soln.p
%   - rotate.mat
%   - rotateObject_soln.p
%   
% Files to submit:
%   - flyPropellerHat.m
%   - hw14.m
%   - makeCap.m *
%   - makeBill.m *
%   - makePropeller.m *
%   - rotateObject.m *
%   - any other functions used in flyPropellerHat.m *
%
%   * = optional unless used in flyPropellerHat.m, or for backup partial credit
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
% Drill Problem #1: makeCap
% 
%   [xxCap1, yyCap1, zzCap1] = makeCap(3, [1 0])
%       => surf(xxCap1, yyCap1, zzCap1) should look identical to 
%        figure(2)
%        surf(xxCap1_soln, yyCap1_soln, zzCap1_soln) 
%            when 
%            [xxCap1_soln, yyCap1_soln, zzCap1_soln] = makeCap_soln(3, [1 0])
%           is
%           run.
% 
%   [xxCap2, yyCap2, zzCap2] = makeCap(2, [-1 0 2])
%       => surf(xxCap2, yyCap2, zzCap2) should look identical to 
%           surf(xxCap2_soln, yyCap2_soln, zzCap2_soln) when 
%           [xxCap2_soln, yyCap2_soln, zzCap2_soln] = makeCap_soln(2, [-1 0 2]) 
%           is run.
%   
%   [xxCap3, yyCap3, zzCap3] = makeCap(7, [4 2 0 1 0 2])
%       => surf(xxCap3, yyCap3, zzCap3) should look identical to 
%           surf(xxCap3_soln, yyCap3_soln, zzCap3_soln) when 
%           [xxCap3_soln, yyCap3_soln, zzCap3_soln] = makeCap_soln(7, [4 2 0 1 0 2]) 
%           is run.
%
%--------------------------------------------------------------------------
% Drill Problem #2: makeBill
% 
 %  [xxBill1, yyBill1, zzBill1] = makeBill(4, 3)
 %  figure(2)
 %  [xxBill1_soln, yyBill1_soln, zzBill1_soln] = makeBill_soln(4, 3)
%      surf(xxBill1, yyBill1, zzBill1) should look identical to 
 %            surf(xxBill1_soln, yyBill1_soln, zzBill1_soln) 
% when 
%           [xxBill1_soln, yyBill1_soln, zzBill1_soln] = makeBill_soln(4, 3) 
%           is run.
% 
%   [xxBill2, yyBill2, zzBill2] = makeBill(12, -2)
%       => surf(xxBill2, yyBill2, zzBill2) should look identical to 
%           surf(xxBill2_soln, yyBill2_soln, zzBill2_soln) when 
%           [xxBill2_soln, yyBill2_soln, zzBill2_soln] = makeBill_soln(12, -2) 
%           is run.
%   
%   [xxBill3, yyBill3, zzBill3] = makeBill(20, 4)
%       => surf(xxBill3, yyBill3, zzBill3) should look identical to 
%           surf(xxBill3_soln, yyBill3_soln, zzBill3_soln) when 
%           [xxBill3_soln, yyBill3_soln, zzBill3_soln] = makeBill_soln(20, 4) 
%           is run.
%
%--------------------------------------------------------------------------
% Drill Problem #3: makePropeller
% 
   [xxProp1, yyProp1, zzProp1] = makePropeller(-5, 5, 1);
%       => 
%surf(xxProp1, yyProp1, zzProp1) 
%should look identical to 
%           surf(xxProp1_soln, yyProp1_soln, zzProp1_soln) 
% when 
%            [xxProp1_soln, yyProp1_soln, zzProp1_soln] = makePropeller_soln(0, 4*pi, 1) 
%           is run.
% 
%   [xxProp2, yyProp2, zzProp2] = makePropeller(-pi, pi, 2)
%       => surf(xxProp2, yyProp2, zzProp2) should look identical to 
%           surf(xxProp2_soln, yyProp2_soln, zzProp2_soln) 
% when 
%            [xxProp2_soln, yyProp2_soln, zzProp2_soln] = makePropeller_soln(-pi, pi, 2) 
%           is run.
%   
%   [xxProp3, yyProp3, zzProp3] = makePropeller(-3*pi, 0, 1.5)
%       => surf(xxProp3, yyPro3, zzProp3) should look identical to 
%           surf(xxProp3_soln, yyProp3_soln, zzProp3_soln) when 
%           [xxProp3_soln, yyProp3_soln, zzProp3_soln] = makePropeller_soln(-3*pi, 0, 1.5) 
%           is run.
%
%--------------------------------------------------------------------------
% Drill Problem #4: rotateObject
% 
%   load('rotate.mat')
%   [newxx1, newyy1, newzz1] = rotateObject(xx1,yy1,zz1,'z',pi/8)
%       => Output should be identical to the solution code
% 
%   [newxx2, newyy2, newzz2] = rotateObject(xx2,yy2,zz2,'x',pi/2)
%       => Output should be identical to the solution code
%   
%   [newxx3, newyy3, newzz3] = rotateObject(xx3,yy3,zz3,'y',pi/4)
%       => Output should be identical to the solution code
%
%   *Please note: for all these problems, you can use isequal() with your
%   output and the solution code output as well.
%   
%--------------------------------------------------------------------------
% Drill Problem #5: flyPropellerHat
% 
%   There are no test cases for this, just make sure you fulfill all the
%   requirements as given in the problem statement.
%
%==========================================================================
% Click of the Week!!
%--------------------------------------------------------------------------
%
%   https://www.youtube.com/watch?v=j3YrNSw5a2I
%
%==========================================================================
% Fly High!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.
