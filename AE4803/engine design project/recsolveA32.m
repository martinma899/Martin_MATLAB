function [aout,bout] = recsolveA32 (ain,bin,r,A31,M31,M32)
    searchrange = linspace(ain,bin,20);
    differences = calcdifference(searchrange,r,A31,M31,M32);
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
        [aout,bout] = recsolveA32(sol1,sol2,r,A31,M31,M32);
    end
end

function [out] = calcdifference (A32,r,A31,M31,M32)

out = exp(r.*M31.^2./2.*((1-A31./A32).^2)+(1-A31./A32).^6).*M31./M32.*...
  ((1+(r-1)./2.*M32.^2)./(1+(r-1)./2.*M31.^2)).^((r+1)./(2.*(r-1)))-A32./A31;

end