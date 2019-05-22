function [] = topPun (name,scorevec)

    titlestr = [name '''s Total Score'];

    days = [0 1:length(scorevec)];
    scorevec = [0 cumsum(scorevec)];
    
    figure(2);
    box on
    hold 
    plot(days,scorevec,'r');
    plot(days,scorevec,'ro');
    xlabel('Day');
    ylabel('Score');
    title(titlestr);
    hold
    
end
%{
topPun 1.	(char) A string of the name of a recruit enrolled in the
academy 2.	(double) A vector containing the scores earned each day
 
Outputs: (none)
 
Plots: 1. A plot of the total score earned by the recruit
 
Function Description: Welcome to your first day on the job as an analyst at
Top Pun, an intense 9-week long program that trains the best of the best in
the art of the pun. The recruits you’ll be working with are masters of the
Pundamentals, and may even think that they can Cruise through this course.
However, they’ll soon learn that they’re way in over their heads. By the
end of this program, graduates will possess a degree in Advanced
Homophonics, allowing them to Kil-more words than a teenager’s Twitter
account. Each day of the program, recruits receive scores based on the
number of creative and worthy puns that they make. As our new technical
analyst, your job is to keep track of each recruit’s progress over the
course of the program. You will be given a recruit’s name and the scores
that he or she earned during each day of training. You are not guaranteed
to have a fixed number of scores, but you know that the first score will be
the points earned during Day 1, and each subsequent score will correspond
to the following day. Given a string of the recruit’s name and a vector
containing these scores, write a MATLAB function that plots the recruit’s
total cumulative score over days. You should add the point (0,0) to the
beginning of you data, as this indicates progress from Day 0 to Day 1. For
example, if your vector of scores is [2,3,1], then you should plot the
points (0,0); (1,2); (2,5); and (3,6). Your plot should be formatted as
follows: •	Your line style should be solid red with a circle marker at
each point. •	The title should read '<name>''s Total Score' where <name>
is replaced by the recruit’s name. •	Label your x-axis 'Day'. •	Label
your y-axis 'Score'.
 
Hints: ? The function cumsum()can do all the heavy lifting.

%}