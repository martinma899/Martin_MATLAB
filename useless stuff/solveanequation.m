x1 = linspace(0,1,1000);
y1 = 25+0.4*0.4*9.8./x1.^2.*(log(1-8*x1/(0.4*9.8))-8*x1/(0.4*9.8));
[x1' y1']

x2 = linspace(0.422422422422422,0.423423423423423,1000);
y2 = 25+0.4*0.4*9.8./x2.^2.*(log(1-8*x2/(0.4*9.8))-8*x2/(0.4*9.8));
[x2' y2']

x3 = linspace(0.422954486017549,0.422955488020553,1000);
y3 = 25+0.4*0.4*9.8./x3.^2.*(log(1-8*x3/(0.4*9.8))-8*x3/(0.4*9.8));
[x3' y3']