function [urot] = rotUaroundV (u,v,t) 

% calculate theta and phi for v
phi = angle(v(1)+1i*v(2));
theta = acos(v(3)/norm(v));

RotPhi_Z = [cos(phi) -sin(phi) 0;
  sin(phi)  cos(phi) 0;
  0         0        1];
RotTheta_Y = [cos(theta) 0 sin(theta);
  0       1      0;
  -sin(theta) 0  cos(theta)];

Rott_Z = [cos(t) -sin(t) 0;
            sin(t)  cos(t) 0;
            0         0        1];
          
urot = RotPhi_Z*RotTheta_Y*Rott_Z*inv(RotTheta_Y)*inv(RotPhi_Z)*u;


end