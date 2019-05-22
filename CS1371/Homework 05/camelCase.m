function [out] = camelCase (in)

    % This function makes camel cases from a sentence or stuff. Very useful. I am gonna use this a lot.

    % Make everything ascii values
    in = uint16(in);
    
    % Find the index vector of spaces
    spaceindex = in==32;
    
    % Shift the space index vector down by one to obtain index of letters
    % that need to be turned into capital letters
    camelcaseones = [false spaceindex(1:end-1)];
    
    % Make everything lower case
    in(iscapitaln(in)) = in(iscapitaln(in))+32;
    
    % Make the ones that should be camelcased camelcase
    in(camelcaseones) = in(camelcaseones)-32;
    
    % Only remove vowls that are not camel cased letters
    vowelsToRemove = isvoweln(in)&(~camelcaseones);
    
    % And also if the first letter is vowl, change the mask vector and make
    % sure not to remove that one. 
    if vowelsToRemove(1)
        vowelsToRemove(1) = false;
    end
    
    % Use the vowelsToRemove masking vector to remove vowels.
    in(vowelsToRemove) = [];
    
    % Remove anything that isn't a letter.
    in(~islettern(in)) = [];
    
    % Output the result.
    out = char(in);
    
end

function [bool] = iscapitaln (in)

    % This function returns a logical vector or array that checks for capital letters.

    bool = in>=65&in<=90;

end

function [bool] = islowern (in)
  
    % This function returns a logical vector or array that checks for lower case letters.

    bool = in>=97&in<=122;

end

function [bool] = islettern (in)

    % This function returns a logical vector or array that checks for any letters.

    bool = iscapitaln(in)|islowern(in);

end

function [bool] = isvoweln (in)

    % This function returns a logical vector or array that checks for vowel letters.

    bool = (in==97|in==101|in==105|in==111|in==117|in==65|in==69|in==73|in==79|in==85);

end

%{
Function Name: camelCase

Inputs: 1. (char) A string of some phrase to be converted to camel case

Outputs: 1. (char) The phrase converted to camel case Function

Description: In this day and age of fancy technology and radical lingo, you
decide that you’re going to text and email phrases in camel case to be as
efficient as possible. Who needs spaces and vowels anyways?

Write a MATLAB function called camelCase that will take a phrase of
characters and convert it to camel case. The algorithm to convert a string
to camel case for this problem is as follows:

1. Capitalize the first letter of every individual word, except for the
very first letter of the phrase. Lowercase every other letter. 2. Remove
all spaces and extraneous special characters from the phrase. 3. Remove all
vowels from the phrase, excluding those that are the first letter of a
word.

For example, for the input: ‘MATLAB is awesome’ The output would appear as:
‘mtlbIsAwsm’ While the input ‘I love MATLAB’ Would output the string:
‘iLvMtlb’

Notes: ? This problem must be completed using logical indexing. ? The
letter ‘y’ should not be considered a vowel for this function.

Hints: ? The order in which you manipulate the input phrase will need to be
taken into consideration.
%}

% Thank you Sean and Rachael for grading our work! This question almost
% drove me crazy. I was trying to get it done fast but well, you gotta
% think throught carefully.

%-- 9/18/2015 11:33 AM --%