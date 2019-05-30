function [aout,bout] = recsolve (ain,bin)
    searchrange = linspace(ain,bin,20);
    differences = calcdifference(searchrange);
    neg = sort(differences(differences<0));
    pos = sort(differences(differences>0));
    neg = neg(end);
    pos = pos(1);
    sol1 = searchrange(differences==neg);
    sol2 = searchrange(differences==pos);
    if abs(sol1-sol2)<0.0000000001
        aout = sol1;
        bout = sol2;
    else
        [aout,bout] = recsolve(sol1,sol2);
    end
end

function [out] = calcdifference (M)

r = 1.2;
d = 3;
As = pi/4*d^2;
Ae = As*50;

out = (Ae/As)^2-1./M.^2.*(2./(r+1)*(1+(r-1)/2.*M.^2)).^((r+1)/(r-1));

end