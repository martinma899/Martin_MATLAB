clc;clear
sigmaxx = 10;
sigmayy = -12;
sigmaxy = 5;
R = sqrt(((sigmaxx-sigmayy)/2)^2+sigmaxy^2)
C = (sigmaxx+sigmayy)/2
twothetap = atand(sigmaxy/((sigmaxx-sigmayy)/2))
total = -(twothetap+80)

sigmaxxn = R*cosd(total)-C
sigmayyn = R*cosd(total)+C
sigmaxyn = R*sind(total)