function [aout,bout] = recsolveA32 (ain,bin,v,rho,S,CL0,CLalpha,CD0,K,W)
    searchrange = linspace(ain,bin,20);
    differences = calcdifference(searchrange,v,rho,S,CL0,CLalpha,CD0,K,W);
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
        [aout,bout] = recsolveA32(sol1,sol2,v,rho,S,CL0,CLalpha,CD0,K,W);
    end
end

function [out] = calcdifference (alpha,v,rho,S,CL0,CLalpha,CD0,K,W)

q = 0.5*rho*v^2;
out = q*S*((CL0+CLalpha.*alpha)+tan(alpha).*(CD0+K*(CL0+CLalpha.*alpha).^2))-W;

end