
function [resized] = vecResize (vec,factor)

    % This function resizes vectors using linspace and round functions.

    % This is a little bit hard to explain because it's only one line:
    % Okay, let's go. So first you use linspace to create an evenly spaced
    % vector from 1 to the floored product of the length of original vector
    % times the conversion factor. This linspace vector will have like a
    % bunch of decimal placed numbers between one and another whole number.
    % Then you round this entire linspace vector to integer. This is the
    % index vector you use on the original vector to make the new resized
    % vector.
    
    resized = vec(round(linspace(1,length(vec),floor(length(vec)*factor))));

end

%{

Function Name: vecResize

Inputs: 1. (double) A vector of length N 2. (double) A scalar value by
which the vector should be stretched or compressed

Outputs: 1. (double) The new stretched/compressed vector Function

Description:  Write a function in MATLAB called vecResize() that inputs a
vector with at least one element and a value by which the vector should be
stretched or compressed.  This function will output a new vector that has
been resized based on the scaling factor given in the second input.  If the
scaling factor is greater than 1, then the vector should be stretched by
adding duplicate elements.  If the value is less than 1, then the vector
should be compressed by removing elements.  If the value is exactly 1, then
no change should be made to the vector.

For example, if the following values were input:

vec = [0, 1, 1, 2, 3, 5, 8, 13]  scalingFactor = 2

then the resulting vector would be stretched by a factor of two by adding
duplicate elements:

newVec => [0, 0, 1, 1, 1, 1, 2, 2, 3, 3, 5, 5, 8, 8, 13, 13]

However, if scalingFactor = 1/2, then the vector would be compressed by a
factor of two by removing elements from the vector:

newVec => [0, 1, 5, 13]

Your function should be able to account for any positive, non-zero scaling
factor.

Notes: ? The input vector is guaranteed to contain at least one element. ?
The linspace() function, in conjunction with the round() function and
numerical indexing, are useful in solving this problem.

%}

% Thank you Sean and Rachael for grading our work!!

%-- 9/8/2015 11:33 AM --%