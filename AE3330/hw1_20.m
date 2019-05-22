clc;clear

Re = 6370e3;
mew = 0.3986e15;
hp = 400000;
ha = 900000;

rp = hp+Re
ra = ha+Re
a = (rp+ra)/2
vescp = sqrt(2*mew/rp)
vesca = sqrt(2*mew/ra)
vp = sqrt(mew*(2/rp-1/a))
va = sqrt(mew*(2/ra-1/a))

dvp = abs(vescp-vp)
dva = abs(vesca-va)

mi = 4500
Isp = 320
g = 9.81

mfuelp = mi*(1-exp(-dvp/(g*Isp)))
mfuela = mi*(1-exp(-dva/(g*Isp)))
