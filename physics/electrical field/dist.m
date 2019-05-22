function [r] = dist(vec1,vec2)
    r = sqrt(sum((vec2-vec1).^2));
end