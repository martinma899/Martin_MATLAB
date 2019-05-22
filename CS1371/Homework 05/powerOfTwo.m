function [boo] = powerOfTwo (input)

    % This function checks whether a number is a power of two or not.

    % Turn the number into binary then turn into a string.
    str = num2str(dec2bin(input));
    
    % Find the index of '1's.
    mask = str=='1';
    
    % If there's only one '1', then it must be a power of two.
    boo = sum(mask)==1;
    
end

%{
Function Name: powerOfTwo

Inputs: 1. (double) A positive whole number

Outputs: 1. (logical) A logical value specifying if the input is a power of
two

Function Description: For all our computations, we have been using the
base-10 decimal number system. However, computers (and MATLAB!) store
numbers using the base-2 system, called binary. A binary number consists of
multiple bits of either 0 or 1. Each bit n represents the decimal value 2n,
and a binary number can be converted to decimal by adding all the powers of
two corresponding to each bit that is a 1.

Examples omitted -- we are smart. We know what binary is.
                
Using logical indexing, write a MATLAB function that calculates if a
decimal number is a power of two. Return a logical (true or false) value
specifying whether or not the decimal number is a power of two.

Notes: ? Since it has not been taught in class, you should not use
iteration to solve this problem. ? You may not use the log(), log2(), or
dec2binvec() functions. ? You will only be provided positive whole numbers.
There are no negative powers of two!

Hints: ? The dec2bin() function will be useful. Pay attention to the
output! 128
%}

% Thank you Sean and Rachael for grading our work!

%-- 9/18/2015 11:33 AM --%