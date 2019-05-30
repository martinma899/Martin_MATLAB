function [M2] = nshockM2(M1,r)

    M2 = sqrt((M1^2+2/(r-1))/(2*r/(r-1)*M1^2-1));

end