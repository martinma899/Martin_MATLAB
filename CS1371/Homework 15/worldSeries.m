function [win,vic,mosthalf,mostinn,blankhalf] = worldSeries (data,teams)

    win = teams{sum(data,2)==max(sum(data,2))};

    vic = abs(diff(sum(data,2)));
    
    mosthalf = max(max(data));
    
    mostinn = max(sum(data));
    
    blankhalf = sum(sum(~logical(data)));
    
end