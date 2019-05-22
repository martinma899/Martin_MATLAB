function [out] = emag1 (source,distance)
    k = 8987551787.36818;
    out = k*source/distance^2;
end