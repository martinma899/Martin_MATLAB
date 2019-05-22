function [fulldata,threeparams] = processdata (data,m)

    elevation = 0.08;
    d = 1.475;
    
    p = data(:,2);
    v = data(:,3);
    g = 9.81;
    
    xmin = min(p);
    
    U = m.*g.*(xmin-p).*elevation./d;
    K = 0.5.*m.*v.^2;
    
    E = U+K;
    
    fulldata = [data K U E];
    
    threeparams(1) = mean(E);
    threeparams(2) = std(E);
    threeparams(3) = std(E)/sqrt(6);
    
    threeparams = threeparams';
end