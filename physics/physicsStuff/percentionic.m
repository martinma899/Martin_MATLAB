function [ionic] = percentionic(e1,e2)
    ionic = 1-exp(-1/4*(e1-e2)^2);
end