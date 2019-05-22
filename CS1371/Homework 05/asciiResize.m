function [resized] = asciiResize (mat,factor)

    % This function resizes a matrix and can be used to resize ascii art. Very useful.
    
    % Using a very complicated way to get the size of the ascii art.
    sizy = size(mat);
    rows = sizy(1);
    columns = sizy(2);
    
    % Use the round (not floor) function to find the final output array
    % size. Different from vecresize answer!!! I don't know why though.
    % Give this is true, notes are misleading. You can't use vecresize
    % unless yu modify the rounding in it.
    resizedrows = round(rows*factor);
    resizedcolumns = round(columns*factor);

    % Use the same concept as vecresize to find the index numbers from the
    % original array with which we create the new array.
    rowsindexvec = round(linspace(1,rows,resizedrows));
    columnsindexvec = round(linspace(1,columns,resizedcolumns));
    
    % Use the found index vectors to make the new array.
    resized = mat(rowsindexvec,columnsindexvec);
    
end

%{
Function Name: asciiResize

Inputs: 1. (char) An M x N array of characters 2. (double) A positive value
greater than or equal to 1 specifying the scale factor

Outputs: 1. (char) The resized character array of the input

Function Description:  All nerds unite! ASCII art has evolved throughout
the past few decades from a simple peace sign, like this: to Air Jordan,
like this:

% Forgive me I can't copy and paste this thing...

Write a MATLAB function called asciiResize() that takes in an MxN array of
such ASCII art, and resizes it by the given scale factor. So if the input
array was MxN and the scale factor was 3, the resulting array would be 3M x
3N.

Notes: ? The same scale factor is applied to the horizontal and vertical
dimensions. ? If the scale factor is not an integer, you should round the
third input of linspace() to obtain the number of new rows and columns. ?
Included in the test cases are ‘.mat’ files.  Typing
load(‘<file_name>.mat’) into the Command Window, or double-clicking the
‘.mat’ file in the Current Directory, will load any variables saved in the
file to the Workspace. ? Included ASCII art creation courtesy of the
internet.

Hints: ? Consider editing the vecResize() function (from Homework 04) and
using it as a helper function to find the needed resized indices in a given
dimension (rows versus columns).
%}

% Thank you Sean and Rachael for grading our work!

%-- 9/18/2015 11:10 AM --%