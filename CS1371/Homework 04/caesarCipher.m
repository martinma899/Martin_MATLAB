
function [string] = caesarCipher (encoded , encodingIndex)

    % The function takes a string and only changes upper and lower case letters in the fashion of caesar cipher.

    % Extract and change the upper and lower case letters in two new
    % strings.
    lowerCase = cslo(encoded(encoded>96&encoded<123),encodingIndex);
    upperCase = cshi(encoded(encoded>64&encoded<91),encodingIndex);
    
    % Find the index vector of the extracted lower case and upper case
    % letters in the original string.
    [~,lowerIndex] = find(encoded>96&encoded<123);
    [~,upperIndex] = find(encoded>64&encoded<91);
    
    % Using the index vector and the caesar ciphered strings to change the
    % letters in the original string.
    string = encoded;
    string(lowerIndex) = lowerCase;
    string(upperIndex) = upperCase;

end

function [original] = cslo (encoded , encodingIndex)

    % This function is created to caesar cipher a string with only lower
    % case letters.

    % Turn the string of letters into their encoding index.
    vec = uint16(encoded);

    % Use mod function twice to function as a fully functional Caesar
    % cipher.
    vec = mod(vec-97+mod(encodingIndex,26),26)+97;
    
    % Convert the encoded indexes back to corresponding characters.
    original = char(vec);

end

function [original] = cshi (encoded , encodingIndex)

    % This function is created to caesar cipher a string with only upper
    % case letters.

    % Turn the string of letters into their encoding index.
    vec = uint16(encoded);

    % Use mod function twice to function as a fully functional Caesar
    % cipher.
    vec = mod(vec-65+mod(encodingIndex,26),26)+65;
    
    % Convert the encoded indexes back to corresponding characters.
    original = char(vec);

end

%{
Function Name: caesarCipher

Inputs: 1. (char) A string of unknown length 2. (double) An integer
describing the shift

Outputs: 1. (char) A coded string using the Caesar cipher Function

Description: Last week you wrote the function caesarSalad() to apply a
Caesar shift to lowercase letters and encode a word. Now, we will extend
that cipher to entire phrases!  Using the base code from last week as a
skeleton for one (or two) helper function(s), write a function in MATLAB
named caesarCipher().  This function will take in a string with upper and
lower case letters, as well as punctuation, and then apply the Caesar shift
to the string, using the helper function(s) you have created to encode it.
Only letters (both upper and lower case) should be encoded using the Caesar
cipher.  Any other characters, such as spaces, periods, etc., should not be
altered.

Notes: ? The cipher should work for both positive and negative integers
that indicate the shift as given by the second input. ? There is no limit
to the value of the shift number in the second input. ? You MUST use a
helper function to solve this problem. ? You may write your helper
function(s) below your caesarCipher() function, or you may write it/them to
separate files.  If you write it/them to a separate file(s), you MUST
include it/them in your overall file submission. 

Hints: ? The mod()
function, and its effect on both positive and negative numbers, may be
useful. ? Consider editing caesarSalad() to have one helper function for
capital letters and one for lowercase letters.
%}

% Thank you Sean and Rachael for grading our work!!

%-- 9/8/2015 11:09 AM --%