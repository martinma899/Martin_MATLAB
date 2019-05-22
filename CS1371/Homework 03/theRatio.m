
function [twoYears] = theRatio (female,total,years)

    % Calculates the two years between which female proportion increased the greatest

    % Use the diff function to calculate the ratio's growth rate vector.
    difference = diff(female./total);
    
    % Use the max function to find the index of the maximum growth rate. 
    [maxi,index] = max(difference);
    
    % Use the index to construct a vector of two years from the vector of
    % the list of years.
    twoYears = years(index:index+1);

end

%{

Function Name: theRatio

Inputs: 1. (double) A 1XN vector of the number of female students enrolled
at Georgia Tech 2. (double) A 1XN vector of the total number of students
enrolled at Georgia Tech 3. (double) A 1XN vector corresponding to the year
of enrollment

Outputs: 1. (double) A 1X2 vector of the years corresponding to the largest
growth in the ratio

Function Description:  We have all experienced, at one time or another, the
rather prevalent “ratio” of females on Georgia Tech’s campus. Ever since
the first woman stepped foot on Tech’s campus, Tech has boasted about its
tremendous strides in increasing the number of women in the field of
engineering. Being the MATLAB whiz that you are, you have decided to
calculate Tech’s achievements in female recruitment and prove in which year
GT was most successful.

Given a vector of the number of women enrolled at Tech per year, a vector
of the total number of students enrolled at Tech per year, and a vector
corresponding to the year of enrollment, write a function called theRatio
that will output a 1X2 vector of the two consecutive years between which
there was the largest increase in the ratio of women to total students at
Georgia Tech.

Example:  Say in 1990 there were 580 females at GT and 1673 total students.
In 1991 there were 602 females and 1721 total students. The change in the
ratio between these two years is calculated by dividing the number of
females by the total number of students for each year, and finding the
difference between these two values:

ratio = (602/1721) – (580/1673) 
ratio= 0.0031

If this were the largest positive change, then the output year vector would
look like [1990, 1991].

Notes: ? It is guaranteed that the ratio growth will not be the same
between multiple years. ? The years will always be listed in chronological
order. ? You do not have to account for any disparate spacing between year
intervals.

%}

% Thank you Sean and Rachael for grading our work!

%-- 9/3/2015 12:30 PM --%