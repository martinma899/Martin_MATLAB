function [average,logical] = deflateGate (arr1,arr2,arr3,arr4)

    % This function completes the homework deflateGate. Real situations might apply here.

    % Find the logical mask such that any position was consecutively the
    % same value.
    logical = (arr1==arr2)|(arr2==arr3)|(arr3==arr4);
    
    % Average the four to produce the average output.
    average = (arr1+arr2+arr3+arr4)/4;
    
    % Make any suspicious value zero in the average output.
    average(logical) = 0;
    
end

%{
Function Name: deflateGate

Inputs: 1. (double) An MxN array representing the first quarter 2. (double)
An MxN array representing the second quarter 3. (double) An MxN array
representing the third quarter 4. (double) An MxN array representing the
fourth quarter

Outputs: 1. (double) An MxN array of the average pressure values 2.
(logical) An MxN array indicating the games with broken pressure gauges


Function Description: Due to recent predicaments in the National Football
League (NFL), the NFL has decided to record the pressure of their footballs
after every quarter in a game. Now that the preseason is over and the real
season is about to begin, they have “recruited” you to write a MATLAB
function to take the pressures recorded at the end of each quarter and find
the average pressure of each football in every game.  The pressure in a
football will change slightly over the course of a game due to various
weather conditions, usage, and other nefarious activities. Footballs that
read the same pressure between any two consecutive quarters have fallen
victim to suspicious activities, and we need you to identify them in your
final analysis.

You are given four input MxN arrays, representing one of the four quarters
in a football game. Each array will contain all of the pressure readings in
a specific quarter of the footballs for the different games. Your job is to
average all four values of each position in the arrays and output this
averaged array for the first output. Any values that remain the same in a
given index between two consecutively quartered arrays should not have an
average displayed, since that means nefarious activity has occurred and the
pressure gauge is broken; instead the final average array should have a
zero at each of those indices. You should also output a second array, this
one of class 'logical', which has a true at each index where the broken
pressure gauges are being used in the football game.

Notes: ? The four input arrays are guaranteed to have the same dimensions.
? Included in the test cases are ‘.mat’ files.  Typing
load(‘<file_name>.mat’) into the Command Window, or double-clicking the
‘.mat’ file in the Current Directory, will load any variables saved in the
file to the Workspace. ? Do NOT load any of the '.mat' files inside your
function.
%}

% Thank you Sean and Rachael for grading our work!

% I'm not feeling very well so my function descriptions my be a bit too
% crancky... excuse me. Thank you.

%-- 9/18/2015 11:33 AM --%