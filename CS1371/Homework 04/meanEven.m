function [out] = meanEven (in)

    % This function finds the average of all the even numbers in a vector.

    % Find all the even numbers in a vector, 
    out = mean(in(mod(in,2)==0));

end

%{

Function Name: meanEven

Inputs: 1. (double) A vector of random, integer numbers

Outputs: 1. (double) The average of the specified type of numbers

Function Description: In this problem, you are given a vector of random
numbers. Using logical indexing, isolate only the even numbers from the
vector, and then output their average.

Notes: ? For the sake of this function, treat zero as an even number.

Hints: ? The mod() function will prove useful in this function.

%}