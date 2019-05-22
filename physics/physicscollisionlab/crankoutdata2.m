function [out] = crankoutdata2 (data,ml,mr)

    slope = data(1);
    intercept = data(2);
    leftv = data(3);
    leftt = data(4);
    rightv = data(5);
    rightt = data(6);
    
    tavg = (leftt+rightt)./2;

    predictedvli = slope*tavg+intercept;
    
    Ki = 0.5*ml*predictedvli.^2;
    
    Kf = 0.5*ml*leftv.^2+0.5*mr*rightv.^2;
    
    deltak = Ki - Kf;
    
    finalratio = deltak/Ki;
    
    out = [slope intercept predictedvli Ki ...
        leftv leftt rightv rightt Kf deltak finalratio];
    out = out';
end