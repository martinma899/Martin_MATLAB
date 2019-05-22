function [aout,bout] = recsolveHW1_3 (ain,bin)
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
        [aout,bout] = recsolveHW1_3(sol1,sol2);
    end
end

function [out] = calcdifference (beta1)

psi = 0.41;
phi = 0.5;
out = tand(beta1+25)-tand(beta1)-psi/phi;

end