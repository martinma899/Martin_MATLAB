clc;clear;close all

l = 13; % 13 distance of half the scissor in inch
a = 1.25; % piston top attachment vertial distance from scissor center
b = 1.5; % pistor top attachment horizontal distance from scissor center
c = 2.375; % piston bottom attachment from bottom joint

F = 33/2; % 33

h = 10; % height of scissor lift

figure(1)
hold on
figure(2)
hold on
for h = linspace(3,18,100);

epsilon = atand(a/b)

alpha = asind(h/2/l) % scissor angle relative to horizontal
beta = atand(a/(b+l)) % angle of piston mounting structure triangle

d1 = sqrt(a^2+(b+l)^2) % hypotenuse of mounting structure triangle
lb = 2*l*cosd(alpha) % base width of current scissor lift
d2 = sqrt(c^2+lb^2-2*c*lb.*cosd(alpha)) % distance from bottom piston mount to opposite bottom joint

delta = asind(sind(alpha)*c/d2) 
lp = sqrt(d1^2+d2.^2-2*d1*d2.*cosd(alpha+beta-delta)) % length of piston


gamma = asind(sind(alpha+beta-delta)*d1/lp)-delta % angle of piston relative to horizontal

% plot(h,lp)
% xlabel('h, in')
% ylabel('lp, in')


A = [0 -1 0 1 cosd(gamma) 0; 
    0 0 1 0 sind(gamma) 0;
    0 l*sind(alpha) 0 0 cosd(90-gamma-alpha)*b+sind(90-gamma-alpha)*a 2*F*l*cosd(alpha);
    1 0 0 1 cosd(gamma) 0;
    l*sind(alpha) 0 0 0 sind(gamma)*(l-c)*cosd(alpha)-cosd(gamma)*(l-c)*sind(alpha) 2*F*l*cosd(alpha)];

redA = rref(A);
Fbx = redA(1,6);
Fdx = redA(2,6);
Fcy = abs(redA(3,6));
Fcx = abs(redA(4,6));
Fp = redA(5,6);

figure(1)
% plot(h, Fbx, 'k.')
% plot(h, Fdx, 'b.')
plot(h, Fcx, 'r.')
plot(h, Fcy, 'g.')
plot(h, Fp, 'bo')


figure(2)
plot(h, lp, 'r.')
end

figure(1)
grid on
legend('Fcx', 'Fcy', 'Fp')
xlabel('h, in')
ylabel('force, lbf')
ax = gca;
ax.XLim = [0 h];
ax.YLim(1) = 0;


figure(2)
grid on
axis([0,h,0,h])
xlabel('h, in')
ylabel('lp, in')