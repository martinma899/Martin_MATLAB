function [mag] = magnitude(vec)
    mag = sqrt(sum(vec.^2));
end