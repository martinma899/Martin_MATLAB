P = [0.7 0.6 0.4;0.2 0.3 0.4;0.1 0.1 0.2];
v = [0.2;0.2;0.6];
blah = [];
for i = 1:10000
    blah = [blah v];
    v = P*v;
end
plot(blah(1,:),blah(2,:),'b.');
