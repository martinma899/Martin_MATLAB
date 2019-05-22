function [M2] = prandtlmeyer (M1,theta,r,M2guess1,M2guess2)

    errorthreshold = 0.0000000000001;
    error = 100000000;
    M21 = M2guess1;M22 = M2guess2;
    while error>errorthreshold
        M2vec = linspace(M21,M22,20);
        differencevec = calcdifference(M2vec,M1,theta,r);
        [M21,M22,error] = findclosestpair(M2vec,differencevec);
        if error==3921
            M2 = 'no solution';
            break
        elseif error==1264
            M2 = M21;
            break
        end
        M2 = M21;
    end
    
end

function [out] = smallvfunc (Mvec,r)
    out = sqrt((r+1)/(r-1))*atand(sqrt((r-1)/(r+1)*(Mvec.^2-1)))...
        -atand(sqrt(Mvec.^2-1));
end

function [differencevec] = calcdifference (M2vec,M1,theta,r)
    differencevec = smallvfunc(M2vec,r)-smallvfunc(M1,r)-theta;
end

function [M21,M22,error] = findclosestpair(M2vec,differencevec)
    if any(differencevec==0)
        M21 = M2vec(differencevec==0);
        M22 = M2vec(differencevec==0);
        error = 1264;
        return
    end
    signvec = differencevec./abs(differencevec);
    posdiffsignvec = abs(diff(signvec));
    indexofbeta1 = find(logical(posdiffsignvec));
    if isempty(indexofbeta1)
        M21 = 0;M22 = 0;error = 3921;
    else
        M21 = M2vec(indexofbeta1(1));
        M22 = M2vec(indexofbeta1(1)+1);
        error = max(abs(differencevec([indexofbeta1(1) indexofbeta1(1)+1])));
    end
end