function [K] = Kmatgen (n)
    if n == 1
        K = 2;
    else
        K = zeros(n,n);
        K(1,1) = 2;
        for i = 2:n
            K(i,i) = 2;
            K(i-1,i) = -1;
            K(i,i-1) = -1;
        end
    end
    K(n,n) = 1;
end