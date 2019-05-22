function [out] = slidinDemDMs (in)

    % This entire chunk of code finds how many whatever is in the sentence.
    % Then we multiply these variables with their according factors and add
    % them together. Except for the stupid heyyyy thing... oh sugar honey
    % ice tea...
    smilefacesleft = length(strfind(in,':)'));
    smilefacesright = length(strfind(in,'(:'));
    winkyfaceleft = length(strfind(in,';)'));
    winkyfaceright = length(strfind(in,'(;'));
    heart = length(strfind(in,'<3'));
    exclamationmark = length(strfind(in,'!'));
    baelower = length(strfind(in,'bae'));
    baeupper = length(strfind(in,'BAE'));

    % So starting from here we start to count the hey thing. Honestly I
    % wrote it correctly and I immediately forgot how I did it because my
    % brain just can't keep track of these stuff anymore... let matlab do
    % it for me... thanks!
    
    % Given there's only one Hey either being 'Hey' or 'HEY', doing the
    % following commands would certainly result in 1 or 0. We are gonna
    % turn these 1 and 0 into logical values and determine whether we do
    % the capital letter case or lower letter case.
    heylower = length(strfind(in,'Hey'));
    heyupper = length(strfind(in,'HEY'));
    
    % if detected the only hey is lower case...
    if logical(heylower)
        % write a stupid complicated loop that I don't even wanna discuss
        % to find what the score of this 'heyyy' is...
        y = strfind(in,'Heyy')+4;
        hey = 2;
        while y<=length(in)&&in(y)=='y'
            hey = hey+2;
            y = y+1;
        end
    % if detected the only hey is upper case...
    elseif logical(heyupper)
        % do the same thing but in capital Y.
        y = strfind(in,'HEYY')+4;
        hey = 2;
        while y<=length(in)&&in(y)=='Y'
            hey = hey+2;
            y = y+1;
        end
    % if there's no hey, hey gets 0 points. DUH.
    else
        hey = 0;
    end
    
    % calculate the score by multiplying the correct scaling factors and
    % adding all those things together, and finally adding hey.
    score = 5*smilefacesleft+5*smilefacesright+10*winkyfaceleft+...
            10*winkyfaceright+heart*15+2*exclamationmark+...
            5*baelower+5*baeupper+hey;
    
    % do the correct output pathetic strings. Ahhh obviousely I've been 
    % flirting with someone for a long time and I don't even know. Oh well
    % whatever.
    if score>=0&&score<=14
        out = 'You are looking for love in all the wrong places.';
    elseif score>=15&&score<=29
        out = 'Like a ball at the top of a hill, you have potential.';
    elseif score>=30
        out = 'Are you a bank? Because you have acquired interest!';
    end
        
end

%{
Function Name: slidinDemDMs

Inputs: 1. (char) An input string representing a message from your romantic
interest

Outputs: 1. (char) An output string describing your result

Function Description: As you are paying close attention to your professor
in your CS 1371 lecture, you are distracted by a couple in the row in front
of you. There is some serious flirtation going on, and you find yourself
thinking, “Hey, I want what they have!” The only problem is that while it
is easy to see and identify someone else trying to flirt, you are
completely lost as to whether the person you flirt with is flirting back or
not. Luckily, as a quickly burgeoning programming aficionado, you decide to
employ MATLAB to help you out.

Write a function in MATLAB called slidinDemDMs() that will take in a string
representing a text or other direct message from your crush and output a
description of his or her interest. You will do this by calculating a score
for the message based on the frequency of specific characters in the
message as follows:

Character Points:

':)' or '(:' 5 ';)' or '(;' 10 '<3' 15 '!' 2 'bae' 5 'Heyy' 2 (+2 for each
additional 'y')
 
You will then output one of the following results based on the total score
of your input: Score Function Output 0-14 'You are looking for love in all
the wrong places.' 15-29 'Like a ball at the top of a hill, you have
potential.' 30+ 'Are you a bank? Because you have acquired interest!' For
example, the input 'I <3 MATLAB!!!!! :)' from your crush would get a score
of 30 and the output would be 'Are you a bank? Because you have acquired
interest!'. All words will be separated by spaces.

Notes: ? Keywords 'bae' and 'Heyy' can be capitalized or lowercase—account
for both. ? You will only have one instance of the 'Heyy' pattern in any
given input string. ? This program has a less than 100% effectiveness rate
in real life—tread lightly.

Hints: ? The strfind() function may be useful.
%}

% Thank you Sean and Rachael for grading our work!

% Done on Thursday night. I mean comments. Actual code stuff was done on
% Monday night. BTW test was easy. Thx.