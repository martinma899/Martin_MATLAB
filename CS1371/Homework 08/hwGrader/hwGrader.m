function [score] = hwGrader (solution,answer)

    fids = fopen(solution,'r');
    fida = fopen(answer,'r');
    
    fnameequal = isequal(fgetl(fids),fgetl(fida));
    
    i = 1;

    lines = fgetl(fids);
    linea = fgetl(fida);
    
    while ~isequal(lines,-1)
        logvec(i) = isequal(lines,linea);
        i = i+1;
        lines = fgetl(fids);
        linea = fgetl(fida);
    end
    
    score = fnameequal*round(100*sum(logvec)/length(logvec));
    
    fclose(fids);
    fclose(fida);

end