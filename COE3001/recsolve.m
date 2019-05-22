function [aout,bout] = recsolve (ain,bin)
    searchrange = linspace(ain,bin,20);
    differences = calcdifference(searchrange);
    neg = sort(differences(differences<0));
    pos = sort(differences(differences>0));
    neg = neg(end);
    pos = pos(1);
    sol1 = searchrange(differences==neg);
    sol2 = searchrange(differences==pos);
    if abs(sol1-sol2)<0.000000001
        aout = sol1;
        bout = sol2;
    else
        [aout,bout] = recsolve(sol1,sol2);
    end
end

function [out] = calcdifference (a)

l = 10;
q0 = 200;
M0 = 400;

f1 = a*q0*0.5;
f2 = (l-a)*q0*0.5;

Rb = (f1.*2/3.*a+f2.*(a+2/3.*(l-a))+M0)./l;
Ra = f1+f2-Rb;

x0 = sqrt(Ra.*a/100);

out = x0-l/2;

end