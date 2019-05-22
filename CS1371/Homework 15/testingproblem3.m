for i = 1:10000
    size = rand(1)*3+1;
    height = rand(1)*1000;
    theirans = rainfall_soln(size,height);
    myans = rainfall(size,height);
    bool = isequal(theirans,myans);
    if ~bool
        disp('shit!');
        disp(char(12));
        disp(['size: ' num2str(size)]);
        disp(char(12));
        disp(['height: ' num2str(height)]);
        disp(char(12));
        disp(['theirans: ' num2str(theirans)]);
        disp(char(12));
        disp(['myans: ' num2str(myans)]);
        disp(char(12));
    end
end