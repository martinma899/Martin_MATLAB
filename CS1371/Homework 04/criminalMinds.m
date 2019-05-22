function [string] = criminalMinds (v1,v2,v3,v4)

    % This function does the criminalMinds homework and does not have any practical use.

    % Create an empty vector that records the comparison result of every
    % one person's answer to that of the rest.
    bvec = zeros(1,4);
    
    % Compare everyone's response to that of the rest of them, using a
    % helper function that I wrote that basically does the exact same thing
    % as isequal, only specifically for logical vectors. Everyone should
    % compare 3 times. People who are not lying will have the result of two
    % trues and one false, while the lyer will have all three comparisons
    % being false. Then use the any function on these three element logical
    % vectors. The innocent people should have true, while the only lyer, 
    % having three falses, will be assigned false.
    bvec(1) = any([logicmp(v1,v2),logicmp(v1,v3),logicmp(v1,v4)]);
    bvec(2) = any([logicmp(v1,v2),logicmp(v2,v3),logicmp(v2,v4)]);
    bvec(3) = any([logicmp(v3,v2),logicmp(v4,v3),logicmp(v1,v3)]);
    bvec(4) = any([logicmp(v1,v4),logicmp(v4,v2),logicmp(v3,v4)]);
    
    % Turn around true and false in the vector that records the 4 people's 
    % innocence because the stupid find feature can only find true and 
    % cannot find false. 
    bvec = ~bvec;
    
    % Find the index of the only true in the reversed vector. That's the
    % lying dude's designation.
    [~,badguy] = find(bvec,true);
    
    % Format this number designation into a string.
    string = sprintf('Suspect #%d is lying.', badguy);
    
end

function [bool] = logicmp(vec1,vec2)

    % This function basically compares two logical vectors using a very
    % elegant way (not the brutal num2str and strcmp that obliterates
    % everything way) and returns a boolean value.

    bool = all(vec1==vec2);

end

%{

Function Name: criminalMinds

Inputs: 1. (logical) Vector of suspect #1’s answers to a lie detector 2.
(logical) Vector of suspect #2’s answers to a lie detector 3. (logical)
Vector of suspect #3’s answers to a lie detector 4. (logical) Vector of
suspect #4’s answers to a lie detector Outputs: 1. (char) Sentence stating
which suspect is lying

Function Description:  After all of those years of reading Nancy Drew and
watching Bones, you realize that your true passion lies in justice and
bringing criminals to light. After tedious years of training with the FBI,
you are finally working a case, and you have four suspects—only one of
which is the true criminal. You give them each a separate lie detector test
and plan to use the results to find which of the four suspects is lying to
you.  Each suspect who is telling the truth will give the same
corresponding yes or no (true or false) answers, since that is how real
life innocent suspects behave, while the suspect who is lying will not
corroborate his/her answers with the other three.  Since you were a pro at
MATLAB back in your engineering days, you decide to write code to assist
you in finding the criminal.

Write a function with four inputs, where each input is a logical vector
corresponding to the answers a suspect gives on the lie detector.  Three of
the suspects will have the exact same answers, but one suspect’s answers
will be slightly—or completely—different than the others’ answers.  Using
your knowledge of logical indexing and masking, find which of the four
suspects is lying, and, thus, is the criminal.  The output string will be
of the form 'Suspect #_ is lying.' Where the ‘_’ corresponds to suspect
number who is lying and the number is from the input order.

Notes: ? The suspect who is the liar will have at least one answer that is
different from the other suspects’ answers, but could differ up to every
answer. ? You may not use the isequal() function to code this problem.  Use
of the isequal() function will result in zero credit for this problem.

%}

% Thank you Sean and Rachael for grading our work!! Your recitations are
% awesome! Don't tell anyone else but it is better than lecture. Yup.

%-- 9/8/2015 3:23 PM --%