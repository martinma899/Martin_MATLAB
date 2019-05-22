function [aout,bout] = recsolve (ain,bin)
    searchrange = linspace(ain,bin,20);
    differences = calcdifference(searchrange);
    neg = sort(differences(differences<0));
    pos = sort(differences(differences>0));
    neg = neg(end);
    pos = pos(1);
    sol1 = searchrange(differences==neg);
    sol2 = searchrange(differences==pos);
    if abs(sol1-sol2)<0.000000000000001
        aout = sol1;
        bout = sol2;
    else
        [aout,bout] = recsolve(sol1,sol2);
    end
end

function [out] = calcdifference (x)

    k = 8.9875517873681764e9;
    m1 = 16e-3;
    m2 = 25e-3;
    q1 = -5e-9;
    q2 = -11e-9;
    out = m1.*(-m2.*x./m1).^2+m2.*x.^2-k*q1*q2/6e-2;

end