
function [bool] = rhymeThyme (string)

    % This function checks whether two sentences rhyme in a very strict manner.

    % Separate the string into two parts with just words, no periods.
    [front,back] = strtok(string,'.');
    back = back(3:end-1);
 
    % Count the spaces in both parts to determine whether the two parts
    % have the same number of words.
    spacesf = length(front(front == ' '));
    spacesb = length(back(back == ' '));
    boolwords = (spacesf == spacesb);
 
    % Take the last three characters of both strings and compare them.
    end3f = front(end-2:end);
    end3b = back(end-2:end);
    boolend3 = strcmp(end3f,end3b);
 
    % Only strings that satisfy both requirements can be counted as rhyme.
    bool = boolwords & boolend3;

end

%{

Function Name: rhymeThyme

Inputs: 1. (char) A string containing two sentences separated by a single
period

Outputs: 1. (logical) A logical (true or false) value specifying if the
lines provided rhyme

Function Description: Now that you’ve finished the first few weeks here at
Georgia Tech, you are missing your appreciation for liberal arts and all
its wonders! Shall I compare thee to a summer’s day? Sure, Shakespeare, why
not! And “where for” art thou Romeo? He sits behind you in Physics, duh!
Write a MATLAB function rhymeThyme to help you evaluate some lines of
poetry, based on your knowledge of strings and logicals. For this problem,
two sentences are said to rhyme if the following two conditions are met:

1. The last 3 characters of each sentence are identical (not including the
final period). 2. Each sentence has the exact same number of words.

Write a function that checks a single string input containing two sentences
for these two conditions; the function should return a logical true if both
conditions are both met and a logical false if they are not.

For example, if the input string were the following:

str = ‘I can rhyme. All the thyme.'

Then the output would be true because the last three characters of each
sentence are the same (‘yme’) and both sentences have 3 words in them.

Notes: ? The input string will contain two sentences which are always
separated by a single period in between. ? Each sentence in the single
string is guaranteed to have at least 3 characters in it. ? The different
words in the input string are guaranteed to be separated by a single space.
You can ignore all extraneous punctuation when considering the number of
words in each sentence. ? You should not actually use this function for
practical applications to check if words rhyme. If you use this to check
your poetry for a literature assignment, it may let you down.

%}

% Thank you Sean and Rachael for grading our work!!

%-- 9/8/2015 11:57 AM --%