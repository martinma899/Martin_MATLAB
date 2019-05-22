resistance = [325 327 328 327 325 328 326 340 327 328 326 327];
offset = [-0.0125 -0.0048 -0.00484 -0.00760 -0.0135 -0.00727 -0.0110...
          -0.00953 -0.0110 -0.00556 -0.0133 -0.00311];

for i = 1:numel(resistance)
    rStdSoFar(i) = std(resistance(1:i));
    rAvgSoFar(i) = mean(resistance(1:i));
    oStdSoFar(i) = std(offset(1:i));
    oAvgSoFar(i) = mean(offset(1:i));
end