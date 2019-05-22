function [betaa,betab] = shockangle (M1,theta,r,beta1,beta2,beta3)
    errorthreshold = 0.0000000000001;
    error = 100000000;
    b1 = beta1;b2 = beta2;
    while error>errorthreshold
        betavec = linspace(b1,b2,20);
        differencevec = calcdifference(betavec,M1,theta,r);
        [b1,b2,error] = findclosestpair(betavec,differencevec);
        if error==3921
            betaa = 'no solution';
            break
        end
        betaa = b1;
    end
    error = 100000000;
    b2 = beta2;b3 = beta3;
    while error>errorthreshold
        betavec = linspace(b2,b3,20);
        differencevec = calcdifference(betavec,M1,theta,r);
        [b2,b3,error] = findclosestpair(betavec,differencevec);
        if error==3921
            betab = 'no solution';
            break
        end
        betab = b2;
    end
end

function [differencevec] = calcdifference(betavec,M1,theta,r)
differencevec = tand(theta)-2./tand(betavec).*...
    (M1^2*sind(betavec).^2-1)./(M1^2.*(r+cosd(2*betavec))+2);
end

function [beta1,beta2,error] = findclosestpair(betavec,differencevec)
    signvec = differencevec./abs(differencevec);
    posdiffsignvec = abs(diff(signvec));
    indexofbeta1 = find(logical(posdiffsignvec));
    if isempty(indexofbeta1)
        beta1 = 0;beta2 = 0;error = 3921;
    else
        beta1 = betavec(indexofbeta1(1));
        beta2 = betavec(indexofbeta1(1)+1);
        error = max(abs(differencevec([indexofbeta1(1) indexofbeta1(1)+1])));
    end
end