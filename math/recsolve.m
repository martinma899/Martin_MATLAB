function [aout,bout] = recsolve (ain,bin)
    searchrange = linspace(ain,bin,20);
    differences = calcdifference(searchrange);
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
        [aout,bout] = recsolve(sol1,sol2);
    end
end

function [out] = calcdifference (x)

m = 0.155;
r = 0.375;
M = 1;
vrel = 0.8;


omegarel = vrel/r;
Ic = m*r^2;
Iw = M*r^2;

out = Ic*(omegarel+x)+Iw*x;

end