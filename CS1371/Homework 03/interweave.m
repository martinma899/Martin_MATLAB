function [weaved] = interweave (vec1,vec2)

    % This function interweaves two row vectors.
    
    % Create an empty vector with length twice of the longest vector.
    bunchOfZero = zeros(1,2*max(length(vec1),length(vec2)));

    % Put the values of the first vector into the empty vector, starting
    % from the first element with increment of 2.
    bunchOfZero(1:2:length(vec1)*2-1) = vec1;
    
    % Put the values of the second vector into the half filled vector,
    % starting from the second element with increment of 2.
    bunchOfZero(2:2:length(vec2)*2) = vec2;
    
    % Give the empty vector that's now filled to the final ouput.
    weaved = bunchOfZero;
    
end

%{

Function Name: interweave

Inputs: 1. (double) A 1xN vector of numbers. 2. (double) A 1xM vector of
numbers.

Outputs: 1. (double) A vector of the two input vectors mixed together.

Function Description: Write a function called interweave that takes in two
vectors and then outputs a larger vector where the odd elements contain the
values from the first vector, and the even elements contain the values from
the second vector. If one vector is longer than the other, then the odd or
even indices that wouldn’t otherwise have values should be filled with
zeros.

For example, given the following two vectors for inputs:

[1  3  5] [2  4  6  8  10] [1 2  3  4  5 6  0  8  0  10]

The above vector would result from interweaving. Note the two zeros at the
end of the vector, since the first vector was not as long as the second
vector. 

Hints: ? The length of the output vector should be twice the length
of the longest input vector. ? The max() and zeros() functions may be
useful.
 
%}

% Thank you Sean and Rachael for grading our work!

%-- 9/3/2015 12:30 PM --%