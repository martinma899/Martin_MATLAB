function median = fallAprob8 (vec)

    if length(vec) == 1
        median = vec;
    elseif length(vec) == 2
        median = mean(vec);
    else
        [~,maxi] = max(vec);
        vec(maxi) = [];
        [~,mini] = min(vec);
        vec(mini) = [];
        median = fallAprob8(vec);
    end

end