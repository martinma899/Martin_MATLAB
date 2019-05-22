function [answer] = columbsLaw (q1,q2,r)

    % A program that computes Columb's law's output from q1, q2 and r.
    
    % Define Columb's constant
    K = 9e9;
    
    % Use the formula to calculate the answer.
    answer = K*q1*q2/r^2;

end