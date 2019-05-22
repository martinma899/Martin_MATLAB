additionalangle = linspace(0,8,1000);
angleofattack = (additionalangle);
CL = 5.74*angleofattack*pi/180;
CM = -3.549*angleofattack*pi/180;
CD = 0.026*CL.^2;
figure(1)
plot(angleofattack,CL,'r-');
hold on
plot(angleofattack,CD,'r--');
xlabel('angle of attack/degrees');
legend('lift coefficient','drag coefficient')
title('CL and CD as functions of angle of attack')
plot(angleofattack,zeros(1,1000),'k-')
hold off
figure(2)
plot(CD,CL,'b--');
title('Drag Polar');
xlabel('CD')
ylabel('CL')
hold on
hold off

% do a 3D analysis of lift coefficient, flying speed vs. lift and weight

weightnet = 15*9.81/1000; % newton
safetyfactor = 1;
weight = safetyfactor*weightnet;
airdens = 1.225; %standard metric units
wingarea = 0.023419;
speed = linspace(0,8,1000);
[angleofattackmesh,speedmesh] = meshgrid(angleofattack,speed);
[CLmesh,speedmesh] = meshgrid(CL,speed);
Fl = CLmesh*0.5*airdens.*speedmesh.^2*wingarea;
Fl(Fl<=0) = 0;
Fl(Fl>=weight) = weight;
figure (3)
mesh(angleofattackmesh,speedmesh,Fl)
axis square
xlabel('angle of attack, degrees')
ylabel('flying speed, m/s')
zlabel('lift, newtons')