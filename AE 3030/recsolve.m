function [aout,bout] = recsolve (ain,bin)
    searchrange = linspace(ain,bin,11);
    differences = calcdifference(searchrange);
    neg = sort(differences(differences<0));
    pos = sort(differences(differences>0));
    neg = neg(end);
    pos = pos(1);
    sol1 = searchrange(differences==neg);
    sol2 = searchrange(differences==pos);
    if abs(sol1-sol2)<1e-10
        aout = sol1;
        bout = sol2;
    else
        [aout,bout] = recsolve(sol1,sol2);
    end
end

function [out] = calcdifference (M)

Cp0min = -0.41;
r = 1.4;
out = 2./(r*M.^2).*(((1+(r-1)/2*M.^2)/(1+(r-1)/2)).^(r/(r-1))-1)-Cp0min./(1-M.^2);

end