for i = 1:10000
    x = rand(1,6)*380;
    y = rand(1,6)*518;
    
    beam = [x;y];
    
    imgname = 'Zurg1.png';
    
    theirans = defeatZurg_soln(imgname,beam);
    myans = defeatZurg(imgname,beam);
    pause(0.01);
    bool = isequal(theirans,myans);
    if ~bool
        disp('shit!');
    end
end