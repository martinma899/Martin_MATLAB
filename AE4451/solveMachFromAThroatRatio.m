function [M1out,M2out] = solveMachFromAThroatRatio (AThroatRatio,r,M1,M2,M3)
    errorthreshold = 0.0000000000001;
    error = 100000000;
    b1 = M1;b2 = M2;
    while error>errorthreshold
        Mvec = linspace(b1,b2,20);
        differencevec = calcdifference(AThroatRatio,Mvec,r);
        [b1,b2,error] = findclosestpair(Mvec,differencevec);
        if error==3921
            M1out = 'no solution';
            break
        end
        M1out = b1;
    end
    error = 100000000;
    b2 = M2;b3 = M3;
    while error>errorthreshold
        Mvec = linspace(b2,b3,20);
        differencevec = calcdifference(AThroatRatio,Mvec,r);
        [b2,b3,error] = findclosestpair(Mvec,differencevec);
        if error==3921
            M2out = 'no solution';
            break
        end
        M2out = b2;
    end
end

function [differencevec] = calcdifference(AThroatRatio,M,r)
differencevec = AThroatRatio - ...
  1./M.*((1+(r-1)/2.*M.^2)/((r+1)/2)).^((r+1)/(2*(r-1)));
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