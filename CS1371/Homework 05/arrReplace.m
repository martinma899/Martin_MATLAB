function [outarr] = arrReplace (inarr1,inarr2,num)

    % This function takes two arrays and a number and does some replacing stuff.

    % Create a mask logical array that identifies the desired locations to
    % replace.
    mask = inarr1 == num;
    
    % Give the inarr1 value to the output, get ready to replace.
    outarr = inarr1;
    
    % Use the mask to replace numbers in the output array.
    outarr(mask) = inarr2(mask);

end

%{

Function Name: arrReplace

Inputs: 1. (double) An MxN array 2. (double) Another MxN array 3. (double)
A number

Outputs: 1. (double) The original MxN array with replacements made

Function Description:  Write a function called arrReplace() that inputs two
arrays and a number. The function will replace all instances of that number
in the first array with the values in the corresponding positions of the
second array.  If the number does not exist in the array, it should just
return the original array with no changes.

Notes: ? The two input arrays are guaranteed to have the same dimensions.
Hints: - When using logical operators with an array, it returns an array of
logicals.  This is called a mask. Think how this may be useful in solving
this problem.

%}

% Thank you Sean and Rachael for grading our work!

%-- 9/18/2015 11:10 AM --%