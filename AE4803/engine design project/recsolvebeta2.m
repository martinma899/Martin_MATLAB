function [aout,bout] = recsolvebeta2 (ain,bin,Dfr,sigmar,w1,wt1,cz)
    searchrange = linspace(ain,bin,20);
    differences = calcdifference(searchrange,Dfr,sigmar,w1,wt1,cz);
    neg = sort(differences(differences<0));
    pos = sort(differences(differences>0));
    neg = neg(end);
    pos = pos(1);
    sol1 = searchrange(differences==neg);
    sol2 = searchrange(differences==pos);
    if abs(sol1-sol2)<0.0000000000001
        aout = sol1;
        bout = sol2;
    else
        [aout,bout] = recsolvebeta2(sol1,sol2,Dfr,sigmar,w1,wt1,cz);
    end
end

function [out] = calcdifference (beta2,Dfr,sigmar,w1,wt1,cz)

out = -Dfr+1-(cz./cosd(beta2))./w1+(cz.*tand(beta2)-wt1)./(2.*sigmar.*w1);

end