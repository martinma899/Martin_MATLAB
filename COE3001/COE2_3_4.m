clc; clear

lab = 0.5;
lbc = 0.25;
lcd = 0.25;
lde = 0.5;
Pb = 50;
Pc = 250;
Pe = 350;
A1 = 0.006;
A2 = 0.005;
A3 = 0.004;
E = 200e9;

deltade = Pe*lde/(E*A3)
deltacd = Pe*lcd/(E*A2)
deltabc = (Pe+Pc)*lbc/(E*A2)
deltaab = (Pc+Pe-Pb)*lab/(E*A1)

deltatot = sum([deltaab deltabc deltacd deltade])