
function [sorted] = gradeSorter (grades,firstInitials,lastInitials)

    % This function sorts students' grades and outputs a vector with sorted grades and students' initials.

    % Sort the grade vector and find the sorted index vector.
    [sortedGrades,index] = sort(grades,'descend');
    
    % Create a blank vector that has sufficient length.
    blankVector = char(32*ones(1,3*length(grades)-1));

    % Fill the first initials into the blank vector according to the sorted
    % index vector.
    blankVector(1:3:end) = firstInitials(index);
    
    % Fill the last initials into the blank vector according to the sorted
    % index vector.
    blankVector(2:3:end) = lastInitials(index);
    
    % Give the filled vector to the final output.
    sorted = blankVector;
    
end

%{

Function Name: gradeSorter

Inputs: 1. (double) A vector of student grades. 2. (char) A string of first
initials corresponding to the grades. 3. (char) A string of last initials
corresponding to the grades.

Outputs: 1. (char) A string of first and last initials sorted by
corresponding grade.

Function Description:

You try to get on your professor’s good side by mentioning your awesome
MATLAB skills. Unfortunately, it backfires because he then ignores FERPA
and asks you to write code to sort the first and last initials of the
students in the class according to their grades.

Your professor gives you a vector of the student grades, a string of first
initials corresponding to the grades, and a string of last initials
corresponding to the grades. Given these inputs, write a function that
outputs a string with the combined first and last initials of every
student, with spaces in between, that is sorted by the students’ grades in
descending order. To clarify, an output string might look like this: ‘MS MO
ND AS’, where the student MS had the highest grade, and the student AS had
the lowest. Notice that there are spaces in between the initials of each
student but not after the last student, and note that there is no
punctuation in the string.

Notes: ? The sort() function will take care of sorting equivalent grades. ?
You will not have a tie in the grades. ? The ASCII value of a space is 32.
Any other values that appear as a space will be marked as incorrect and
result in zero credit.

Hints: ? The second output of sort() will be useful.

%}

% Thank you Sean and Rachael for grading our work!

%-- 9/3/2015 12:30 PM --%