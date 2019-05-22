
P1 = 1200;
dAB = 1.25;
tAB = 0.5;
dBC = 2.25;
tBC = 0.375;

AAB = pi/4*(dAB^2-(dAB-2*tAB)^2)
ABC = pi/4*(dBC^2-(dBC-2*tBC)^2)
NAB = -P1
sigmaAB = NAB/AAB
P2 = -sigmaAB*ABC-P1