clear

aarr = [];

n = 2;
a = n;

total = 20;

for i = 1:total
aarr = [aarr; a];
anext = (n^2*a+sqrt(n^4*a^2-4*(a^2-n^2)))/2;
a = anext;
end

disp(aarr)
