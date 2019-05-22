dist = 5:23;
volt = [1.00 1.89 2.59 3.06 3.50 3.88 4.25 4.59 4.92 5.22 5.54 5.82 ...
    6.18 6.53 6.91 7.33 7.79 8.30 9.23];
field = diff(volt')*100;

weirdxexp = [4470 1630 853 535 378 292 242 214 202];
weirdxexp = [weirdxexp weirdxexp(end:-1:1)];

[sortedweirdxexp,index] = sort(weirdxexp);
sortedfield = field(index);
plot(sortedweirdxexp,sortedfield,'bo')
hold on
plot(sortedweirdxexp,sortedfield,'b-')
hold off

coeffs = polyfit(sortedweirdxexp',sortedfield,1)