clc;clear

vec = [4 8 4 8 1];
multiplier = 8;
tempo = 74;

desiredtime = (60*2+45)
actualtime = multiplier*sum(vec)/tempo*60
timediff = actualtime-desiredtime
beatdiff = (actualtime-desiredtime)*tempo/(60*multiplier)

clear

vec = [4 4 4 8 1 8 8 1 4 2];
multiplier = 8;
tempo = 67;

desiredtime = (60*4+30)
actualtime = multiplier*sum(vec)/tempo*60

beatdiff = (actualtime-desiredtime)*tempo/(60*multiplier)