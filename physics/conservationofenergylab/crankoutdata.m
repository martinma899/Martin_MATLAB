function [out] = crankoutdata (data,m,f)

    pos = data(:,1);
    vel = data(:,2);
    
    
    deltaKE = [0;0.5*m*diff(vel.^2)];
    work = [0;f*diff(pos)];
    difference = work-deltaKE;
    
    out = [pos vel work deltaKE difference];

end