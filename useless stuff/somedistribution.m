function [coeffs] = somedistribution (n)
    coeffs = rec(n);
    coeffs(coeffs==0) = [];
    coeffs = abs(coeffs);
    plot(coeffs);
end

function [coeffs] = rec (n)
    switch n
        case 0
            coeffs = 1;
        case 1 
            coeffs = [1 0];
        otherwise
            coeffs = [rec(n-1) 0]-[0 0 rec(n-2)];
    end
end