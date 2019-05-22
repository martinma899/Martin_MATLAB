vec = [1,2,3,5,4,8,0.5,4];   

    F = vec(1);
    G = 1;
    
    for n = 1:length(vec)
        if vec(n)<F
            F = vec(n);
            G = n;
        end
    end
    
    disp(F)
    disp(G)